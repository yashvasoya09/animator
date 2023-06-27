import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screen/controller/p controller.dart';

class view extends StatefulWidget {
  const view({super.key});

  @override
  State<view> createState() => _viewState();
}

class _viewState extends State<view> with TickerProviderStateMixin{

  AnimationController? animationController;
  AnimationController? mar;
  Animation? aligenTween;

  @override

  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    mar = AnimationController(vsync: this, duration: Duration(seconds: 2));

    aligenTween = TweenSequence([
      TweenSequenceItem(
          tween: Tween(begin: Alignment.topLeft, end: Alignment.topRight),
          weight: 1),
      TweenSequenceItem(
          tween: Tween(begin: Alignment.topRight, end: Alignment.topLeft),
          weight: 1),
    ]).animate(animationController!);

    aligenTween = TweenSequence([
      TweenSequenceItem(
          tween: Tween(begin: Alignment.bottomLeft, end: Alignment.bottomRight),
          weight: 1),
      TweenSequenceItem(
          tween: Tween(begin: Alignment.bottomRight, end: Alignment.bottomLeft),
          weight: 1),
    ]).animate(mar!);
    animationController!.repeat(reverse: false);
    mar!.repeat(reverse: true);
    animationController!.addListener(() {
      setState(() {});
    });
    mar!.addListener(() {
      setState(() {});
    });
  }  Widget build(BuildContext context) {
    pController pc =pController();
    int index = Get.arguments;
    return SafeArea(
      child: Scaffold(
        body: Column(
mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,          children: [
            SizedBox(height: 15),
            Center(child: Container(
              height: 350,
              width: 350,
              child: AnimatedBuilder(animation: animationController!,builder: (context, child) =>  Transform.rotate(angle:  animationController!.value * pi * 2,child: Image.asset("${pc.data[index].image}"))),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            )),
            SizedBox(height: 20),
            Text("${pc.data[index].name}",style: GoogleFonts.play(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),),
            SizedBox(height: 20),
            Text("${pc.data[index].km}",style: GoogleFonts.play(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
