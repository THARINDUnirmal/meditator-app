import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meditator_app/providers/filter_provider.dart';
import 'package:meditator_app/providers/meditation_provider.dart';
import 'package:meditator_app/providers/mindfulness_provider.dart';
import 'package:meditator_app/providers/sleep_stories_provider.dart';
import 'package:meditator_app/routers/routers.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => MindfulnessProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => MeditationProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => SleepStoriesProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => FilterProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      routerConfig: Routers().routes,
    );
  }
}
