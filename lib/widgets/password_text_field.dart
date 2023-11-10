import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField(
      {super.key,
      required this.hintText,
      required this.isBorder,
      required this.field});
  final String hintText;
  final bool isBorder;
  final String field;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  var _isObscure = true;

  @override
  Widget build(BuildContext context) {
    final formFields = Provider.of<Auth>(context, listen: false).signupData;
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: widget.isBorder ? 1 : 0, color: Colors.grey))),
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              onSaved: (newValue) {
            formFields[widget.field] = newValue!;
          },
              obscureText: _isObscure,
              validator: (value) {
                if (value!.isEmpty || value.length < 8) {
                  return 'Password is too short';
                }
                return null;
              },
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 20),
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintText: widget.hintText),
              keyboardType: TextInputType.text,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            },
            child: Icon(
                _isObscure ? Icons.visibility_off_outlined : Icons.visibility),
          )
        ],
      ),
    );
  }
}
