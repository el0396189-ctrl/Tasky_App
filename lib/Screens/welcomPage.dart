import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskyapp/Screens/MainPage.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final Key = GlobalKey<FormState>();

  final TextEditingController names = TextEditingController();

  @override
  void dispose() {
    names.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: true,

      body: SafeArea(

        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: Key,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                   SizedBox(height: 70),

                  Image.asset('assets/Frame 50.png'),

                 SizedBox(height: 120),

                  Image.asset('assets/Frame 45.png'),

                   SizedBox(height: 30),

                  Image.asset('assets/pana.png'),

                   SizedBox(height: 30),

                   Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'FULL NAME',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                   SizedBox(height: 10),

                  // Full Name
                  TextFormField(
                    controller: names,

                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fillColor: Colors.grey,
                      filled: true,
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  // Button
                  ElevatedButton(
                    onPressed: () async {
                      if (Key.currentState!.validate()) {

                        final SharedPreferences prefs =
                        await SharedPreferences.getInstance();

                        // Save name
                        await prefs.setString(
                          'userName',
                          names.text,
                        );

                        // Go to MainPage
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainPage(
                              name: names.text,
                            ),
                          ),
                        );
                      }
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff15B86C),
                      foregroundColor: Colors.white,
                      fixedSize: Size(
                        MediaQuery.of(context).size.width,
                        60,
                      ),
                    ),

                    child: const Text(
                      'Let’s Get Started',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}