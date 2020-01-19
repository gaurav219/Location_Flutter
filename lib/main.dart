import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_location/services/location_services.dart';
import 'datamodels/user_location.dart';
import 'services/location_services.dart';
import 'package:flutter_location/views/home_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // StreamProvider<UserLocation> abc;
    return StreamProvider<UserLocation>(
        create: (context) => LocationService().locationStream,
        child: MaterialApp(
            title: 'Flutter Demo',
            home: Scaffold(
              body: HomeView(),
            )));
  }
}
