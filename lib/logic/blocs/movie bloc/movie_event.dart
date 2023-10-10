//events are always add in bloc

abstract class MovieEvent {}

class MovieLoadEvent extends MovieEvent{}
// class MovieLoadedEvent extends MovieEvent{}

class MovieClickEvent extends MovieEvent{
  dynamic movie;
  MovieClickEvent(this.movie);
}

class RecentIndiaMovieLoadEvent extends MovieEvent{}

class RecentWorldMovieLoadEvent extends MovieEvent{}

class UpcomingMovieLoadEvent extends MovieEvent{}

