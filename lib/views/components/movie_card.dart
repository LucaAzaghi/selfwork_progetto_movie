import 'package:flutter/material.dart';
import 'package:progetto_movie/models/movie.dart';
import 'package:progetto_movie/viewmodels/movie_view_model.dart';
import 'package:progetto_movie/views/components/movie_form_dialog.dart';
import 'package:provider/provider.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(movie.title),
        subtitle: Text(
          'Anno: ${movie.year} - Durata: ${movie.duration} \nTrama: ${movie.plot}',
        ),
        trailing: Wrap(
          spacing: 8,
          children: [
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => MovieFormDialog(movie: movie),
                );
              },
              icon: Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () async {
                final bool? conferma = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Confermare la scelta'),
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () =>
                                Navigator.of(context).pop(false),
                            child: const Text(
                              'Annulla',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          TextButton(
                            onPressed: () =>
                                Navigator.of(context).pop(true),
                            child: const Text(
                              'Elimina',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
                if (conferma == true) {
                  context.read<MovieViewModel>().deleteMovie(
                    movie.id!,
                  );
                }
              },
              icon: const Icon(
                Icons.delete_forever,
                color: Colors.red,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
