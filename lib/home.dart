 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
   @override
   _HomeScreenState createState() => _HomeScreenState();
 }

 class _HomeScreenState extends State<HomeScreen> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body: SafeArea(
         child: SizedBox.expand(
           child: ListView(
             children: [
               Container(
                   padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                   child: Text("Users",style: TextStyle(
                     fontWeight: FontWeight.bold,fontSize: 17
                   ),)),
               listItem(),
               listItem(),
               listItem(),
               listItem(),

             ],
           ),
         ),
       ),
     );
   }

   listItem(){
     return Container(
       margin: EdgeInsets.all(10),
       padding: EdgeInsets.only(bottom: 1),
       color: Colors.black26,
       child: Container(

         padding: EdgeInsets.only(bottom: 10),
         color: Color(0xffdee1ed),
         child: Row(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             ClipRRect(
               borderRadius: BorderRadius.circular(25),
               child: Container(
                   height: 50,
                   width: 50,
                   child: Image.asset('assets/images/avatar.png',fit: BoxFit.fill,)),
             ),
             SizedBox(width: 10,),
             Text('Name'),

           ],
         ),
       )
     );
   }

 }
