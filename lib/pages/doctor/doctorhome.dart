import 'package:arogyapath/pages/doctor/HospitalProfile/hospitalprofile.dart';
import 'package:arogyapath/pages/doctor/Patient%20Request/patientrequest.dart';
import 'package:arogyapath/pages/doctor/mypatient/mypatients.dart';
import 'package:arogyapath/pages/doctor/todays_appoinment/todaysappointment.dart';
import 'package:arogyapath/pages/login_signup/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DocHomeScreen(),
    );
  }
}

class DocHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.green[400], // Background color of AppBar
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset('assets/images/Arogyalogo.png'), // Replace with your logo asset path
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Signup()), // Navigate to login page
              );
            },
            child: Row(
              children: [
                Icon(Icons.account_circle, color: Colors.black),
                SizedBox(width: 5),
                Text('Signup/Login', style: TextStyle(color: Colors.black)),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(50.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green, Colors.lightGreen], // Gradient background
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100.0),
                bottomRight: Radius.circular(100.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello Doctor',
                  style: TextStyle(fontSize: 24.0, color: Colors.white),
                ),
                Text(
                  'How we can help you today?',
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(20.0),
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20.0,
              children: [
                _buildGridItem(context, 'My Patients', Icons.person, Mypatientspage()),
                _buildGridItem(context, 'Patient request', Icons.people, PatientRequestsPage()),
                _buildGridItem(context, 'Todays Appointments', Icons.calendar_today, TodaysAppointmentsPage()),
                _buildGridItem(context, 'Calendar', Icons.calendar_month, MyCalendarPage()),
                _buildGridItem(context, 'Messages', Icons.message, MyCalendarPage()),
                _buildGridItem(context, 'Hospital Profile', Icons.local_hospital, HospitalProfilePage()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridItem(BuildContext context, String title, IconData icon, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40.0, color: Colors.green),
            SizedBox(height: 10.0),
            Text(title, style: TextStyle(fontSize: 16.0)),
          ],
        ),
      ),
    );
  }
}

// Example pages for navigation






class MyCalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Calendar')),
      body: Center(child: Text('My Calendar Page')),
    );
  }
}