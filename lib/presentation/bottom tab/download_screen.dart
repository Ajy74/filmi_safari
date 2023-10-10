import 'package:filmi_safari/utils/theme/colors.dart';
import 'package:filmi_safari/utils/widget/custom_text.dart';
import 'package:flutter/material.dart';

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({super.key});

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
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
                const ModifiedSingleLineText(text: "Downloads", color: Colors.white, size: 24),
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
                  Image.asset("assets/icons/downloading.png",width: 100,height: 100),
                  const SizedBox(height: 12,),
                  const ModifiedText(
                    text: "It seems that you haven't download any movie or series", 
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