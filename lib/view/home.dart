import 'dart:math';

import 'package:animator/screen/controller/p%20controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home>     with TickerProviderStateMixin {


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
  }
  Widget build(BuildContext context) {
    pController pc =pController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text("Hey, User!", style: GoogleFonts.playfairDisplaySc(color: Colors.black,fontWeight: FontWeight.bold)),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(CupertinoIcons.arrow_down_doc_fill, color: Colors.black54),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(CupertinoIcons.mail, color: Colors.black54),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(CupertinoIcons.person_circle, color: Colors.black54),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: pc.data.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Get.toNamed('view',arguments: index);
                        },
                        child: Container(
                          width: 70.w,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.indigo.shade900,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 80),
                                child: Text("${pc.data[index].name}",style: GoogleFonts.play(fontSize: 20,color: CupertinoColors.white ),),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50,vertical: 30),
                    child: AnimatedBuilder(builder: (context, child) {
                      return Transform.rotate(angle: animationController!.value * pi * 2,child: child);
                    },animation: animationController!,
                    child: Container(child: Image.asset("${pc.data[index].image}",height: 100,width: 100))),
                  ),

                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
  