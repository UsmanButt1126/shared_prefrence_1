import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_prefrence_1/passenger.dart';
import 'admin.dart';
import 'driver.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var uEmail= TextEditingController();
  var uPass= TextEditingController();
  var uAge= TextEditingController();
  String userType = 'Passenger';
  List<String> userTypes = [  "Passenger" , "Driver"];
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        title: const Text("Login"),
      ),
      body: Center(
        child: Container(
          width: 700,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: 350,
                child: TextField(

                  controller: uEmail,
                  decoration: InputDecoration(
                      hintText: "Enter Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: const BorderSide(
                            color: Colors.cyanAccent,
                          )
                      ),
                      prefixIcon: const Icon(Icons.email)
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Container(
                width: 350,
                child: TextField(

                  controller: uAge,
                  decoration: InputDecoration(
                      hintText: "Enter Age",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: const BorderSide(
                            color: Colors.cyanAccent,
                          )
                      ),
                      prefixIcon: const Icon(Icons.numbers)
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Container(
                width: 350,
                child: TextField(
                  controller: uPass,
                  obscureText: true,
                  obscuringCharacter: "*",
                  keyboardType: TextInputType.phone,

                  decoration: InputDecoration(
                      hintText: "Enter Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: const BorderSide(
                            color: Colors.cyanAccent,
                          )
                      ),
                      prefixIcon: const Icon(Icons.password_sharp)
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Container(
                width: 350,
                child: DropdownButtonFormField(
                  value: userType,
                  items: userTypes.map((type) {
                    return DropdownMenuItem(
                      value: type,
                      child: Text(type),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      userType = value.toString();
                    });
                  },
                  decoration: InputDecoration(
                      hintText: 'User Type',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: const BorderSide(
                            color: Colors.cyanAccent,
                          )
                      ),
                      prefixIcon: const Icon(Icons.person)
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Container(
                width: 300,
                //color: Colors.blue,
                child: ElevatedButton(onPressed: ()async{
                  SharedPreferences sp= await SharedPreferences.getInstance();
                  //SharedPreferences sp = await SharedPreferences.getInstance();

                  // Save data based on user type
                  if (userType == "Passenger") {
                    sp.setString("Passenger_email", uEmail.text.toString());
                    sp.setString("Passenger_age", uAge.text.toString());
                  } else if (userType == "Driver") {
                    sp.setString("Driver_email", uEmail.text.toString());
                    sp.setString("Driver_age", uAge.text.toString());
                  }

                  sp.setString("userType", userType.toString());
                  sp.setBool("isLogin", true);

                  // Navigate based on user type
                  checkUser(userType.toString());
                  setState(() {

                  });

                }, child: const Text("Log in", style: TextStyle(color: Colors.black),),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue
                    ) ),
              ),
              const SizedBox(height: 10,),
              Container(
                width: 300,
                //color: Colors.blue,
                child: ElevatedButton(onPressed: () {

Navigator.push(context, MaterialPageRoute(builder: (context)=>Admin()));
                }, child: const Text("Go to Admin Pannel", style: TextStyle(color: Colors.black),),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue
                    ) ),
              ),
            ],
          ),


        ),

      ),
    );
  }

  void checkUser(String userType) {
    if (userType == "Passenger") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Passenger()));
    } else if (userType == "Admin") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Admin()));
    } else if (userType == "Driver") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Driver()));
    }
  }


}
