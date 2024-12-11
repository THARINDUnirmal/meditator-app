import 'package:flutter/material.dart';
import 'package:meditator_app/models/meditation_model.dart';
import 'package:meditator_app/models/mindfulness_model.dart';
import 'package:meditator_app/models/sleep_stories_model.dart';
import 'package:meditator_app/providers/meditation_provider.dart';
import 'package:meditator_app/providers/mindfulness_provider.dart';
import 'package:meditator_app/providers/sleep_stories_provider.dart';
import 'package:provider/provider.dart';

class FilterProvider extends ChangeNotifier {
  List<dynamic> _allData = [];
  List<dynamic> _filteredData = [];

  Future<void> getData(BuildContext context) async {
    await Future.delayed(Duration.zero); // Ensures this runs after build

    final List<MindfulnessModel> mindfullExercise =
        Provider.of<MindfulnessProvider>(context, listen: false)
            .mindfullExercise;

    final List<SleepStoriesModel> sleepContent =
        Provider.of<SleepStoriesProvider>(context, listen: false).sleepExercise;

    final List<MeditationModel> meditations =
        Provider.of<MeditationProvider>(context, listen: false)
            .meditatonExercise;

    _allData = [
      ...mindfullExercise,
      ...sleepContent,
      ...meditations,
    ];

    _filteredData = _allData;
    notifyListeners();
  }

  List<dynamic> get fetchAllData => _filteredData;
}
