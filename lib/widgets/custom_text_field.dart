import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.hintText, required this.field});

  final String hintText;
  final String field;

  @override
  Widget build(BuildContext context) {
    final formFields = Provider.of<Auth>(context, listen: false).signupData;
    return Container(
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
        ),
        child: TextFormField(
          onSaved: (newValue) {
            formFields[field] = newValue!;
          },
          decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: const EdgeInsets.only(left: 20),
              hintText: hintText),
        ));
  }
}
