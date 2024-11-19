import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_prefrence_1/admin.dart';
import 'package:shared_prefrence_1/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
      login();
  }

  void login() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool islogin = sp.getBool("isLogin") ?? false;

    if(islogin){
      Navigator.push(context, MaterialPageRoute(builder: ( context)=> Admin()));
    } else{
      Timer(Duration(seconds: 3),  (){
        Navigator.push(context, MaterialPageRoute(builder: ( context)=> Login()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        child: Container(
          height: double.infinity,
          child: Image(image:
          NetworkImage("https://images.immediate.co.uk/production/volatile/sites/7/2018/02/Earth-from-space-1-64e9a7c.jpg?quality=90&resize=980,654" ),fit: BoxFit.cover,),
        ),
      ),
    );
  }
}
