import 'package:filmi_safari/data/models/recent_movie_model.dart';
import 'package:filmi_safari/data/models/upcoming_movie_model.dart';

abstract class MovieState{}

class MovieInitialState extends MovieState{}

class MovieLoadingState extends MovieState{}
class RecentIndiaMovieLoadingState extends MovieState{}
class RecentWorldMovieLoadingState extends MovieState{}
class UpcomingMovieLoadingState extends MovieState{}


class MovieLoadedState extends MovieState{
  final RecentMovieModel recentHindi ;
  MovieLoadedState(this.recentHindi);
}
class RecentIndiaMovieLoadedState extends MovieState{
  final RecentMovieModel recentIndia ;
  RecentIndiaMovieLoadedState(this.recentIndia);
}
class RecentWorldMovieLoadedState extends MovieState{
  final RecentMovieModel recentWorld ;
  RecentWorldMovieLoadedState(this.recentWorld);
}
class UpcomingMovieLoadedState extends MovieState{
  final UpcomingMovieModel upcomingMovie ;
  UpcomingMovieLoadedState(this.upcomingMovie);
}

class MovieErrorState extends MovieState{
  final String errorMsg;
  MovieErrorState(this.errorMsg);
}
class RecentIndiaMovieErrorState extends MovieState{
  final String errorMsg;
  RecentIndiaMovieErrorState(this.errorMsg);
}
class RecentWorldMovieErrorState extends MovieState{
  final String errorMsg;
  RecentWorldMovieErrorState(this.errorMsg);
}
class UpcomingMovieErrorState extends MovieState{
  final String errorMsg;
  UpcomingMovieErrorState(this.errorMsg);
}


