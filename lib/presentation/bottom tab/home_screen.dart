import 'dart:math';

import 'package:filmi_safari/data/models/recent_movie_model.dart';
import 'package:filmi_safari/data/models/upcoming_movie_model.dart';
import 'package:filmi_safari/logic/blocs/internet%20bloc/internet_bloc.dart';
import 'package:filmi_safari/logic/blocs/internet%20bloc/internet_state.dart';
import 'package:filmi_safari/logic/blocs/movie%20bloc/movie_block.dart';
import 'package:filmi_safari/logic/blocs/movie%20bloc/movie_event.dart';
import 'package:filmi_safari/logic/blocs/movie%20bloc/movie_state.dart';
import 'package:filmi_safari/presentation/see%20all/see_all.dart';
import 'package:filmi_safari/utils/constant.dart';
import 'package:filmi_safari/utils/theme/colors.dart';
import 'package:filmi_safari/utils/widget/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/custom_navigator.dart';
import '../../utils/widget/custom_text.dart';
import '../see all/bloc/see_all_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // late Timer timer;
  late dynamic recentIndiaMovie;
  late dynamic recentInternationlMovie;
  late dynamic upcomingMovie;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // timer.cancel();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackground,
      // backgroundColor: darkBackground,
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: BlocConsumer<InternetBloc, InternetState>(
          listener: (context, state) async {
            if (state is InternetGainedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    "Internet Connected 👍",
                    textAlign: TextAlign.center,
                  ),
                  backgroundColor: Colors.green,
                ),
              );

              //^ fire event to load movies
              BlocProvider.of<MovieBloc>(context).add(MovieLoadEvent());
              BlocProvider.of<RecentIndiaMovieBloc>(context).add(RecentIndiaMovieLoadEvent());
              BlocProvider.of<RecentWorldMovieBloc>(context).add(RecentWorldMovieLoadEvent());
              BlocProvider.of<UpcomingMovieBloc>(context).add(UpcomingMovieLoadEvent());

            } else if (state is InternetLostState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Internet Not Connected !",
                      textAlign: TextAlign.center),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is InternetGainedState) {
              return BlocConsumer<MovieBloc, MovieState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  if(state is MovieLoadedState){
                    //^ for main poster 
                    List<Results> movies = state.recentHindi.results!;
                    movies.shuffle(); //for random selection photo
                    int random = Random().nextInt(movies.length);
                    // timer = Timer.periodic(Duration(seconds: 10), (timer) {
                    //   random = Random().nextInt(movies.length);
                      
                    //   setState(() {
                    //     timer.cancel();  
                    //   });
                    // });

                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          //^ main home poster
                          Container(
                              width: double.maxFinite,
                              height: 300,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        // "https://image.tmdb.org/t/p/w500${movies[random].backdropPath.toString().isEmpty?movies[random].posterPath.toString():movies[random].backdropPath.toString()}"
                                        "https://image.tmdb.org/t/p/w500${movies[random].posterPath.toString()}"
                                      ),
                                      fit: BoxFit.cover)),
                              child: mainPosterContent()),

                          //^ now playing india
                          Container(
                              width: double.maxFinite,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 20),
                              child: Row(
                                children: [
                                  const ModifiedSingleLineText(
                                    text: "Recently in India",
                                    color: Colors.white,
                                    size: 17,
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      // customPushScreen(context, SeeAllScreen(type: "Recently in india", movieModel: recentIndiaMovie,));
                                      Navigator.push(
                                        context,
                                         customPageRouteBuilder(
                                          BlocProvider(
                                            create: (context) => SeeAllBloc(),
                                            child: SeeAllScreen(type: "Recently in india",movieModel: recentInternationlMovie,)
                                          ), 
                                          transitionDuration: const Duration(milliseconds: 250),
                                        ),
                                      );
                                    },
                                    child: const ModifiedSingleLineText(
                                      text: "See all",
                                      color: primaryRed,
                                      size: 14,
                                    ),
                                  ),
                                ],
                              )),

                          BlocConsumer<RecentIndiaMovieBloc, MovieState>(
                            listener: (context, state) {
                              
                            },
                            builder: (context, state) {
                              if (state is RecentIndiaMovieLoadedState) {
                                recentIndiaMovie = state.recentIndia;
                                List<Results> movies = state.recentIndia.results!;

                                return Container(
                                    width: double.maxFinite,
                                    height: 190,
                                    margin: const EdgeInsets.only(right: 10),
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: movies.length,
                                      itemBuilder: (context, index) {
                                        if( checkSmallerDate(movies[index].releaseDate.toString()) ){
                                          return MovieCard(
                                            onPress: () {
                                              // state.recentIndia
                                              BlocProvider.of<RecentIndiaMovieBloc>(context).add(MovieClickEvent( movies[index] ));
                                              
                                            },
                                            image: movies[index].posterPath.toString(),
                                            rating: movies[index].voteAverage.toString()
                                          );
                                        }
                                        else{
                                          return const SizedBox();
                                        }
                                      },
                                    ));
                              } else if (state is RecentIndiaMovieLoadingState) {
                                return Container(
                                  width: double.maxFinite,
                                  height: 190,
                                  child: const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              } else {
                                return Container(
                                  width: double.maxFinite,
                                  height: 190,
                                  child: const Center(
                                    child: Text("Error while Loding !"),
                                  ),
                                );
                              }
                            },
                          ),

                          //^ now playing hollywood
                          Container(
                              width: double.maxFinite,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 20),
                              child: Row(
                                children: [
                                  const ModifiedSingleLineText(
                                    text: "Recently in International",
                                    color: Colors.white,
                                    size: 17,
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      // customPushScreen(context, SeeAllScreen(type: "Recently in international",movieModel: recentInternationlMovie,));
                                      Navigator.push(
                                        context,
                                         customPageRouteBuilder(
                                          BlocProvider(
                                            create: (context) => SeeAllBloc(),
                                            child: SeeAllScreen(type: "Recently in international",movieModel: recentInternationlMovie,)
                                          ), 
                                          transitionDuration: const Duration(milliseconds: 250),
                                        ),
                                      );
                                    },
                                    child:const ModifiedSingleLineText(
                                      text: "See all",
                                      color: primaryRed,
                                      size: 14,
                                    ),
                                  ),
                                ],
                              )),

                          BlocConsumer<RecentWorldMovieBloc, MovieState>(
                            listener: (context, state) {
                              // TODO: implement listener
                            },
                            builder: (context, state) {
                              if (state is RecentWorldMovieLoadedState) {
                                recentInternationlMovie = state.recentWorld;
                                List<Results> movies = state.recentWorld.results!;
                                
                                return Container(
                                    width: double.maxFinite,
                                    height: 190,
                                    margin: const EdgeInsets.only(right: 10),
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: movies.length,
                                      itemBuilder: (context, index) {
                                        if( checkSmallerDate(movies[index].releaseDate.toString()) ){
                                          return MovieCard(
                                            onPress: () {
                                              // state.recentWorld
                                              BlocProvider.of<RecentWorldMovieBloc>(context).add(MovieClickEvent( movies[index] ));
                                            },
                                            image: movies[index].posterPath.toString(),
                                            rating: movies[index].voteAverage.toString()
                                          );
                                        }
                                        else{
                                          return const SizedBox();
                                        }
                                      },
                                    ));
                              } else if (state is RecentWorldMovieLoadingState) {
                                return Container(
                                  width: double.maxFinite,
                                  height: 190,
                                  child: const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              } else {
                                return Container(
                                  width: double.maxFinite,
                                  height: 190,
                                  child: const Center(
                                    child: Text("Error while Loding !"),
                                  ),
                                );
                              }
                            },
                          ),

                          //^ Upcoming
                          Container(
                              width: double.maxFinite,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 20),
                              child: Row(
                                children: [
                                  const ModifiedSingleLineText(
                                    text: "Upcoming",
                                    color: Colors.white,
                                    size: 17,
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      // customPushScreen(context, SeeAllScreen(type: "Upcoming",movieModel: upcomingMovie,));
                                      Navigator.push(
                                        context,
                                         customPageRouteBuilder(
                                          BlocProvider(
                                            create: (context) => SeeAllBloc(),
                                            child: SeeAllScreen(type: "Upcoming",movieModel: upcomingMovie,)
                                          ), 
                                          transitionDuration: const Duration(milliseconds: 250),
                                        ),
                                      );
                                    },
                                    child: const ModifiedSingleLineText(
                                      text: "See all",
                                      color: primaryRed,
                                      size: 14,
                                    ),
                                  ),
                                ],
                              )
                          ),

                          BlocConsumer<UpcomingMovieBloc, MovieState>(
                            listener: (context, state) {
                              // TODO: implement listener
                            },
                            builder: (context, state) {
                              if (state is UpcomingMovieLoadedState) {
                                upcomingMovie = state.upcomingMovie;
                                List<Result> movies = state.upcomingMovie.results!;

                                return Container(
                                    width: double.maxFinite,
                                    height: 190,
                                    margin: const EdgeInsets.only(right: 10),
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: movies.length,
                                      itemBuilder: (context, index) {
                                        if( !checkSmallerDate(movies[index].releaseDate.toString()) ){
                                          return MovieCard(
                                            onPress: () {
                                              BlocProvider.of<UpcomingMovieBloc>(context).add(MovieClickEvent( movies[index] ));
                                            },
                                            image: movies[index].posterPath.toString(),
                                            rating: "",
                                            isUpcoming: true,
                                          );
                                        }
                                        else{
                                          return const SizedBox();
                                        }
                                      },
                                    ));
                              } else if (state is RecentWorldMovieLoadingState) {
                                return Container(
                                  width: double.maxFinite,
                                  height: 190,
                                  child: const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              } else {
                                return Container(
                                  width: double.maxFinite,
                                  height: 190,
                                  child: const Center(
                                    child: Text("Error while Loding !"),
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    );
                  }
                  else{
                    return Container(
                      width: double.maxFinite,
                      height: 190,
                      child: const Center(
                        child: Text("Loding !"),
                      ),
                    );
                  }
                },
              );
            } else {
              return Center(
                  child: const Text(
                "Loading..",
                style: TextStyle(color: Colors.white),
              ));
            }
          },
        ),
      ),
    );
  }

  mainPosterContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/login.png",
                    width: 40,
                    height: 40,
                  )),
              const Spacer(),
              // Container(
              //     alignment: Alignment.center,
              //     margin: const EdgeInsets.symmetric(horizontal: 15),
              //     child: Image.asset(
              //       "assets/icons/serch.png",
              //       width: 30,
              //       height: 30,
              //       color: Colors.white,
              //     )
              // ),
              Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/icons/notif.png",
                    width: 30,
                    height: 30,
                    color: Colors.white,
                  )),
            ],
          ),
          const Spacer(),
          // Container(
          //   child: ModifiedSingleLineText(
          //     text: "Avatar: The Way of Water",
          //     color: Colors.white,
          //     size: 23 ,
          //   ),
          // ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 35,
                  decoration: BoxDecoration(
                      color: primaryRed,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.play_circle_fill_rounded,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Play",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 18,
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 13),
                  height: 35,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "My List",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
