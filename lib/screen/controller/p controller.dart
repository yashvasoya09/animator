import 'package:animator/screen/model/p%20model.dart';
import 'package:get/get.dart';

class pController extends GetxController
{
  RxList <pModel>data = [
    pModel(name: "Mercury",image: "assets/images/mercury.png",km: "74.8 million km²"),
    pModel(name: "Earth",image: "assets/images/earth.png",km: "510.1 million km²"),
    pModel(name: "Moon",image: "assets/images/moon.png",km: "127.5 million km²"),
    pModel(name: "Neptune",image: "assets/images/neptune.png",km: "7.618 billion km²"),
      pModel(name: "Mars",image: "assets/images/mars.png",km: "144.4 million km²"),
  ].obs;
}