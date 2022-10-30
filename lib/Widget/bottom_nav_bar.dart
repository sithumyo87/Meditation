import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meditation_app/constant.dart';

class BottomNavItem extends StatelessWidget {
  final String svgSrc;
  final String title;
  final bool isActive;
  const BottomNavItem({Key? key,required this.svgSrc,required this.title,required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    
    GestureDetector(
            onTap: (){},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(svgSrc,color: isActive ?  kActiveIconColor : kTextColor),
                Text(title,style: TextStyle(color: isActive ?  kActiveIconColor : kTextColor),),
              ],
            ),
          );
  }
}