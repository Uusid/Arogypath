import 'package:arogyapath/pages/default_same_pages/homesame.dart';
import 'package:arogyapath/pages/login_signup/login.dart';
import 'package:arogyapath/pages/login_signup/signup.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/arogyapathfront.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 30.0,
            left: 40.0, // Increased left and right for a smaller button
            right: 40.0,
            child: SizedBox( //Added SizedBox to make button smaller.
              width: 200.0, // setting the width of the button.
              height: 65.0, // setting the height of the button.
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to another page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Signup()), // Replace NextPage with your page
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12.0), // Reduced padding for smaller button
                ),
                child: Text(
                  'Get Started',
                  style: TextStyle(fontSize: 20.0, color: Colors.white), // Reduced font size
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}