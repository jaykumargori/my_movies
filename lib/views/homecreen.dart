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
        title: Text("Popular Movies"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.black,
        brightness: Brightness.dark,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.5 / 1.8,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10),
            itemCount: _movielist.length,
            shrinkWrap: true,
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetail(_movielist[index].id),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://image.tmdb.org/t/p/w342${_movielist[index].posterPath}'),
                        fit: BoxFit.fill,
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20.0,
                          offset: Offset(0, 3.0),
                          color: Colors.grey.withOpacity(0.3),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
