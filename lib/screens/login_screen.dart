import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/password_text_field.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/or_continue_with.dart';

class LoginScreen extends StatefulWidget {
  final void Function()? onTap;
  const LoginScreen({super.key,required this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomSheet: Container(
        padding: const EdgeInsets.only(bottom: 25),
        width: double.infinity,
        child: Row( 
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Don't have an Account?",
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              width: 4,
            ),
            GestureDetector(
              onTap:widget.onTap,
              child: const Text(
                "Create an account",
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
            height: size.height * 0.75,
            child: Column(
              children: [
                //Logo
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: SvgPicture.asset("assets/icons/logo.svg", height: 40),
                ),
                //Sign in message
                const Text(
                  "Sign in to your account",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),

                // sign in with google message
                const CustomIconButton(
                    buttonText: "Sign in with Google",
                    assetName: "assets/icons/google.svg",
                    textColor: Colors.black),

                //or continue with
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: OrContinueWith(),
                ),
                //loginfields
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)),
                  child: Column(
                    children: const [
                      CustomTextField(hintText: 'Email address'),
                      PasswordTextField(
                        hintText: "Password",
                        isBorder: false,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //forgot password
                const Text(
                  'Forgot password?',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                //continue button
                CustomButton(onTap: () {}, text: "Continue")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
