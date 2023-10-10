import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:filmi_safari/data/models/recent_movie_model.dart';
import 'package:filmi_safari/data/models/upcoming_movie_model.dart';
import 'package:filmi_safari/presentation/see%20all/bloc/see_all_bloc.dart';
import 'package:filmi_safari/presentation/see%20all/bloc/see_all_event.dart';
import 'package:filmi_safari/presentation/see%20all/bloc/see_all_state.dart';
import 'package:filmi_safari/utils/theme/colors.dart';
import 'package:filmi_safari/utils/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/constant.dart';

class SeeAllScreen extends StatefulWidget {
  SeeAllScreen({required this.type, required this.movieModel, super.key});
  final String type;
  dynamic movieModel;

  @override
  State<SeeAllScreen> createState() => _SeeAllScreenState();
}

class _SeeAllScreenState extends State<SeeAllScreen> {
  List<Results> movieList = [];
  List<Result> upcomingMovieList = [];
  int filterIndex = 0;
  int current_page = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    if (widget.type == "Recently in india" ||
        widget.type == "Recently in international") {
      updateList(widget.movieModel.results);
    }
    if (widget.type == "Upcoming") {
      updateUpcomingList(widget.movieModel.results);
    }
  }

  void updateList(results) {
    movieList.clear();
    for (dynamic i in results) {
      movieList.add(i);
    }
  }

  void updateUpcomingList(results) {
    upcomingMovieList.clear();
    for (dynamic i in results) {
      upcomingMovieList.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    // movieList.addAll(widget.movieModel.results);
    return Scaffold(
      backgroundColor: darkBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        title: ModifiedSingleLineText(
            text: widget.type, color: Colors.white, size: 20),
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: BlocConsumer<SeeAllBloc, SeeMovieState>(
          listener: (context, state) {
            if(state is SeeUpcomigMovieLoadedState){
              for (dynamic i in state.movies.results!) {
                upcomingMovieList.add(i);
              }
              // setState(() { print("$current_page is loaded..${upcomingMovieList.length}"); });
              print("$current_page is loaded..${upcomingMovieList.length}");
            }

            if(state is SeeRecentIndiaMovieLoadedState){
              for (dynamic i in state.movies.results!) {
                movieList.add(i);
              }
              // setState(() { print("$current_page is loaded..${upcomingMovieList.length}"); });
              print("$current_page is loaded..${movieList.length}");
            }

            if(state is SeeRecentIntenationalMovieLoadedState){
              for (dynamic i in state.movies.results!) {
                movieList.add(i);
              }
              // setState(() { print("$current_page is loaded..${upcomingMovieList.length}"); });
              print("$current_page is loaded..${movieList.length}");
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 55,
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Expanded(child: searchRow()),
                    ],
                  ),
                ),

                //^ grid list
                const SizedBox(
                  height: 10,
                ),

                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      width: double.maxFinite,
                      // height: 190,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                        ),
                        scrollDirection: Axis.vertical,
                        itemCount: movieList.isEmpty
                            ? upcomingMovieList.length
                            : movieList.length,
                        itemBuilder: (context, index) {
                          
                          if (upcomingMovieList.isNotEmpty) {
                            // if( !checkSmallerDate(upcomingMovieList[index].releaseDate.toString()) ){
                            //   index = index+1;
                            //   if(index < upcomingMovieList.length){filterIndex = index;}
                            // }
                            // print("index0=$index");
                            // checkSmallerDate(upcomingMovieList[index].releaseDate.toString()) ? index = checkFilterIndex(filterIndex,index) : index = checkGridIndex(filterIndex,index,upcomingMovieList.length);
                            // print("index00=$index");

                            // if(index == upcomingMovieList.length){
                            //   return const SizedBox();
                            // }

                           //^ condition for load more
                            if (index > (upcomingMovieList.length / 1.2)) {
                              if (current_page < widget.movieModel.totalPages) {
                                BlocProvider.of<SeeAllBloc>(context).add(
                                    SeeUpcomingMovieLoadEvent(page: current_page + 1)
                                );
                               
                                print("<<<$current_page-${widget.movieModel.totalPages}>>>${widget.movieModel.totalResults}");
                                current_page = current_page+1;
                              }
                            }

                            if( (upcomingMovieList[index].posterPath) != null){
                                return  GestureDetector( 
                                onTap: () => print("clicked index: $index"),
                                child: CachedNetworkImage(
                                  imageUrl: upcomingMovieList[index].posterPath == null ?"https://unsplash.com/photos/uyyRJA2an4o":"https://image.tmdb.org/t/p/w500/${upcomingMovieList[index].posterPath}",
                                  imageBuilder: (context, imageProvider) => Container(
                                    margin: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: imageProvider, 
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) => const Center(child:CircularProgressIndicator()),
                                ),
                              );
                            }
                            else{
                              return Container(
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: darkButtonBack), 
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.error,color: Colors.white,size: 40,),
                                    Container(
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.all(5),
                                      child: Text(upcomingMovieList[index].title.toString(),style: const TextStyle(color: Colors.white,fontSize: 16),textAlign: TextAlign.center,),
                                    ),
                                  ],
                                ),
                              );
                            }
                          } else {

                            //^ condition for load more (for recent ..)
                              if (index > (movieList.length / 1.2)) {
                                if (current_page < widget.movieModel.totalPages) {
                                  BlocProvider.of<SeeAllBloc>(context).add(
                                     widget.type == "Recently in india" 
                                     ?SeeIndiaMovieLoadEvent(page: current_page + 1):SeeInternationalMovieLoadEvent(page: current_page + 1)
                                  );
                                
                                  print("<<<$current_page-${widget.movieModel.totalPages}>>>${widget.movieModel.totalResults}");
                                  current_page = current_page+1;
                                }
                              }

                            if( (movieList[index].posterPath) != null){
                              return  GestureDetector( 
                                onTap: () => print("clicked index: $index"),
                                child: CachedNetworkImage(
                                  imageUrl: movieList[index].posterPath == null ?"https://unsplash.com/photos/uyyRJA2an4o":"https://image.tmdb.org/t/p/w500/${movieList[index].posterPath}",
                                  imageBuilder: (context, imageProvider) => Container(
                                    margin: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: imageProvider, 
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) => const Center(child:CircularProgressIndicator()),
                                ),
                              );
                            }
                            else{
                               return Container(
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: darkButtonBack), 
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.error,color: Colors.white,size: 40,),
                                    Container(
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.all(5),
                                      child: Text(movieList[index].title.toString(),style: const TextStyle(color: Colors.white,fontSize: 16),textAlign: TextAlign.center,),
                                    ),
                                  ],
                                ),
                              );
                            }
                          }

                        },
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  searchRow() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: darkshadow),
      child: TextFormField(
        // controller: emailController,
        keyboardType: TextInputType.text,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: "search",
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintStyle: const TextStyle(color: darkGrey, fontSize: 22),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(
                top: 14.0, left: 15.0, right: 15.0, bottom: 15.0),
            child: Image.asset(
              "assets/icons/serch.png",
              color: darkGrey,
            ),
          ),
        ),
      ),
    );
  }

  int checkGridIndex(int fltIndex, int index, int length) {
    if (filterIndex != length) {
      filterIndex = fltIndex + 1;
      return filterIndex;
    }
    return length;
  }

  int checkFilterIndex(int fltIndex, int index) {
    filterIndex = fltIndex + (index + 1);
    return index + 1;
  }
}
