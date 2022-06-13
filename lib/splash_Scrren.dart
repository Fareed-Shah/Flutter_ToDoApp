import 'dart:async';

import 'package:flutter/material.dart';
import 'package:splash_screen/dashboard.dart';


class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);
  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {


@override
void initState(){

super.initState();
Timer(Duration(seconds: 5), 
()=>Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder:
                                                          (context) => 
                                                          Dashboard())));


}


  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body: Center(child: Text('Splash Screen')),
   ) ;
  }
}