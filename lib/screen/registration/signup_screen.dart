import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:demo_application/screen/registration/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  double screenHeight = 0;
  double screenWidth = 0;

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  void signUp(String Email, String Passworld) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      await _auth.createUserWithEmailAndPassword(
          email: Email, password: Passworld);
    } on FirebaseAuthException catch (Error) {
      print("Error:" + Error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.red,
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  top: screenHeight / 8,
                ),
                child: Text(
                  "SIGN UP",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: screenWidth / 10,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            square(-30, 0.12),
            square(-10, 0.3),
            square(10, 1),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: screenHeight / 2,
                width: screenWidth,
                color: Colors.white,
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth / 12,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Username",
                            hintStyle: TextStyle(color: Colors.red),
                            icon: Icon(Icons.person_outline),
                            iconColor: Colors.red,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        Form(
                          key: _key,
                          child: Column(
                            children: [
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Plase enter some text in email';
                                  } else if (!value!.contains('@gmail.com')) {
                                    return 'Please enter valid emailid';
                                  } else {
                                    return null;
                                  }
                                },
                                controller: _email,
                                decoration: const InputDecoration(
                                  hintText: "Email",
                                  hintStyle: TextStyle(color: Colors.red),
                                  icon: Icon(Icons.email_outlined),
                                  iconColor: Colors.red,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Plase enter some text in password';
                                  } else if (value!.length < 8) {
                                    return 'Please enter valid password';
                                  } else {
                                    return null;
                                  }
                                },
                                controller: _password,
                                decoration: const InputDecoration(
                                  hintText: "Password",
                                  hintStyle: TextStyle(color: Colors.red),
                                  icon: Icon(Icons.lock_outlined),
                                  iconColor: Colors.red,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: screenWidth,
                          height: 50,
                          margin: const EdgeInsets.only(
                            bottom: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              minimumSize: Size(screenWidth, screenHeight),
                            ),
                            onPressed: () {
                              if (_key.currentState!.validate()) {
                                signUp(_email.text, _password.text);
                                const SnackBar(content: Text('User Created'));
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (_) => const LoginScreen(),
                                  ),
                                );
                              } else {
                                const SnackBar(
                                    content: Text('User Created faild'));
                              }
                            },
                            child: const Text(
                              "SIGN UP",
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                color: Colors.white,
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            bottom: 30,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              "Already have an account? Login",
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                color: Colors.red,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
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

  Widget square(double y, double opacity) {
    return Center(
      child: Transform.translate(
        offset: Offset(screenWidth / 30, y),
        child: Transform.rotate(
          angle: -0.4,
          child: Container(
            height: screenHeight / 3,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(opacity),
              borderRadius: BorderRadius.circular(55),
            ),
          ),
        ),
      ),
    );
  }
}
