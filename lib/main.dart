import 'package:animator/view/home.dart';
import 'package:animator/view/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    Sizer(builder: (context, orientation, deviceType) =>  GetMaterialApp(
        routes: {
          '/':(context) => home(),
          'view':(context) => view(),
        },
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
