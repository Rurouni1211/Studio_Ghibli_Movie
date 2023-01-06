import 'package:flutter/material.dart';
import 'package:anime_movie_simple/model/moviedata.dart';

class MovieDetailThumbnail extends StatelessWidget {
  final String thumbnail;

  const MovieDetailThumbnail({super.key, required this.thumbnail});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 18),
              width: MediaQuery.of(context).size.width,
              height: 190,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(thumbnail), fit: BoxFit.cover)),
            ),
            Icon(
              Icons.play_circle_outline,
              size: 100,
              color: Color(0xFFA9B8C2),
            )
          ],
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0x00f5f5), Color(0xfff5f5f5)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          height: 80,
        )
      ],
    );
  }
}

class movieDetailHeaderwithPoster extends StatelessWidget {
  final Movie movie;

  const movieDetailHeaderwithPoster({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: <Widget>[
          MoviePoster(Poster: movie.images[0].toString()),
          SizedBox(
            width: 16,
          ),
          Expanded(child: MovieDetailHeader(movie: movie)),
        ],
      ),
    );
  }
}

class MovieDetailHeader extends StatelessWidget {
  final Movie movie;

  const MovieDetailHeader({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(
            "${movie.year}.${movie.genre}".toUpperCase(),
            style: TextStyle(
                fontWeight: FontWeight.w400, color: Color(0xFF0792AB)),
          ),
        ),
        Text(
          movie.title,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 32,
          ),
        ),
        Text.rich(TextSpan(
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF1C0D09)),
            children: <TextSpan>[
              TextSpan(text: movie.plot),
              TextSpan(
                  text: " More...", style: TextStyle(color: Color(0xFF0792AB)))
            ]))
      ],
    );
  }
}

class MoviePoster extends StatelessWidget {
  final String Poster;

  const MoviePoster({super.key, required this.Poster});

  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.all(Radius.circular(10));
    return Card(
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          width: MediaQuery.of(context).size.width / 4,
          height: 160,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(Poster), fit: BoxFit.cover)),
        ),
      ),
    );
  }
}

class MovieCast extends StatelessWidget {
  final Movie movie;

  const MovieCast({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(children: <Widget>[
        MovieField(field: "cast", value: movie.actor),
        MovieField(field: "Director", value: movie.director),
        MovieField(field: "Awards", value: movie.awards)
      ]),
    );
  }
}

class MovieField extends StatelessWidget {
  final String field;
  final String value;

  const MovieField({super.key, required this.field, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "$field: ",
          style: TextStyle(
              color: Color(0xFF131214),
              fontWeight: FontWeight.w400,
              fontSize: 12),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
                color: Color(0xFF131214),
                fontWeight: FontWeight.w400,
                fontSize: 12),
          ),
        )
      ],
    );
  }
}

class HorizontalLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Container(
        height: 0.5,
        color: Colors.black,
      ),
    );
  }
}

class MovieDetailExtraPoster extends StatelessWidget {
  final List<String> Poster;

  const MovieDetailExtraPoster({super.key, required this.Poster});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            "Movie Images".toUpperCase(),
            style: TextStyle(
                fontSize: 14,
                color: Color(0xFF131214),
                fontWeight: FontWeight.w400),
          ),
        ),
        Container(
          height: 170,
          padding: EdgeInsets.symmetric(vertical: 18),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(
              width: 8,
            ),
            itemCount: Poster.length,
            itemBuilder: (context, index) => ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                height: 160,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(Poster[index]), fit: BoxFit.cover)),
              ),
            ),
          ),
        )
      ],
    );
  }
}
