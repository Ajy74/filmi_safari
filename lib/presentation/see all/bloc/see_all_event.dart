abstract class SeeMovieEvent {}

class SeeUpcomingMovieLoadEvent extends SeeMovieEvent{
  final int page ;
  SeeUpcomingMovieLoadEvent({required this.page});
}
class SeeIndiaMovieLoadEvent extends SeeMovieEvent{
  final int page ;
  SeeIndiaMovieLoadEvent({required this.page});
}
class SeeInternationalMovieLoadEvent extends SeeMovieEvent{
  final int page ;
  SeeInternationalMovieLoadEvent({required this.page});
}

// class UpcomingMovieLoadedEvent extends SeeMovieEvent{}

class MovieClickEvent extends SeeMovieEvent{
  dynamic movie;
  MovieClickEvent(this.movie);
}