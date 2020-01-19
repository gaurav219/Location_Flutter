//import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../datamodels/user_location.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userLocation = Provider.of<UserLocation>(context);
    return Center(
      child: Text(
          'Location: Lat:${userLocation?.latitude}, Long:${userLocation?.longitude}'),
      // child: Text.rich(TextSpan(text: 'Location: ', children: <TextSpan>[
      //   TextSpan(
      //       text: '${userLocation.latitude}',
      //       style: TextStyle(fontSize: 32, color: Colors.red[400])),
      //   TextSpan(
      //       text: '${userLocation.longitude}',
      //       style: TextStyle(fontSize: 32, color: Colors.red[400]))
      // ])),
    );
  }
}
