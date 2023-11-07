import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/custom_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: PageView.builder(
            onPageChanged: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemCount: ONBOARDING_DATA.length,
            itemBuilder: (_, i) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Image.asset(
                      ONBOARDING_DATA[i].imageDir,
                      height: size.height * 0.3,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Text(
                      ONBOARDING_DATA[i].title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 23),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Text(
                      style: const TextStyle(color: Colors.black45),
                      ONBOARDING_DATA[i].description,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            }),
      ),
      bottomSheet: Container(
          height: size.height * 0.25,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(ONBOARDING_DATA.length,
                      (index) => buildDots(index, context)),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent, width: 1.5),
                    borderRadius: BorderRadius.circular(10)),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.blueAccent),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              CustomButton(onTap: () {}, text: 'Log in')
            ],
          )),
    );
  }

  Container buildDots(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 20 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.blueAccent),
    );
  }
}
