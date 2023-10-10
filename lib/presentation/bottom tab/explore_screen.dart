
import 'package:filmi_safari/utils/constant.dart';
import 'package:filmi_safari/utils/theme/colors.dart';
import 'package:filmi_safari/utils/widget/custom_button.dart';
import 'package:flutter/material.dart';

import '../../utils/widget/custom_text.dart';

class ExploreScreen extends StatefulWidget {
  // final GlobalKey<ScaffoldState> scaffoldKey;
   const ExploreScreen({ Key? key}) : super(key: key);
  // required this.scaffoldKey,
 
  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
         const SizedBox(width: 15,), 
         Expanded(child: Padding(
          padding:const EdgeInsets.only(top: 5),
          child: searchRow(), 
         )),
         
         const SizedBox(width: 10,),

         GestureDetector(
          onTap: () => _showBottomSheet(context),
          child:  Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: primaryRed.withOpacity(.12)
                ),
                child: Image.asset("assets/icons/filter.png", height: 30,width: 30,color: primaryRed,),
              ),
          )
         ),

         const SizedBox(width: 15,),
        ],
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          children: [
            const SizedBox(height: 10,),
            // Container(
            //   height: 55,
            //   margin: const EdgeInsets.symmetric(horizontal: 15),
            //   child: Row(
            //     children: [
            //       Expanded(child: searchRow()),
            //       const SizedBox(width: 9,),
            //       GestureDetector(
            //         onTap: () => _showBottomSheet(context),
            //         // onTap: () => _showBottomSheet(BottomBarScreen.scaffoldKey),
            //         child: Container(
            //           alignment: Alignment.center,
            //           padding: const EdgeInsets.symmetric(horizontal: 10),
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(10),
            //             color: primaryRed.withOpacity(.12)
            //           ),
            //           child: Image.asset("assets/icons/filter.png", height: 30,width: 30,color: primaryRed,),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            // Container(
            //   margin: const EdgeInsetsDirectional.symmetric(horizontal: 15),
            //   height: 50,
            //   child: Row(children: [containerButton("Movies",isSelected: true)],),
            // ),
            // const SizedBox(height: 10,),

            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: double.maxFinite,
                  // height: 190,
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7, 
                    ),
                    scrollDirection: Axis.vertical,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage("https://image.tmdb.org/t/p/w500/w4mPBAfZS5yIXOcqEiEOL8fnuQG.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                              decoration: BoxDecoration(
                                color: primaryRed,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text("8.0", style: TextStyle(color: Colors.white)),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  searchRow() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: darkshadow
      ),
      child: TextFormField(
        // controller: emailController,
        keyboardType: TextInputType.text,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: "search",
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintStyle: TextStyle(color: darkGrey,fontSize: 20),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Image.asset("assets/icons/serch.png",color: darkGrey,),
          ),
        ),
      ),
    );
  }
  
  // _showBottomSheet(GlobalKey<ScaffoldState> scaffoldKey) {
  //   print(BottomBarScreen.scaffoldKey.currentContext);
  //   BottomBarScreen.scaffoldKey.currentState?.showBottomSheet(
  //     (context) {
  //       return Container(
  //           height: 200,
  //           width: double.maxFinite,
  //           color: Colors.amber,
  //         );
  //     },
  //     backgroundColor: Colors.amber
  //   );
  // }

  _showBottomSheet(BuildContext context) {
    // var size = MediaQuery.of(cntx).size;
    showBottomSheet(
      context: context, 
      backgroundColor: darkBackground,
      // enableDrag: true,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height/1.5,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: darkBackground,
            border: Border.all(color: darkButtonBack),
            borderRadius: const BorderRadius.only(topRight: Radius.circular(40),topLeft: Radius.circular(40))
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10,),
              horizontalLine(2.6,60.0),
              const SizedBox(height: 20,),
              const ModifiedText(text: "Sort & Filter", color: primaryRed, size: 22 ,),
              const SizedBox(height: 20,),
              horizontalLine(1.5,double.maxFinite),
              const SizedBox(height: 20,),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                alignment: Alignment.centerLeft,
                child: const ModifiedText(text: "Categories", color: Colors.white, size: 16 ,),
              ),

              categoryRow(),

              const SizedBox(height: 20,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                alignment: Alignment.centerLeft,
                child: const ModifiedText(text: "Genres", color: Colors.white, size: 16 ,),
              ),

              genereRow(),

              const SizedBox(height: 20,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                alignment: Alignment.centerLeft,
                child: const ModifiedText(text: "Sort", color: Colors.white, size: 16 ,),
              ),

              sortRow(),

              const SizedBox(height: 20,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                alignment: Alignment.centerLeft,
                child: const ModifiedText(text: "Include Adult", color: Colors.white, size: 16 ,),
              ),
              
              Row(
                children: [
                  const SizedBox(width: 15,),
                  Container(width: 80,child: containerButton("NO"),),
                  const SizedBox(width: 15,),
                  Container(width: 80,child: containerButton("yes",isSelected: true),),
                ],
              ),

              const Spacer(),
              const SizedBox(height: 20,),
              //^ button row
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                height: 45,
                child: Row(
                  children: [
                    Expanded(child: CustomButton(
                      buttonColor: darkButtonBack,
                      radius: 30,
                      title: "Reset", 
                      onPress: (){}
                    )),
                    const SizedBox(width: 15,),
                    Expanded(child: CustomButton(
                      radius: 30,
                      title: "Apply", 
                      onPress: (){
                        Navigator.pop(context);
                      }
                    )),
                  ],
                ),
              ),
              const SizedBox(height: 15,),
            ],
          ),
        );
      },
    );
  }

  horizontalLine(double height , double width) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      height: height,
      width: width,
      color: darkButtonBack,
    );
  }

  containerButton(String title, {bool isSelected=false}){
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 13),
      margin: const EdgeInsets.only(top: 13),
      height: 37,
      decoration: BoxDecoration(
        color: isSelected ? primaryRed : Colors.transparent,
        border: Border.all(color: primaryRed),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Text(title,style: TextStyle(color: isSelected ?Colors.white : primaryRed),)
    );
  }

  categoryRow(){
    return Container(
      margin:const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
            Expanded(child: containerButton("Movies",isSelected: true)),
            const SizedBox(width: 18,),
            Expanded(child: containerButton("TV Series")),
        ],
      ),
    );
  }
  
  genereRow() {
    return Container(
      margin:const EdgeInsets.only(right: 15),
      height: 50,
      width: double.maxFinite,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        // itemCount: movieGenere.length,
        itemCount: tvGenere.length,
        itemBuilder: (context, index) {
          return Container(
            margin:const EdgeInsets.only(left: 10),
            // child: containerButton(movieGenere[index]['name']),
            child: containerButton(tvGenere[index]['name']),
          );
        },
      ),
    );
  }
  
  sortRow() {
    return Container(
      margin:const EdgeInsets.only(right: 15),
      height: 50,
      width: double.maxFinite,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: sortMovies.length,
        itemBuilder: (context, index) {
          return Container(
            margin:const EdgeInsets.only(left: 10),
            child: containerButton(sortMovies[index]),
          );
        },
      ),
    );
  }

}