import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TopContainer extends StatefulWidget {
  @override
  State<TopContainer> createState() => _TopContainerState();
}

class _TopContainerState extends State<TopContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(left: 0.8, right: 0.8),
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.indigo,
                      blurRadius: 15.0, // soften the shadow
                      spreadRadius: 5.0, //extend the shadow
                      offset: Offset(
                        5.0, // Move to right 5  horizontally
                        5.0, // Move to bottom 5 Vertically
                      ),
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                ),
              ),
              Positioned(
                top: 70,
                left: 100,
                width: 250,
                height: 220,
                child: Lottie.asset(
                    'assets/images/127307-car-lottie-animation.json'),
              ),
            ],
          ),
          SizedBox(
            height: 150,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  // controller: emailController,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    prefixIcon: Icon(Icons.email),
                    prefixIconColor: Color(0xff03064f),
                    floatingLabelStyle: TextStyle(color: Colors.black87),
                    label: Text("Email"),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff03064f), width: 3.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 5, color: Colors.black87),
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
            ],
          ),
        ],
      ),
    );
  }
}
