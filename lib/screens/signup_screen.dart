import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
// Provider import
import '../providers/auth.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/or_continue_with.dart';
import '../widgets/password_text_field.dart';
import '../widgets/custom_text_field.dart';

class SignupScreen extends StatefulWidget {
  final void Function()? onTap;
  const SignupScreen({super.key, required this.onTap});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  var isLoading = false;

  // On submission of the form
  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    setState(() {
      isLoading = true;
    });

    // Signing the user up
    try {
      await Provider.of<Auth>(context, listen: false).signup();
    } catch (e) {
      rethrow;
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomSheet: Container(
        padding: const EdgeInsets.only(bottom: 15),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Already have an account?",
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              width: 4,
            ),
            GestureDetector(
              onTap: widget.onTap,
              child: const Text(
                "Login",
                style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/bg-login.png"))),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25)),
            height: size.height * 0.9,
            child: Column(
              children: [
                //Logo
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: SvgPicture.asset("assets/icons/logo.svg", height: 40),
                ),
                //Sign in message
                const Text(
                  "Create your account",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),

                // sign in with google message
                const CustomIconButton(
                    buttonText: "Sign up with Google",
                    assetName: "assets/icons/google.svg",
                    textColor: Colors.black),

                //or continue with
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: OrContinueWith(),
                ),
                //loginfields
                Form(
                  key: _formKey,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey)),
                    child: Column(
                      children: const [
                        CustomTextField(
                          hintText: 'First name',
                          field: 'first_name',
                        ),
                        CustomTextField(
                          hintText: 'Last name',
                          field: 'last_name',
                        ),
                        CustomTextField(
                          hintText: 'Email address',
                          field: 'email',
                        ),
                        PasswordTextField(
                          field: 'password',
                          hintText: "Password",
                          isBorder: true,
                        ),
                        PasswordTextField(
                          field: 're_password',
                          hintText: "Confirm password",
                          isBorder: false,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //forgot password
                const Spacer(),
                //continue button
                CustomButton(onTap: _submit, text: "Continue")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
