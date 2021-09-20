import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_providers.dart';
import 'package:peliculas/search/search_delegate.dart';
import 'package:peliculas/widgets/card_swipper.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold
    (
      appBar: AppBar
      (
        title: Text('Películas en cines'),
        elevation: 0,
        actions: 
        [
          IconButton(onPressed: () => showSearch(context: context, delegate: MovieSearchDelegate()), icon: Icon(Icons.search_outlined))
        ],
      ),
      body: 
      SingleChildScrollView
      (
        child: Column
        (
          children: 
          [
            // Tarjetas principales
            CardSwiper(movies: moviesProvider.onDisplayMovies),

            // Slider de películas
            MovieSlider(movies: moviesProvider.popularMovies, title: 'Películas populares', onNextPage: () => moviesProvider.getPopularMovies()),
          ],
        ),
      ),
      backgroundColor: Color.fromRGBO(211, 211, 211, 1),
    );
  }
}