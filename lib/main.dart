import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation_app/Widget/category_card.dart';
import 'package:meditation_app/constant.dart';

import 'Screen/detail_screen.dart';
import 'Widget/bottom_nav_bar.dart';
import 'Widget/search_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meditation App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       fontFamily: "Cairo",
       scaffoldBackgroundColor: kBackgroundColor,
       textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      home: DetailScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
      body: Stack(children: [
        Container(
          height: size.height * .45,//45 % of height
          decoration:  BoxDecoration(
            color: Color(0xFFF5CEB8),
            image: DecorationImage(
              alignment: Alignment.centerLeft,
              image: AssetImage('assets/images/undraw_pilates_gpdb.png'),
            )
          ),
        ),
        SafeArea(child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                alignment: Alignment.center,
                height: 52,
                width: 52,
                decoration: BoxDecoration(
                  color: Color(0xFFF2BEA1),
                  shape: BoxShape.circle
                ),
                child: SvgPicture.asset("assets/icons/menu.svg"),
              ),
            ),
            Text("Good Morning \nSi Thu Myo",style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w800),),
            SearchBar(),
            Expanded(child: GridView.count(crossAxisCount: 2,childAspectRatio: .85,crossAxisSpacing: 20,mainAxisSpacing: 20,children: [
             CategoryCard(svgSrc: "assets/icons/Hamburger.svg",title: "Diet Recommendtation",press: (){},),
              CategoryCard(svgSrc: "assets/icons/Excrecises.svg",title: "Exercise",press: (){}),
               CategoryCard(svgSrc: "assets/icons/Meditation.svg",title: "Meditation",press: (){}),
                CategoryCard(svgSrc: "assets/icons/yoga.svg",title: "Yoga",press: (){}),
            ],)),
          ],
          
          ),
        ))
      ]),
    );
  }
}


