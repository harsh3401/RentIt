import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF4b39ef),
        textTheme: GoogleFonts.lexendDecaTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
            body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                child: Text(
                  "RentIt",
                  style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                ),
                padding: EdgeInsets.fromLTRB(15, 40, 0, 0),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                            padding: EdgeInsets.all(7),
                            child: TextField(
                              cursorColor: Color(0xFF4b39ef),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                filled: true,
                                fillColor: Colors.white,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                labelText: 'Enter your name here...',
                              ),
                            )),
                        Padding(
                          padding: EdgeInsets.all(7),
                          child: TextField(
                            cursorColor: Color(0xFF4b39ef),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              filled: true,
                              fillColor: Colors.white,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              labelText: 'Enter your email here...',
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(7),
                          child: TextField(
                            cursorColor: Color(0xFF4b39ef),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              filled: true,
                              fillColor: Colors.white,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              labelText: 'Enter your new Password here...',
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(7),
                          child: TextField(
                            cursorColor: Color(0xFF4b39ef),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              filled: true,
                              fillColor: Colors.white,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              labelText: 'Enter your Mobile no',
                            ),
                          ),
                        ),
                      ])),
              Padding(
                padding: EdgeInsets.fromLTRB(17, 30, 10, 20),
                child: ElevatedButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                      fixedSize: Size(220, 60) // Text Color
                      ),
                  child: const Text(
                    'Create Account',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
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
                    ElevatedButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {},
                      child: const Text('f'),
                    ),
                    ElevatedButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {},
                      child: const Text('g'),
                    ),
                    ElevatedButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {},
                      child: const Text('a'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(17, 0, 0, 40),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'Already Have an account',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Login',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        style: TextButton.styleFrom(
                          elevation: 0.0,
                          foregroundColor: Color(0xFF39d2c0),
                          backgroundColor: Color(0xFF4b39ef),
                        ),
                      )
                    ]),
              )
            ],
          ),
        )),
      ),
    );
  }
}
