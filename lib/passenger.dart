import 'package:flutter/material.dart';

import 'login.dart';

class Passenger extends StatefulWidget {
  const Passenger({super.key});

  @override
  State<Passenger> createState() => _PassengerState();
}

class _PassengerState extends State<Passenger> {
  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        Container(
          height: 500,
          width: 500,
          child: Center(child: Text("PASSENGER")),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () async {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Login()),
            );
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          child: const Text(
            "Go to Login",
            style: TextStyle(color: Colors.white),
          ),
        ),   
      ],
    );
  }
}
