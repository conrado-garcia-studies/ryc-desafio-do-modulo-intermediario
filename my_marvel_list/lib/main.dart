import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_marvel_list/screens/about_screen.dart';
import 'package:my_marvel_list/screens/my_list_screen.dart';
import 'package:my_marvel_list/screens/series_selection_screen.dart';
import 'package:my_marvel_list/screens/splash_screen.dart';
import 'package:my_marvel_list/stores/my_list_store.dart';

import 'utils/app_routes.dart';

void main() {
  dotenv.load(fileName: '.env');
  GetIt.I.registerSingleton<MyListStore>(MyListStore());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(final BuildContext context) {
    return MaterialApp(
      home: const SplashScreen(),
      routes: <String, WidgetBuilder>{
        AppRoutes.about: (_) => const AboutScreen(),
        AppRoutes.myList: (_) => const MyListScreen(),
        AppRoutes.seriesSelection: (_) => const SeriesSelectionScreen(
              title: 'All Comic Series',
              routeName: AppRoutes.seriesSelection,
              specificQueryParameters: <String, dynamic>{},
            ),
      },
      title: 'MyMarvelList',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(
          primary: Color.fromRGBO(236, 29, 36, 1),
        ),
        textTheme: GoogleFonts.poppinsTextTheme().apply(
          bodyColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
            surfaceTintColor: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
