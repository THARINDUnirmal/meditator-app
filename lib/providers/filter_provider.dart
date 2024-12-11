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

  Future<void> getAllData(BuildContext context) async {
    // Future.delayed(Duration.zero);
    List<MeditationModel> meditationData =
        Provider.of<MeditationProvider>(context).meditatonExercise;

    List<MindfulnessModel> mindfullData =
        Provider.of<MindfulnessProvider>(context).mindfullExercise;

    List<SleepStoriesModel> sleepStoriiesData =
        Provider.of<SleepStoriesProvider>(context).sleepExercise;

    _allData = [
      ...meditationData,
      ...mindfullData,
      ...sleepStoriiesData,
    ];

    _allData = List.from(_filteredData);

    notifyListeners();
  }

  List<dynamic> get fetchAllData => _filteredData;
}
