import 'package:flutter/material.dart';

class SendToEmailRichText extends StatelessWidget {
  const SendToEmailRichText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 16,
          letterSpacing: 0.5,
        ),
        children: [
          TextSpan(
            //text: "We’ve sent a code to ",
            text: "Kodu göndərdik: ",

            style: TextStyle(color: const Color.fromARGB(130, 0, 0, 0)),
          ),
          TextSpan(
            text: "helloworld@gmail.com",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
