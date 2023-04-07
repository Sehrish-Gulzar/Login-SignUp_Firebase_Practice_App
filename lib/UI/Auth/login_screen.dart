import 'package:fire_base_demo/Post/post_screen.dart';
import 'package:fire_base_demo/UI/Auth/SignUp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Utils/Utils.dart';

void main() {
  runApp(MaterialApp(home: LoginScreen()));
}

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void login() {
    setState(() {
      loading = true;
    });
    _auth
        .signInWithEmailAndPassword(
            email: emailController.text.toString(),
            password: passController.text.toString())
        .then((value) {
      Utils().toastMessage(value.user!.email.toString());
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PostScreen()));
      setState(() {
        loading = false;
      });
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      Utils().toastMessage(error.toString());
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  "Login Screen",
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
                    Card(
                        margin: EdgeInsets.all(10),
                        elevation: 1,
                        child: Padding(
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
                        )),
                    Card(
                        margin: EdgeInsets.all(10),
                        elevation: 1,
                        child: Padding(
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
                                  borderSide: BorderSide(
                                      width: 5, color: Colors.black87),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Password Required";
                                } else {
                                  return null;
                                }
                              }),
                        )),
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
                        login();
                      }
                    },
                    child: loading
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            "Login",
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
                    "Don't have an account?",
                    style: GoogleFonts.alkalami(),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()));
                      },
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.alkalami(),
                      ))
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}