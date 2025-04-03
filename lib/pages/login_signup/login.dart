import 'package:arogyapath/pages/login_signup/signup.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(children: [
          Container(
            padding: EdgeInsets.only(top: 50.0, left: 20.0),
            height: MediaQuery.of(context).size.height/2,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFFB91635),Color(0xff621d3c),Color(0XFF311937)])),

          child: Text("Hello\nSign in !", style: TextStyle(color: Colors.white , fontSize: 30.0, fontWeight: FontWeight.bold ),),

          ),
          Container(
            padding: EdgeInsets.only(top: 40.0, left: 30.0,right: 30.0, bottom: 30.0),
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/5),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.white , borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),

            child: Column
              (
                crossAxisAlignment: CrossAxisAlignment.start,
               children: [


                Text("Gmail", style: TextStyle(color: Colors.greenAccent , fontSize: 23.0, fontWeight: FontWeight.bold ),),
                TextField(
                  decoration: InputDecoration(hintText: "abc@gmail.com", prefixIcon: Icon(Icons.mail_outline)),
                ),

               SizedBox(height: 40.0,),


                 Text("Password", style: TextStyle(color: Colors.greenAccent , fontSize: 23.0, fontWeight: FontWeight.bold ),),
                 TextField(
                   decoration: InputDecoration(hintText: "Password", prefixIcon: Icon(Icons.password_outlined),),obscureText: true,
                 ),

                 SizedBox(height: 40.0,),


                 Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     Text("Forgot Password", style: TextStyle(color: Colors.lightGreen , fontSize: 23.0, fontWeight: FontWeight.bold ),),
                   ],
                 ),
                SizedBox(height:60.0,),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  width: MediaQuery.of(context).size.width,
                  decoration:  BoxDecoration(gradient: LinearGradient(colors: [Color(0xFFB91635),Color(0xff621d3c),Color(0XFF311937)
                  ]), borderRadius:BorderRadius.circular(30)),

                   child: Center(child: Text("SIGN IN", style: TextStyle(color: Colors.white, fontSize:24.0 , fontWeight: FontWeight.bold), )),
                ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Dont Have Acc", style: TextStyle(color: Colors.purple , fontSize:17.0 , fontWeight: FontWeight.w500),),
              ],
            ),

                 GestureDetector(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=> Signup()));
                   },
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       Text("Sign up", style: TextStyle(color: Colors.pink, fontSize:17.0 , fontWeight: FontWeight.bold),),
                     ],
                   ),
                 )
               ],
            ),
          )

        ],),
      ),
    );
  }
}
