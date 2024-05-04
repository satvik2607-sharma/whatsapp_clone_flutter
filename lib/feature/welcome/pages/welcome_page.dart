import 'package:flutter/material.dart';
import 'package:whatsapp_clone_flutter/feature/welcome/widgets/privacy_and_terms.dart';
import 'package:whatsapp_clone_flutter/common/utils/colors.dart';
import 'package:whatsapp_clone_flutter/feature/welcome/widgets/custom_elevated_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Image.asset(
                  'assets/images/circle.png',
                  color: Coloors.greenDark,
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
                const Text(
                  'Welcome to WhatsApp',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                const PrivacyAndTerms(),
                CustomElevatedButton(
                  onPressed: () {},
                  text: "AGREE & CONTINUE",
                  buttonWidth: MediaQuery.of(context).size.width - 100,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
