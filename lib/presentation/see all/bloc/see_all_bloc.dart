

import 'package:filmi_safari/data/repositories/movies/now_playing.dart';
import 'package:filmi_safari/presentation/see%20all/bloc/see_all_event.dart';
import 'package:filmi_safari/presentation/see%20all/bloc/see_all_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/recent_movie_model.dart';

import '../../../data/models/upcoming_movie_model.dart';
import '../../../data/repositories/movies/upcoming.dart';

class SeeAllBloc extends Bloc<SeeMovieEvent,SeeMovieState>{
  SeeAllBloc() : super(MovieInitialState()) {

    on<SeeUpcomingMovieLoadEvent>((event, emit) async{
        
        try {
          // emit( MovieLoadingState() );
          int page = event.page;
          UpcomingMovieModel upcoming = await Upcoming.getUpcomingPages(page);
          emit( SeeUpcomigMovieLoadedState(upcoming) );
        } catch (e) {
          emit( MovieErrorState("Something Went Wrong!") );
        }
    });

    on<SeeIndiaMovieLoadEvent>((event, emit) async{
        
        try {
          // emit( MovieLoadingState() );
          int page = event.page;
          RecentMovieModel recent = await NowPlayingMovies.getRecentIndiaPages(page);
          emit( SeeRecentIndiaMovieLoadedState(recent) );
        } catch (e) {
          emit( MovieErrorState("Something Went Wrong!") );
        }
    });

    on<SeeInternationalMovieLoadEvent>((event, emit) async{
        
        try {
          // emit( MovieLoadingState() );
          int page = event.page;
          RecentMovieModel recent = await NowPlayingMovies.getRecentIndiaPages(page);
          emit( SeeRecentIndiaMovieLoadedState(recent) );
        } catch (e) {
          emit( MovieErrorState("Something Went Wrong!") );
        }
    });

    on<MovieClickEvent>((event, emit) async{
        print("<<movie details>>");
        print(event.movie);
    });

  }
}
