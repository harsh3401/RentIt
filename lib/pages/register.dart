import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentofy/auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    String? title = "";

    // final snackBar = SnackBar(
    //   content: Text(title),
    //   backgroundColor: (Colors.black12),
    //   action: SnackBarAction(
    //     label: 'dismiss',
    //     onPressed: () {},
    //   ),
    // );
    try {
      print(_controllerEmail.text);
      print(_controllerPassword.text);
      // title = 'Welcome';
      await Auth().signInWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      // title = e.message;
      setState(() {
        errorMessage = e.message;
      });
    }
    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> signInWithFacebook() async {
    try {
      print(_controllerEmail.text);
      print(_controllerPassword.text);
      await Auth().signInWithFacebook();
    } on FirebaseAuthException catch (e) {
      print(e.message);
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      print(_controllerEmail.text);
      print(_controllerPassword.text);
      await Auth().signInWithGoogle();
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> signInWithApple() async {
    try {
      print(_controllerEmail.text);
      print(_controllerPassword.text);
      await Auth().signInWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      print(_controllerEmail.text);
      await Auth().createUserWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _submitButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(17, 30, 10, 20),
      child: ElevatedButton(
        onPressed: isLogin
            ? signInWithEmailAndPassword
            : createUserWithEmailAndPassword,
        style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.black,
            fixedSize: Size(220, 60) // Text Color
            ),
        child: Text(
          isLogin ? 'Login' : 'Create Account',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }

  Widget _loginOrRegisterButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          isLogin = !isLogin;
        });
      },
      child: Text(isLogin ? 'Register instead' : 'Login instead',
          style: TextStyle(fontWeight: FontWeight.bold)),
      style: TextButton.styleFrom(
        elevation: 0.0,
        foregroundColor: Color(0xFF39d2c0),
        backgroundColor: Color(0xFF4b39ef),
      ),
    );
  }

  Widget _entryField(String title, TextEditingController controller) {
    return Padding(
        padding: EdgeInsets.all(7),
        child: TextField(
          cursorColor: Color(0xFF4b39ef),
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            filled: true,
            fillColor: Colors.white,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelText: 'Enter your ${title} here...',
          ),
        ));
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'Humm ? $errorMessage');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF4b39ef),
        textTheme: GoogleFonts.lexendDecaTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      child: Text(
                        "RentIt",
                        style: TextStyle(
                            fontSize: 60, fontWeight: FontWeight.bold),
                      ),
                      padding: EdgeInsets.fromLTRB(15, 40, 0, 0),
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _entryField("email", _controllerEmail),
                              _entryField("password", _controllerPassword),
                              _submitButton(),

                              // Padding(
                              //     padding: EdgeInsets.all(7),
                              //     child: TextField(
                              //       cursorColor: Color(0xFF4b39ef),
                              //       decoration: InputDecoration(
                              //         border: OutlineInputBorder(
                              //             borderRadius: BorderRadius.circular(8)),
                              //         filled: true,
                              //         fillColor: Colors.white,
                              //         floatingLabelBehavior:
                              //             FloatingLabelBehavior.never,
                              //         labelText: 'Enter your name here...',
                              //       ),
                              //     )),
                              // Padding(
                              //   padding: EdgeInsets.all(7),
                              //   child: TextField(
                              //     controller: controller,
                              //     cursorColor: Color(0xFF4b39ef),
                              //     decoration: InputDecoration(
                              //       border: OutlineInputBorder(
                              //           borderRadius: BorderRadius.circular(8)),
                              //       filled: true,
                              //       fillColor: Colors.white,
                              //       floatingLabelBehavior:
                              //           FloatingLabelBehavior.never,
                              //       labelText: 'Enter your email here...',
                              //     ),
                              //   ),
                              // ),
                              // Padding(
                              //   padding: EdgeInsets.all(7),
                              //   child: TextField(
                              //     cursorColor: Color(0xFF4b39ef),
                              //     decoration: InputDecoration(
                              //       border: OutlineInputBorder(
                              //           borderRadius: BorderRadius.circular(8)),
                              //       filled: true,
                              //       fillColor: Colors.white,
                              //       floatingLabelBehavior:
                              //           FloatingLabelBehavior.never,
                              //       labelText: 'Enter your new Password here...',
                              //     ),
                              //   ),
                              // ),
                              // Padding(
                              //   padding: EdgeInsets.all(7),
                              //   child: TextField(
                              //     cursorColor: Color(0xFF4b39ef),
                              //     decoration: InputDecoration(
                              //       border: OutlineInputBorder(
                              //           borderRadius: BorderRadius.circular(8)),
                              //       filled: true,
                              //       fillColor: Colors.white,
                              //       floatingLabelBehavior:
                              //           FloatingLabelBehavior.never,
                              //       labelText: 'Enter your Mobile no',
                              //     ),
                              //   ),
                              // ),
                            ])),
                    // Padding(
                    //   padding: EdgeInsets.fromLTRB(17, 30, 10, 20),
                    //   child: ElevatedButton(
                    //     onPressed: () {},
                    //     style: TextButton.styleFrom(
                    //         foregroundColor: Colors.white,
                    //         backgroundColor: Colors.black,
                    //         fixedSize: Size(220, 60) // Text Color
                    //         ),
                    //     child: const Text(
                    //       'Create Account',
                    //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(17, 20, 0, 20),
                      child: const Text(
                        'Or use a social account to create account',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(17, 0, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // ElevatedButton(
                          //   style: TextButton.styleFrom(
                          //     foregroundColor: Colors.white,
                          //     backgroundColor: Colors.black,
                          //   ),
                          //   onPressed: () {},
                          //   child: const Text('f'),
                          // ),
                          // ElevatedButton(
                          //   style: TextButton.styleFrom(
                          //     foregroundColor: Colors.white,
                          //     backgroundColor: Colors.black,
                          //   ),
                          //   onPressed: () {
                          //     signInWithGoogle();
                          //   },
                          //   child: const Text('g'),
                          // ),
                          // ElevatedButton(
                          //   style: TextButton.styleFrom(
                          //     foregroundColor: Colors.white,
                          //     backgroundColor: Colors.black,
                          //   ),
                          //   onPressed: () {},
                          //   child: const Text('a'),
                          // ),
                          IconButton(
                              style: IconButton.styleFrom(),
                              // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                              icon: FaIcon(FontAwesomeIcons.facebook),
                              onPressed: () {
                                signInWithFacebook();
                              }),
                          IconButton(

                              // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                              icon: FaIcon(FontAwesomeIcons.google),
                              onPressed: () {
                                signInWithGoogle();
                              }),
                          IconButton(

                              // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                              icon: FaIcon(FontAwesomeIcons.apple),
                              onPressed: () {})
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(17, 0, 0, 40),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              !isLogin
                                  ? 'Already Have an account?'
                                  : 'Don\'t have an account?',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            // ElevatedButton(
                            //   onPressed: () {},
                            //   child: const Text('Login',
                            //       style: TextStyle(fontWeight: FontWeight.bold)),
                            //   style: TextButton.styleFrom(
                            //     elevation: 0.0,
                            //     foregroundColor: Color(0xFF39d2c0),
                            //     backgroundColor: Color(0xFF4b39ef),
                            //   ),
                            // )
                            _loginOrRegisterButton(),
                          ]),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
