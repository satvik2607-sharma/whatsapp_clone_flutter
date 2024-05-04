import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF111B21),
      body: Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Image.asset(
                  'assets/images/circle.png',
                  color: const Color(0xFF00A884),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  'Welcome to WhatsApp',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                        text: 'Read our',
                        style: TextStyle(color: Color(0xFF8696A0)),
                        children: [
                          TextSpan(
                              text: 'Privacy policy',
                              style: TextStyle(color: Color(0xFF53BDEB))),
                          TextSpan(
                              text: 'Tap "Agree and Continue" to accept the'),
                          TextSpan(text: 'Terms and Conditions')
                        ]),
                  ),
                ),
                SizedBox(
                  height: 42,
                  width: MediaQuery.of(context).size.width - 100,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const BeveledRectangleBorder(),
                          backgroundColor: const Color(0xFF00A884),
                          foregroundColor: const Color(0xFF111B21),
                          splashFactory: NoSplash.splashFactory,
                          elevation: 0,
                          shadowColor: Colors.transparent),
                      onPressed: () {},
                      child: const Text('AGREE & CONTINUE')),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
