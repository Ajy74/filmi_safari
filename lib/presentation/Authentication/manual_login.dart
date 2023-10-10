import 'package:filmi_safari/presentation/Authentication/manual_signup.dart';
import 'package:filmi_safari/utils/custom_navigator.dart';
import 'package:flutter/material.dart';

import '../../utils/theme/colors.dart';
import '../../utils/widget/custom_button.dart';
import '../../utils/widget/custom_text.dart';

class ManualLoginScreen extends StatefulWidget {
  const ManualLoginScreen({super.key});

  @override
  State<ManualLoginScreen> createState() => _ManualLoginScreenState();
}

class _ManualLoginScreenState extends State<ManualLoginScreen> {
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
              const SizedBox(height: 80,),

              Container(
                alignment: Alignment.center,
                margin:const EdgeInsets.symmetric(horizontal: 25),
                child: Image.asset("assets/images/login.png",width: 140,height: 140,)
              ),

              Container(
                alignment: Alignment.center,
                width: double.maxFinite,
                margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                child: const ModifiedText(text: "Login to your account", color: Colors.white, size: 28 , fontWeight: FontWeight.w600,),
              ),
        
              Container(
                alignment: Alignment.center,
                width: double.maxFinite,
                margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 4),
                child:  darkContainer(
                   TextFormField(
                    // controller: emailController,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: "Email",
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintStyle: TextStyle(color: darkGrey),
                      prefixIcon: Icon(Icons.email,color: darkGrey,),
                    ),
                   ),
                ),
              ),
              
             Container(
                alignment: Alignment.center,
                width: double.maxFinite,
                margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
                child:  darkContainer(
                   TextFormField(
                    // controller: emailController,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(color: Colors.white),
                    obscureText: true,
                    obscuringCharacter: "*",
                    decoration: const InputDecoration(
                      hintText: "Password",
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintStyle: TextStyle(color: darkGrey),
                      prefixIcon: Icon(Icons.lock,color: darkGrey,),
                    ),
                   ),
                ),
              ),

              Container(
                alignment: Alignment.center,
                width: double.maxFinite,
                margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 4),
                child:  customRow(
                    Checkbox.adaptive(
                      focusColor: primaryRed,
                      activeColor: primaryRed,
                      checkColor: Colors.white,
                      side: const BorderSide(color: primaryRed),
                      value: false, 
                      onChanged: (value) {
                        
                      },
                    ),
                    "Remember me"
                   ),
              ),

              Container(
                width: double.maxFinite,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: CustomButton(
                  title: "Sign in", 
                  radius: 50,
                  onPress: () {
                    
                  },
                ),
              ),

              
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
                child: Row(
                  children: [
                    horizontalLine(),
                    const SizedBox(width: 10,),
                    ModifiedText(text: "or continue with", color: Colors.white.withOpacity(.8), size: 14 ,),
                    const SizedBox(width: 10,),
                    horizontalLine(),
                  ],
                ),
              ),

              Container(
                width: double.maxFinite,
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    Container(
                      width: 65,
                      child: darkBorderContainer(
                      Image.asset("assets/icons/facebook.png",width: 24,height: 24,),
                    ),),
                    const SizedBox(width: 25,),
                    Container(
                      width: 65,
                      child: darkBorderContainer(
                      Image.asset("assets/icons/google.png",width: 24,height: 24,),
                    ),),
                    const SizedBox(width: 25,),
                    Container(
                      width: 65,
                      child: darkBorderContainer(
                      Image.asset("assets/icons/github.png",width: 24,height: 24,color: Colors.white,),
                    ),),
                    
                  ],
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
                          customPushAndOffAllScreen(context,const ManualSignupScreen());
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

  darkContainer(Widget widget) {
    return Container(
      alignment: Alignment.center,
      height: 55,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: darkGrey.withOpacity(.1)
      ),
      child: widget,
    );
  }
  
  customRow(Widget widget, String title ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: 7,),
        widget,
        // const SizedBox(width: 7,),
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