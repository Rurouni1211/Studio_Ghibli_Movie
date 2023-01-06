import 'package:flutter/material.dart';
import 'package:anime_movie_simple/ui/movie_ui.dart';

import 'moviedata.dart';

class MovieList extends StatelessWidget {
  final List<Movie> movieList = Movie.getMovies();

  // final List movies = [
  //   "Titanic",
  //   "Blade runner",
  //   "Rambo",
  //   "The Avengers",
  //   "Avatar",
  //   "I am Legend",
  //   "300",
  //   "The wolf of Wall Street",
  //   "Intersteller",
  //   "Game of Thrones",
  //   "Viking"
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Color(0xFF95A5B4),
      ),
      backgroundColor: Color(0xFFD9D6A9),
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(children: <Widget>[
              movieCard(movieList[index], context),
              Positioned(
                  top: 10.0, child: movieImage(movieList[index].images[0]))
            ]);
            // return Card(
            //   elevation: 4.5,
            //   color: Colors.white,
            //   child: ListTile(child
            //     leading: CircleAvatar(
            //       child: Container(
            //         width: 200,
            //         height: 200,
            //         decoration: BoxDecoration(
            //             image: DecorationImage(
            //                 image: NetworkImage(movieList[index].images[0]),
            //                 fit: BoxFit.cover),
            //             borderRadius: BorderRadius.circular(13.9)),
            //         child: null,
            //       ),
            //     ),
            //     trailing: Text("..."),
            //     title: Text(movieList[index].title),
            //     subtitle: Text("${movieList[index].title}"),
            //     onTap: () {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) => MovieListViewDetails(
            //                     movieName: movieList[index].title,
            //                     movie: movieList[index],
            //                   )));
            //     },
            //     //onTap: () => debugPrint("Movie Name: ${movies[index]}"),
            //   ),
            // );
          }),
    );
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
        child: Container(
          margin: EdgeInsets.only(left: 60),
          width: MediaQuery.of(context).size.width,
          height: 120.0,
          child: Card(
            color: Color(0xFFD7DBDA),
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 54),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Flexible(
                            child: Text(
                          movie.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0,
                              color: Color(0xFFB09A83)),
                        )),
                        Text(
                          "Rating: ${movie.imdbRating} /10",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Released: ${movie.released}",
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.grey,
                            )),
                        Text(movie.runtime,
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.grey,
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(movie.rated,
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.grey,
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MovieListViewDetails(
                            //movieName: movie.title,
                            movie: movie,
                          )))
            });
  }

  Widget movieImage(String imageUrl) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage(imageUrl ??
                  "https://images-na.ssl-images-amazon.com/images/M/MV5BMTQ2NDkwNDk5NV5BMl5BanBnXkFtZTgwNDM0MTI2MDE@._V1_SY1000_CR0,0,1495,1000_AL_.jpg"),
              fit: BoxFit.cover)),
    );
  }
}

class MovieListViewDetails extends StatelessWidget {
  //final String movieName;

  final Movie movie;

  const MovieListViewDetails({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${this.movie.title}"),
        backgroundColor: Color(0xFF95A5B4),
      ),
      backgroundColor: Color(0xFFD7DBDA),
      body: ListView(
        children: <Widget>[
          MovieDetailThumbnail(thumbnail: movie.images[2]),
          movieDetailHeaderwithPoster(
            movie: movie,
          ),
          HorizontalLine(),
          MovieCast(movie: movie),
          HorizontalLine(),
          MovieDetailExtraPoster(
            Poster: movie.images,
          ),
        ],
      ),
      // body: Center(
      //   child: Container(
      //     child: ElevatedButton(
      //       child: Text("Go Back"),
      //       onPressed: () {
      //         Navigator.pop(context,
      //             MaterialPageRoute(builder: (context) => MovieList()));
      //       },
      //     ),
      //   ),
      // ),
    );
  }
}
