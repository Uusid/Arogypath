import 'package:flutter/material.dart';

class PatientRequestsPage extends StatelessWidget {
  final List<Map<String, String>> requests = [
    {'name': 'John Doe', 'date': '2025-04-05', 'time': '10:00 AM'},
    {'name': 'Jane Smith', 'date': '2025-04-06', 'time': '2:30 PM'},
    {'name': 'Michael Johnson', 'date': '2025-04-07', 'time': '4:00 PM'},
    {'name': 'Emily Davis', 'date': '2025-04-08', 'time': '11:15 AM'},
    {'name': 'Daniel Brown', 'date': '2025-04-09', 'time': '1:45 PM'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Patient Requests'), backgroundColor: Colors.green),
      body: ListView.builder(
        itemCount: requests.length,
        itemBuilder: (context, index) {
          final request = requests[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(child: Icon(Icons.person)),
                  title: Text(request['name']!),
                  subtitle: Text('${request['date']} at ${request['time']}'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                        child: Text('Accept', style: TextStyle(color: Colors.white)),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                        child: Text('Reject', style: TextStyle(color: Colors.white)),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                        child: Text('Reschedule', style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
