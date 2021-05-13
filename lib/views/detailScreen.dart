import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_movies/models/movieModel.dart';
import 'package:my_movies/repositories/movieDetailsRepository.dart';

class MovieDetail extends StatefulWidget {
  final int id;
  MovieDetail(this.id);

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  Movie movie;
  var movieDetailRepo = MovieDetailRepository();

  void getMovieData() async {
    movie = await movieDetailRepo.fetchMovieDetail(widget.id);
    setState(
      () {},
    );
  }

  @override
  void initState() {
    getMovieData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.black,
        brightness: Brightness.dark,
        title: Text(movie.title),
      ),
      body: Stack(
        children: [
          Image.network(
            "https://image.tmdb.org/t/p/w342${movie.posterPath}",
            fit: BoxFit.fill,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Container(
                      height: 400,
                      width: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://image.tmdb.org/t/p/w342${movie.posterPath}'),
                          fit: BoxFit.fill,
                        ),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 20.0,
                              offset: Offset(1.0, 10.0),
                              color: Colors.white.withOpacity(0.2))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 0.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            movie.title,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                                fontFamily: 'Arvo'),
                          ),
                        ),
                        Text(
                          movie.voteAverage.toStringAsFixed(2),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontFamily: 'Arvo'),
                        )
                      ],
                    ),
                  ),
                  Text(
                    movie.overview,
                    style: TextStyle(color: Colors.white, fontFamily: 'Arvo'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(
                      10.0,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: 150.0,
                          height: 60.0,
                          alignment: Alignment.center,
                          child: Text(
                            'Rate Movie',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Arvo',
                                fontSize: 20.0),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey.shade400.withOpacity(0.5),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.share,
                            color: Colors.white,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey.shade400.withOpacity(0.5),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Container(
                          padding: const EdgeInsets.all(16.0),
                          alignment: Alignment.center,
                          child: new Icon(
                            Icons.bookmark,
                            color: Colors.white,
                          ),
                          decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.circular(10.0),
                            color: Colors.grey.shade400.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
        fit: StackFit.expand,
      ),
    );
  }
}
