import 'package:arogyapath/pages/doctor/mypatient/callpatient.dart';
import 'package:arogyapath/pages/doctor/mypatient/msgpatent.dart';
import 'package:flutter/material.dart';


class Mypatientspage extends StatefulWidget {
  const Mypatientspage({super.key});

  @override
  State<Mypatientspage> createState() => _MypatientspageState();
}

class _MypatientspageState extends State<Mypatientspage> {
  final List<Map<String, String>> patients = [
    {'name': 'Ilyass TARHRI', 'phone': '1234567890'},
    {'name': 'Imane LABIED', 'phone': '0987654321'},
    {'name': 'Yassine BOUNJAH', 'phone': '1122334455'},
    {'name': 'Mohamed NAJM', 'phone': '6677889900'},
    {'name': 'Rihab KROS', 'phone': '2233445566'},
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Patients'), backgroundColor: Colors.green),
      body: ListView.builder(
        itemCount: patients.length,
        itemBuilder: (context, index) {
          final patient = patients[index];
          return ListTile(
            leading: CircleAvatar(child: Icon(Icons.person)),
            title: Text(patient['name']!),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.phone, color: Colors.green),
                  onPressed: () => Callpatient(),
                ),
                IconButton(
                  icon: Icon(Icons.message, color: Colors.blue),
                  onPressed: () => MessagePatent(),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 60,
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Text(
            "Add Patient",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.green,
          onPressed: () {
            // Navigate to add patient page
          },
        ),
      ),
    );
  }
}
