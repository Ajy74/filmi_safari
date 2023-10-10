import 'package:filmi_safari/data/models/recent_movie_model.dart';
import 'package:filmi_safari/data/models/upcoming_movie_model.dart';

abstract class SeeMovieState{}

class MovieInitialState extends SeeMovieState{}

class MovieLoadingState extends SeeMovieState{}

class SeeUpcomigMovieLoadedState extends SeeMovieState{
  final UpcomingMovieModel movies ;
  SeeUpcomigMovieLoadedState(this.movies);
}

class SeeRecentIndiaMovieLoadedState extends SeeMovieState{
  final RecentMovieModel movies ;
  SeeRecentIndiaMovieLoadedState(this.movies);
}

class SeeRecentIntenationalMovieLoadedState extends SeeMovieState{
  final RecentMovieModel movies ;
  SeeRecentIntenationalMovieLoadedState(this.movies);
}

class MovieErrorState extends SeeMovieState{
  final String errorMsg;
  MovieErrorState(this.errorMsg);
}