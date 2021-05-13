import 'package:flutter/material.dart';
import 'package:my_movies/models/movieModel.dart';
import 'package:my_movies/repositories/movieDetailsRepository.dart';
import 'package:my_movies/repositories/movieRepository.dart';
import 'package:my_movies/views/detailScreen.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  var _movieRepo = MovieRepository();

  var _movielist = <Movie>[];

  void getMovie() async {
    MovieRepository().fetchMovieList();
    _movielist = await _movieRepo.fetchMovieList();
    setState(
      () {},
    );
  }

  @override
  void initState() {
    getMovie();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Movies"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        color: Colors.black,
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.5 / 1.8,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10),
            itemCount: _movielist.length,
            itemBuilder: (context, index) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetail(_movielist[index].id),
                      ),
                    );
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w342${_movielist[index].posterPath}',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
