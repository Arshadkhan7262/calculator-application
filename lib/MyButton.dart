import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'myconstants.dart';

class MYButton extends StatelessWidget{
  String title;
  Color color;
  final VoidCallback  onpress;

  MYButton({required this.title, required this.color, required this.onpress});

  @override
  Widget build(BuildContext context) {
   return Expanded(
     child: InkWell(
       onTap: onpress,
       child: Container(
         margin: EdgeInsets.all(5),
         height: 70,
         decoration: BoxDecoration(
           shape: BoxShape.circle,
               color: color,
         ),
         child: Center(child: Text(title,style: TextStyle(fontSize: 25,color: Colors.white),)),
       ),
     ),
   );
  }

}