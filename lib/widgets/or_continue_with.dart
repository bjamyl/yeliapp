import 'package:flutter/material.dart';

class OrContinueWith extends StatelessWidget {
  const OrContinueWith({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.grey,
            height: 1.2,
            width: 75,
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            'Or continue with',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            color: Colors.grey,
            height: 1.2,
            width: 75,
          )
        ],
      ),
    );
  }
}
