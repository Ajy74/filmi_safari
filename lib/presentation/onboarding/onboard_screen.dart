import 'package:filmi_safari/utils/widget/custom_button.dart';
import 'package:flutter/material.dart';

import '../../utils/custom_navigator.dart';
import '../../utils/theme/colors.dart';
import '../../utils/widget/custom_text.dart';
import '../Authentication/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _ObboardingScreenState();
}

class _ObboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackground,
      body: Container(
        width: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/pos.jpg"),
            fit: BoxFit.fitHeight
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Container(
              alignment: Alignment.center,
              width: double.maxFinite,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: const ModifiedText(text: "Welcome to FilmiSafari", color: Colors.white, size: 25 , fontWeight: FontWeight.w600,),
            ),

            Container(
              alignment: Alignment.center,
              width: double.maxFinite,
              margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
              child:  ModifiedText(text: "you are on the way for movie safari , just get start your free tour", color: Colors.white.withOpacity(.8), size: 14 ,),
            ),

            Container(
              width: double.maxFinite,
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: CustomButton(
                title: "Get started", 
                radius: 50,
                onPress: () {
                  customPushAndOffAllScreen(context, const LoginScreen());
                },
              ),
            ),
      
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}