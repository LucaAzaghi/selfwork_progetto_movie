import 'package:flutter/material.dart';
import 'package:progetto_movie/viewmodels/movie_view_model.dart';
import 'package:progetto_movie/views/home_view.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart'; // 1. Importa Supabase

void main() async {
  // 2. Rendi il main async
  WidgetsFlutterBinding.ensureInitialized(); // 3. Obbligatorio per i binding

  // 4. Inizializza Supabase con i dati del tuo progetto
  await Supabase.initialize(
    url: 'https://ozujvgbvzrwspnexvhra.supabase.co',
    anonKey: 'sb_publishable_MQ812UdDQrd6FuM0FP866Q_suwAWbvl',
  );

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => MovieViewModel())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Progetto Movie',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomeView(),
    );
  }
}
