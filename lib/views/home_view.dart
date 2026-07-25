import 'package:flutter/material.dart';
import 'package:progetto_movie/viewmodels/movie_view_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget{
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
        context.read<MovieViewModel>().fetchMovies();
      }
    );

    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Movie Collection APP'))),
      body: Consumer<MovieViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (viewModel.movies.isEmpty) {
            return const Center(
              child: Text('Non hai inserito nessun film', textAlign: TextAlign.center, style: TextStyle(fontSize: 25)),
            );
          }

          return const Text('COMING SOON!!', style: TextStyle(fontSize: 50, color: Colors.red, fontWeight: FontWeight.bold));
        }
      ),
    );
  }
  
}