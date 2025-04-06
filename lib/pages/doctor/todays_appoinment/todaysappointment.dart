import 'package:flutter/material.dart';

class TodaysAppointmentsPage extends StatelessWidget {
  final List<Map<String, String>> appointments = [
    {
      'name': 'Alice Green',
      'time': '09:00 AM',
      'problem': 'Fever and headache'
    },
    {
      'name': 'Bob Marley',
      'time': '10:30 AM',
      'problem': 'Back pain and fatigue'
    },
    {
      'name': 'Clara Oswald',
      'time': '12:00 PM',
      'problem': 'Skin allergy and itching'
    },
    {
      'name': 'David Tennant',
      'time': '03:00 PM',
      'problem': 'High blood pressure'
    },
    {
      'name': 'Emma Watson',
      'time': '04:30 PM',
      'problem': 'Cough and cold'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Today's Appointments"),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: appointments.length,
        itemBuilder: (context, index) {
          final appointment = appointments[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: CircleAvatar(child: Icon(Icons.person)),
              title: Text(appointment['name']!),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Time: ${appointment['time']}'),
                  Text('Problem: ${appointment['problem']}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
