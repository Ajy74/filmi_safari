import 'package:flutter/material.dart';

import '../../utils/theme/colors.dart';
import '../../utils/widget/custom_text.dart';

class MyListScreen extends StatefulWidget {
  const MyListScreen({super.key});

  @override
  State<MyListScreen> createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: darkBackground,
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        margin: const EdgeInsetsDirectional.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(height: 40,),
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Image.asset("assets/images/login.png",width: 40,height: 40,)
                ),
                const SizedBox(width: 10,),
                const ModifiedSingleLineText(text: "MyList", color: Colors.white, size: 24),
                const Spacer(),
                Container(
                  alignment: Alignment.center,
                  child: Image.asset("assets/icons/serch.png",width: 30,height: 30,color: Colors.white,)
                ),
                
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/icons/list.png",width: 100,height: 100,),
                  const SizedBox(height: 12,),
                  const ModifiedText(
                    text: "Your list is empty", 
                    color: Colors.white, 
                    size: 16
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}