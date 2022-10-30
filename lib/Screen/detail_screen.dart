import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation_app/constant.dart';

import '../Widget/bottom_nav_bar.dart';
import '../Widget/search_bar.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 40,vertical: 10),
        height: 80,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          BottomNavItem(svgSrc:"assets/icons/calendar.svg" ,title: "Now",isActive: false,),
          BottomNavItem(svgSrc:"assets/icons/gym.svg" ,title: "Gym",isActive: true,),
          BottomNavItem(svgSrc:"assets/icons/Settings.svg" ,title: "Settings",isActive: false,),
        ]),
      ),
      body: Stack(
        children: [
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color: kBlueLightColor,
              image: DecorationImage(
                image: AssetImage("assets/images/meditation_bg.png"),
                fit: BoxFit.fitWidth

              )
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * .05),
                  Text("Meditation",style: Theme.of(context).textTheme.headline4?.copyWith(fontWeight: FontWeight.w900),),
                   SizedBox(height: 10,),
                  Text("3-10 MIN Course",style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  SizedBox(width: size.width * .6,child: Text("If you want something you’ve never had, you must be willing to do something you’ve never done"),),
                  SizedBox(width: size.width * .5,child: SearchBar(),),
                  Wrap(
                    runSpacing: 20,
                    spacing: 20,
                    children: [
                     SessionCard(sessionNum: 1,isDone: true,press: (){},),
                     SessionCard(sessionNum: 2,isDone: false,press: (){}),
                     SessionCard(sessionNum: 3,isDone: false,press: (){}),
                     SessionCard(sessionNum: 4,isDone: false,press: (){}),
                     SessionCard(sessionNum: 5,isDone: false,press: (){}),
                     SessionCard(sessionNum: 6,isDone: false,press: (){}),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text("Meditation",style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0,17),
                          blurRadius: 23,
                          spreadRadius: -13,
                          color: kShadowColor
                        )
                      ]
                    ),
                    child: Row(children: [
                      SvgPicture.asset("assets/icons/Meditation_women_small.svg"),
                      SizedBox(width: 20,),
                      Expanded(child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Basic 2",style: Theme.of(context).textTheme.subtitle2,),
                          Text("Start your deepen you partice")

                        ],
                      )),
                      Padding(padding: EdgeInsets.all(10),child: SvgPicture.asset("assets/icons/Lock.svg"),),
                      
                    ]),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SessionCard extends StatelessWidget {
  final int sessionNum;
  final bool isDone;
  final Function? press;
  const SessionCard({Key? key,required this.sessionNum, this.isDone = false, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  LayoutBuilder(
      builder: (context, constraint) {
        return ClipRect(
          child: Container(
            width: constraint.maxWidth / 2 - 10,
            
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0,17),
                                    blurRadius: 23,
                                    spreadRadius: -13,
                                    color: kShadowColor
                                  )
                                ]
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap:(){},
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(children: [
                                      Container(
                                        // padding: EdgeInsets.all(16),
                                        width: 42,
                                        height: 43,
                                        decoration: BoxDecoration(
                                          color: isDone ? kBlueColor : Colors.white,
                                          shape: BoxShape.circle,
                                          border: Border.all(color: kBlueColor)
                                        ),
                                        child: Icon(Icons.play_arrow,color: isDone ? Colors.white : kBlueColor,),
                                      ),
                                      SizedBox(width: 10,),
                                      Text("Session $sessionNum",style: Theme.of(context).textTheme.subtitle2,),
                                    ]),
                                  ),
                                ),
                              ),
                            ),
        );
      }
    );
  }
}