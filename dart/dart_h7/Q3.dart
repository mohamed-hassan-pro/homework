/*
Q3 Create a class Movie with attributes title and rating. In main(), create a list of 4 movies. Print
only the movies with a rating above 7.
*/
void main() {
  List<Movie> movies = [
    Movie('A', 8),
    Movie('B', 6),
    Movie('C', 9),
    Movie('D', 7),
  ];

  for (var movie in movies) {
    if (movie.rating > 7) {
      print(movie.title);
    }
  }
}

class Movie {
  String title;
  num rating;

  Movie(this.title, this.rating);
}