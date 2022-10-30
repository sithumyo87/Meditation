import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meditation_app/constant.dart';

class CategoryCard extends StatelessWidget {
  final String svgSrc;
  final String title;
  final Function press;

  const CategoryCard({Key? key,required this.svgSrc,required this.title,required this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
                  // padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                    BoxShadow(
                      offset: Offset(0,17),
                      blurRadius: 17,
                      spreadRadius: -23,
                      color: kShadowColor
                    )
                  ]
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        press;
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(children: [
                          Spacer(),
                          SvgPicture.asset(svgSrc),
                          Spacer(),
                          Text(title,textAlign: TextAlign.center,style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 15),)
                        ]),
                      ),
                    ),
                  ),
                ),
    );
  }
}
