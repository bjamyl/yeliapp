import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {super.key,
      required this.buttonText,
      required this.assetName,
      required this.textColor});

  final String buttonText;
  final String assetName;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(242, 243, 246, 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              assetName,
              height: 20,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              buttonText,
              style: const TextStyle(
                  color: Color.fromRGBO(38, 38, 44, 1),
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
