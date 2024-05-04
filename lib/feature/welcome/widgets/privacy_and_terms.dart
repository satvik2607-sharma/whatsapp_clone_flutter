import 'package:flutter/material.dart';
import 'package:whatsapp_clone_flutter/utils/colors.dart';

class PrivacyAndTerms extends StatelessWidget {
  const PrivacyAndTerms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(
            text: 'Read our',
            style: TextStyle(color: Coloors.greyDark),
            children: [
              TextSpan(
                  text: 'Privacy policy',
                  style: TextStyle(color: Coloors.blueDark)),
              TextSpan(text: 'Tap "Agree and Continue" to accept the'),
              TextSpan(text: 'Terms and Conditions')
            ]),
      ),
    );
  }
}
