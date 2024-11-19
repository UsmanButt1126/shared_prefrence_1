import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminPageState();
}

class _AdminPageState extends State<Admin> {
  String email = "";
  String age = "";
  String userType = "";

  @override
  void initState() {
    super.initState();
    // Load default data when the admin screen opens.
    loadUserData("Passenger");
  }

  /// Load user data based on the type (Passenger or Driver).
  Future<void> loadUserData(String type) async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    setState(() {
      email = sp.getString("${type}_email") ?? "No Data";
      age = sp.getString("${type}_age") ?? "No Data";
      userType = type;
    });
  }

  /// Clear all saved user data.
  Future<void> clearData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.clear();

    setState(() {
      email = "No Data";
      age = "No Data";
      userType = "No Data";
    });

    // Navigate back to login screen

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        title: const Text("Admin Panel"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$userType Data",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Email: "),
                Text(email, style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Age: "),
                Text(age, style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await loadUserData("Passenger");
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text(
                "Show Passenger Data",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                await loadUserData("Driver");
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
              child: const Text(
                "Show Driver Data",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                await clearData();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text(
                "Clear All Data",
                style: TextStyle(color: Colors.white),
              ),
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
        ),
      ),
    );
  }
}
