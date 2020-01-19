import 'dart:async';

import 'package:location/location.dart';
import 'package:flutter_location/datamodels/user_location.dart';

class LocationService {
  //Keep track of current location.
  UserLocation _current;

  Location location = Location();

  //Emit location updates continuosly
  StreamController<UserLocation> _location = StreamController<UserLocation>();

  // LocationService() {
  //   location.requestPermission().then((granted) {
  //     if (granted) {
  //       location.onLocationChanged().listen((locationData) {
  //         if (locationData != null) {
  //           _location.add(UserLocation(
  //             latitude: locationData.latitude,
  //             longitude: locationData.longitude,
  //           ));
  //         }
  //       });
  //     }
  //   });
  Stream<UserLocation> get locationStream => _location.stream;

  LocationService() {
    // Request permission to use location
    location.requestPermission().then((granted) {
      if (granted) {
        // If granted listen to the onLocationChanged stream and emit over our controller
        location.onLocationChanged().listen((locationData) {
          if (locationData != null) {
            _location.add(UserLocation(
              latitude: locationData.latitude,
              longitude: locationData.longitude,
            ));
          }
        });
      }
    });
  }

  Future<UserLocation> getLocation() async {
    try {
      var userLocation = await location.getLocation();
      _current = UserLocation(
          latitude: userLocation.latitude, longitude: userLocation.longitude);
    } catch (e) {
      print('Sorry!! Could not get the location');
      print(e);
    }
    return _current;
  }
}
