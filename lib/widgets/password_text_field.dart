import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField(
      {super.key, required this.hintText, required this.isBorder});
  final String hintText;
  final bool isBorder;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  var _isObscure = true;
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              controller: _passwordController,
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
