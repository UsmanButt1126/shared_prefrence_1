import 'package:flutter/material.dart';

import 'login.dart';

class Driver extends StatefulWidget {
  const Driver({super.key});

  @override
  State<Driver> createState() => _DriverState();
}

class _DriverState extends State<Driver> {
  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        Container(
          height: 500,
          width: 500,
          child: Center(child: Text("Driver")),
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