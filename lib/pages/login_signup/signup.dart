import 'package:arogyapath/pages/default_same_pages/homesame.dart';
import 'package:arogyapath/pages/login_signup/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => SignupState();
}

class SignupState extends State<Signup> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> registration() async {
    if (_formKey.currentState!.validate()) {
      String name = nameController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Registered Successfully", style: TextStyle(fontSize: 18.0)),
          ),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => NewUserHomePage()),
        );
      } on FirebaseAuthException catch (e) {
        String errorMessage = "Something went wrong";
        if (e.code == 'weak-password') {
          errorMessage = "Password is too weak";
        } else if (e.code == "email-already-in-use") {
          errorMessage = "Account already exists";
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage, style: const TextStyle(fontSize: 18.0)),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 50.0, left: 20.0),
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFB91635), Color(0xff621d3c), Color(0XFF311937)],
                ),
              ),
              child: const Text(
                "Create Your\nAccount",
                style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 30.0),
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 5),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Name", style: TextStyle(color: Colors.greenAccent, fontSize: 23.0, fontWeight: FontWeight.bold)),
                    TextFormField(
                      controller: nameController,
                      validator: (value) => value!.isEmpty ? 'Please enter name' : null,
                      decoration: const InputDecoration(hintText: "abc", prefixIcon: Icon(Icons.person_2_outlined)),
                    ),
                    const SizedBox(height: 20.0),
                    const Text("Gmail", style: TextStyle(color: Colors.greenAccent, fontSize: 23.0, fontWeight: FontWeight.bold)),
                    TextFormField(
                      controller: emailController,
                      validator: (value) => value!.isEmpty ? 'Please enter email' : null,
                      decoration: const InputDecoration(hintText: "abc@gmail.com", prefixIcon: Icon(Icons.mail_outline)),
                    ),
                    const SizedBox(height: 20.0),
                    const Text("Password", style: TextStyle(color: Colors.greenAccent, fontSize: 23.0, fontWeight: FontWeight.bold)),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      validator: (value) => value!.isEmpty ? 'Please enter password' : null,
                      decoration: const InputDecoration(hintText: "Password", prefixIcon: Icon(Icons.password_outlined)),
                    ),
                    const SizedBox(height: 40.0),
                    GestureDetector(
                      onTap: registration,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFFB91635), Color(0xff621d3c), Color(0XFF311937)],
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Center(
                          child: Text(
                            "SIGN UP",
                            style: TextStyle(color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text("Already Have Account?", style: TextStyle(color: Colors.purple, fontSize: 17.0, fontWeight: FontWeight.w500)),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text("Sign in", style: TextStyle(color: Colors.pink, fontSize: 17.0, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
