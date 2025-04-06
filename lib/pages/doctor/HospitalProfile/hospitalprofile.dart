import 'package:flutter/material.dart';

class HospitalProfilePage extends StatelessWidget {
  final Map<String, String> hospitalDetails = {
    'name': 'Sunrise Medical Center',
    'address': '123 Main Street, Newtown, NY 10001',
    'contact': '(123) 456-7890',
    'email': 'info@sunrisemedical.com',
    'services': 'General Medicine, Pediatrics, Orthopedics, Cardiology, Emergency Care'
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospital Profile'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.green.shade200,
                child: Icon(Icons.local_hospital, size: 50, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            Text('Name:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(hospitalDetails['name']!),
            SizedBox(height: 10),
            Text('Address:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(hospitalDetails['address']!),
            SizedBox(height: 10),
            Text('Contact:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(hospitalDetails['contact']!),
            SizedBox(height: 10),
            Text('Email:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(hospitalDetails['email']!),
            SizedBox(height: 10),
            Text('Services:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(hospitalDetails['services']!),
          ],
        ),
      ),
    );
  }
}
