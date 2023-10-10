import 'package:filmi_safari/presentation/Authentication/manual_login.dart';
import 'package:filmi_safari/presentation/Authentication/manual_signup.dart';
import 'package:filmi_safari/utils/custom_navigator.dart';
import 'package:flutter/material.dart';

import '../../utils/theme/colors.dart';
import '../../utils/widget/custom_button.dart';
import '../../utils/widget/custom_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackground,
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 100,),

              Container(
                alignment: Alignment.center,
                margin:const EdgeInsets.symmetric(horizontal: 25),
                child: Image.asset("assets/images/login.png",width: 160,height: 160,)
              ),

              Container(
                alignment: Alignment.center,
                width: double.maxFinite,
                margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                child: const ModifiedText(text: "Let's you in", color: Colors.white, size: 28 , fontWeight: FontWeight.w600,),
              ),
        
              Container(
                alignment: Alignment.center,
                width: double.maxFinite,
                margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 4),
                child:  darkBorderContainer(
                   customRow(
                    Image.asset("assets/icons/facebook.png",width: 24,height: 24,),
                    "Continue with Facebook"
                   )
                ),
              ),

              Container(
                alignment: Alignment.center,
                width: double.maxFinite,
                margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 4),
                child:  darkBorderContainer(
                   customRow(
                    Image.asset("assets/icons/google.png",width: 24,height: 24,),
                    "Continue with Google"
                   )
                ),
              ),

              Container(
                alignment: Alignment.center,
                width: double.maxFinite,
                margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 4),
                child:  darkBorderContainer(
                   customRow(
                    Image.asset("assets/icons/github.png",color: Colors.white,width: 24,height: 24,),
                    "Continue with Github"
                   )
                ),
              ),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
                child: Row(
                  children: [
                    horizontalLine(),
                    const SizedBox(width: 10,),
                    ModifiedText(text: "or", color: Colors.white.withOpacity(.8), size: 14 ,),
                    const SizedBox(width: 10,),
                    horizontalLine(),
                  ],
                ),
              ),
        
              Container(
                width: double.maxFinite,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: CustomButton(
                  title: "Sign in with password", 
                  radius: 50,
                  onPress: () {
                    customPushAndOffAllScreen(context, const ManualLoginScreen());
                  },
                ),
              ),

              const SizedBox(height: 50,),

              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      ModifiedText(text: "Don't have an account ?", color: Colors.white.withOpacity(.8), size: 14 ,),
                      const SizedBox(width: 10,),
                      GestureDetector(
                        onTap: () {
                          customPushAndOffAllScreen(context, const ManualSignupScreen());
                        },
                        child: const ModifiedText(text: "Sign up", color: primaryRed, size: 14 ,),)
                  ]
              ),
              
              const SizedBox(height: 40,),
            ],
          ),
        ),
      ),
    );
  }
  
  horizontalLine() {
    return Expanded(
      child: Container(
        height: 1.5,
        color: darkButtonBack,
      ),
    );
  }

  darkBorderContainer(Widget widget) {
    return Container(
      alignment: Alignment.center,
      height: 52,
      width: double.maxFinite,
      decoration: BoxDecoration(
        border: Border.all(color: darkButtonBack,width: 1.5),
        borderRadius: BorderRadius.circular(12),
        color: darkGrey.withOpacity(.1)
      ),
      child: widget,
    );
  }
  
  customRow(Widget image, String title ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: 7,),
        image,
        const SizedBox(width: 7,),
        Text(title, style: const TextStyle(
          color: Colors.white, 
          fontSize: 15,
          fontWeight: FontWeight.w500
        ),),
        // ModifiedText(text: title, color: Colors.white, size: 14 ,),
        const SizedBox(width: 7,),
      ],
    );
  }

}