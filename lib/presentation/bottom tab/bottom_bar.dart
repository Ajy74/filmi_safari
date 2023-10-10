import 'package:filmi_safari/logic/blocs/movie%20bloc/movie_block.dart';
import 'package:filmi_safari/presentation/bottom%20tab/download_screen.dart';
import 'package:filmi_safari/presentation/bottom%20tab/explore_screen.dart';
import 'package:filmi_safari/presentation/bottom%20tab/my_list_screen.dart';
import 'package:filmi_safari/presentation/bottom%20tab/profile_screen.dart';
import 'package:filmi_safari/presentation/see%20all/bloc/see_all_bloc.dart';
import 'package:filmi_safari/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_screen.dart';


class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});
  static final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {  
   int _currentIndex = 0;
  //  final List<Widget> _pages = [
  //   HomeScreen(),
  //   const ExploreScreen(),
  //   const MyListScreen(),
  //   const DownloadScreen(),
  //   const ProfileScreen(),
  //  ];
  


  @override
  Widget build(BuildContext context) {
    
    final List<Widget> _pages = [
      const HomeScreen(),
      ExploreScreen(),
      const MyListScreen(),
      const DownloadScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      // body: BlocProvider(create: (context) => MovieBloc(),child: _pages[_currentIndex]),
      body:  MultiBlocProvider(
        providers: [
            BlocProvider<MovieBloc>(create: (context) => MovieBloc()),
            BlocProvider<RecentIndiaMovieBloc>(create: (context) => RecentIndiaMovieBloc()),
            BlocProvider<RecentWorldMovieBloc>(create: (context) => RecentWorldMovieBloc()),
            BlocProvider<UpcomingMovieBloc>(create: (context) => UpcomingMovieBloc()),

            //^ see all
            // BlocProvider<SeeAllBloc>(create: (context) => SeeAllBloc()),
        ], 
        child: _pages[_currentIndex]
      ),
      // body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.white,
        backgroundColor: darkBackground,
        unselectedItemColor: darkGrey,
        elevation: 5,
        selectedItemColor: primaryRed,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items:  [
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/home.png",height: 28,width: 25,color: _currentIndex==0?primaryRed:darkGrey,),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/explore.png",height: 28,width: 25,color: _currentIndex==1?primaryRed:darkGrey,),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/book-mark.png",height: 28,width: 25,color: _currentIndex==2?primaryRed:darkGrey,),
            label: "My List",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/download.png",height: 28,width: 25,color: _currentIndex==3?primaryRed:darkGrey,),
            label: "Download",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/profile.png",height: 28,width: 25,color: _currentIndex==4?primaryRed:darkGrey,),
            label: "Profile",
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}