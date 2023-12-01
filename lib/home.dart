import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:http/http.dart' as http;
// import 'dart:io';
// import 'dart:convert';
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:url_launcher/url_launcher_string.dart';
// import 'package:flutter_process_spawn/flutter_process_spawn.dart';

// import 'login.dart';
class Home extends StatefulWidget {
  static String id = 'home_screen';

  const Home({super.key});
  

  @override
  State<Home> createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  

  bool isActivated = false;

//------------LOGIN/LOGOUT-----------------
//   void logoutUser() async {
//   FirebaseAuth auth = FirebaseAuth.instance;
//   await auth.signOut();
//   print('User logged out');

//   Navigator.pushReplacement(
//     context,
//     MaterialPageRoute(
//         builder: (context) => const Login()));

//   User? user = auth.currentUser;

//   if (user != null) {
//     // User is logged in
//     String uid = user.uid;
//     String email = user.email!;
//     // Access other user properties as needed
//     print('User is logged in. UID: $uid, Email: $email');
//   } else {
//     // No user is currently logged in
//     print('No user is currently logged in');
//   }
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        toolbarHeight: 60,
        // toolbarHeight: (60),
        elevation: 0,
        backgroundColor: const Color.fromARGB(216, 0, 0, 0),
        leadingWidth: 0,
        title: Container(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            height: 80,
            width: 390,
            // height: (36),
            // width: (120),
            child: Row(
              children: [
                Text('Drive',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        letterSpacing: 2.25,
                        fontSize: 32)),
                        
                Text('Safe',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF22AFFF),
                        letterSpacing: 2.25,
                        fontSize: 32))
              ],
            )),
        // fontSize: (30)))),
      ),
      body: Container(
            decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-0.00, 1.00),
              end: Alignment(0, -1),
              colors: [Color(0xFF191919), Color(0x23121213)],
            ),),
      child : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                
                GestureDetector(
                onTap: () {
                  setState(() {
                    // Toggle the activation state
                    isActivated = !isActivated;
                  });
                  if (isActivated) {
                  _launchWebpage(); // Function to open the webpage
                  }

                },
                child: isActivated
                    ? SvgPicture.asset(
                        "assets/off.svg", // Replace with the path to your SVG file
                        width: 300, // Adjust the width as needed
                        height: 300, // Adjust the height as needed
                      )
                    : SvgPicture.asset(
                        "assets/on.svg", // Replace with the path to your SVG file
                        width: 300, // Adjust the width as needed
                        height: 300, // Adjust the height as needed
                      ),
                )
              ],
            ),
            // SizedBox(height: 10), // Adjust the space between button and text as needed
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Tap to ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                TextSpan(
                  text: isActivated?'deactivate':'activate',
                  style: TextStyle(
                    color: isActivated ?  Color(0xFFF74D4D) : Color(0xFF22AFFF),
                    fontSize: 24,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ]
            ),
            )
              ],
            ),
          ],
        ),
      ),),
      extendBody: true,
      // )
    );
  }
  void _launchWebpage() async {
    final Uri url = Uri.parse('http://192.168.196.213:8001');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
 }
  }
}

