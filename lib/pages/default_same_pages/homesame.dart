import 'package:arogyapath/pages/login_signup/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NewUserHomePage(),
    );
  }
}

class NewUserHomePage extends StatefulWidget {
  @override
  _NewUserHomePageState createState() => _NewUserHomePageState();
}

class _NewUserHomePageState extends State<NewUserHomePage> {
  bool _isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                MaterialPageRoute(builder: (context) => LoginPage()), // Navigate to login page
              );
            },
            child: Row(
              children: [
                Icon(Icons.account_circle, color: Colors.black),
                SizedBox(width: 6),
                Text('Signup/Login', style: TextStyle(color: Colors.black)),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.greenAccent[400], // Menu bar color
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    setState(() {
                      _isDrawerOpen = !_isDrawerOpen;
                    });
                  },
                ),
              ],
            ),
          ),
          if (_isDrawerOpen) // Show drawer if _isDrawerOpen is true
            Container(
              height: MediaQuery.of(context).size.height * 0.5, // Half screen height
              color: Colors.grey[200], // Drawer background color
              child: Column(
                children: [
                  ListTile(
                    title: Text('Home'),
                    onTap: () {
                      // Navigate to Home
                      setState(() {
                        _isDrawerOpen = false;
                      });
                    },
                  ),
                  ListTile(
                    title: Text('Book Appointment'),
                    onTap: () {
                      // Navigate to Book Appointment
                      setState(() {
                        _isDrawerOpen = false;
                      });
                    },
                  ),
                  ListTile(
                    title: Text('Contact Us'),
                    onTap: () {
                      // Navigate to Contact Us
                      setState(() {
                        _isDrawerOpen = false;
                      });
                    },
                  ),
                  // Add more menu items as needed
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
                _buildGridItem(context, 'Book Appointment', Icons.calendar_today, BookAppointmentPage()),
                _buildGridItem(context, 'Take Guidance', Icons.lightbulb, GuidancePage()),
                _buildGridItem(context, 'News', Icons.newspaper, NewsPage()),
              ],
            ),
          ),
          Container(
            color: Colors.grey[300], // Bottom navigation bar color
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.newspaper),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewsPage()),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {
                    // Navigate to Home
                  },
                ),
                IconButton(
                  icon: Icon(Icons.calendar_month),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CalendarPage()),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                  },
                ),
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
              spreadRadius: 1,
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


class BookAppointmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book Appointment')),
      body: Center(child: Text('Book Appointment Page')),
    );
  }
}

class GuidancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Guidance')),
      body: Center(child: Text('Guidance Page')),
    );
  }
}

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('News')),
      body: Center(child: Text('News Page')),
    );
  }
}

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calendar')),
      body: Center(child: Text('Calendar Page')),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Center(child: Text('Profile Page')),
    );
  }
}