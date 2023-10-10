import 'package:filmi_safari/presentation/Authentication/login_screen.dart';
import 'package:filmi_safari/presentation/bottom%20tab/bottom_bar.dart';
import 'package:filmi_safari/presentation/onboarding/onboard_screen.dart';
import 'package:filmi_safari/utils/custom_navigator.dart';
import 'package:filmi_safari/utils/theme/colors.dart';
import 'package:filmi_safari/utils/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  late final AnimationController _animController = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this
  )..repeat();

  @override
  void initState() {
    super.initState();
    moveToNextPage();
  }

  moveToNextPage() async{
    try {
      final sp = await SharedPreferences.getInstance();
      sp.setBool("isLogged", true);//^ demo
      bool? isUserLogged = sp.getBool("isLogged");
      
      if (isUserLogged!) {
        Future.delayed(
          const Duration(seconds: 3),
          () {
              customPushAndOffAllScreen(context, const BottomBarScreen());
          },
        );
      } else {
        Future.delayed(
          const Duration(seconds: 3),
          () {
              customPushAndOffAllScreen(context, const OnboardingScreen());
          },
        );
      }
    } catch (e) {
      Future.delayed(
        const Duration(seconds: 3),
        () {
          customPushAndOffAllScreen(context, const OnboardingScreen());
        },
      );
    }
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackground,
      body: Stack(
        children: [
          Center(
            child: Container(
                alignment: Alignment.center,
                margin:const EdgeInsets.symmetric(horizontal: 25),
                child: Image.asset("assets/images/login.png",width: 160,height: 160,)
              ),
          ),

          Positioned(
            bottom: MediaQuery.of(context).size.height/6,
            left: 0,
            right: 0,
            child:SpinKitCircle(
              color: primaryRed,
              size: 75.0,
              controller: _animController,
            ), 
          ),
          
        ],
      ),
    );
  }
}