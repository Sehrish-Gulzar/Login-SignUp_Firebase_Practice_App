import 'package:fire_base_demo/Utils/Utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_screen.dart';

void main() {
  runApp(MaterialApp(home: SignUpScreen()));
}

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void SignUp() {
    setState(() {
      loading = true;
    });
    _auth
        .createUserWithEmailAndPassword(
            email: emailController.text.toString(),
            password: passController.text.toString())
        .then((value) {
      setState(() {
        loading = false;
      });
    }).onError((error, stackTrace) {
      Utils().toastMessage(error.toString());
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image(
              image: new AssetImage("assets/images/white_and_blue_bg3.jpg"),
              fit: BoxFit.cover,
              // color: Colors.black12,
              // colorBlendMode: BlendMode.darken,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: AlignmentDirectional.topCenter,
                  child: Text(
                    "Sign Up Screen",
                    style: GoogleFonts.abhayaLibre(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Color(0xff03064f)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            prefixIcon: Icon(Icons.email),
                            prefixIconColor: Color(0xff03064f),
                            floatingLabelStyle:
                                TextStyle(color: Colors.black87),
                            label: Text("Email"),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff03064f), width: 3.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 5, color: Colors.black87),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email Required";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          obscureText: true,
                          controller: passController,
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            prefixIcon: Icon(Icons.key),
                            prefixIconColor: Color(0xff03064f),
                            floatingLabelStyle:
                                TextStyle(color: Colors.black87),
                            label: Text("Password"),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff03064f), width: 3.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 5, color: Colors.black87),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password Required";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  height: 40,
                  width: 150,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff03064f),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          SignUp();
                        }
                      },
                      child: loading
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              "Sign Up",
                              style: GoogleFonts.alkalami(),
                            )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: GoogleFonts.alkalami(),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: Text(
                          "Login",
                          style: GoogleFonts.alkalami(),
                        ))
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
