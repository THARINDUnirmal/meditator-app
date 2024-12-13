import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:meditator_app/models/meditation_model.dart';
import 'package:meditator_app/models/mindfulness_model.dart';
import 'package:meditator_app/providers/filter_provider.dart';
import 'package:meditator_app/utils/app_text_styles.dart';
import 'package:meditator_app/utils/colors.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: Provider.of<FilterProvider>(context, listen: false)
              .getData(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  "Error : ${snapshot.error}",
                  style: AppTextStyles.bodyText,
                  textAlign: TextAlign.center,
                ),
              );
            } else {
              return Consumer(
                builder: (context, FilterProvider provider, child) {
                  final getListData = provider.fetchAllData;
                  getListData.shuffle();
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/meditation.png",
                                width: MediaQuery.of(context).size.width * 0.13,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Meditator",
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryBlue.withOpacity(0.9),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Select a category to Start exploring",
                            style: AppTextStyles.subTitle,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                color: AppColors.primaryPurple,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  FilterChip(
                                    label: Text(
                                      "All",
                                      style: AppTextStyles.bodyText.copyWith(
                                        fontSize: 16,
                                        color: provider.gerSelectCategeory() ==
                                                "All"
                                            ? AppColors.primaryWhite
                                            : AppColors.primaryBlack,
                                      ),
                                    ),
                                    onSelected: (value) {
                                      provider.filteredData("All");
                                    },
                                    selected:
                                        provider.gerSelectCategeory() == "All",
                                    selectedColor: AppColors.primaryBlue,
                                    showCheckmark: false,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  FilterChip(
                                    label: Text(
                                      "Mindfulness",
                                      style: AppTextStyles.bodyText.copyWith(
                                        fontSize: 16,
                                        color: provider.gerSelectCategeory() ==
                                                "Mindfulness"
                                            ? AppColors.primaryWhite
                                            : AppColors.primaryBlack,
                                      ),
                                    ),
                                    onSelected: (value) {
                                      provider.filteredData("Mindfulness");
                                    },
                                    selected: provider.gerSelectCategeory() ==
                                        "Mindfulness",
                                    selectedColor: AppColors.primaryBlue,
                                    showCheckmark: false,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  FilterChip(
                                    label: Text(
                                      "Meditation",
                                      style: AppTextStyles.bodyText.copyWith(
                                        fontSize: 16,
                                        color: provider.gerSelectCategeory() ==
                                                "Meditation"
                                            ? AppColors.primaryWhite
                                            : AppColors.primaryBlack,
                                      ),
                                    ),
                                    onSelected: (value) {
                                      provider.filteredData("Meditation");
                                    },
                                    selected: provider.gerSelectCategeory() ==
                                        "Meditation",
                                    selectedColor: AppColors.primaryBlue,
                                    showCheckmark: false,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  FilterChip(
                                    label: Text(
                                      "Sleep Stories",
                                      style: AppTextStyles.bodyText.copyWith(
                                        fontSize: 16,
                                        color: provider.gerSelectCategeory() ==
                                                "SleepStories"
                                            ? AppColors.primaryWhite
                                            : AppColors.primaryBlack,
                                      ),
                                    ),
                                    onSelected: (value) {
                                      provider.filteredData("SleepStories");
                                    },
                                    selected: provider.gerSelectCategeory() ==
                                        "SleepStories",
                                    selectedColor: AppColors.primaryBlue,
                                    showCheckmark: false,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          if (getListData.isNotEmpty)
                            StaggeredGrid.count(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              children: getListData.map((e) {
                                return GestureDetector(
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: e is MeditationModel
                                          ? AppColors.primaryGreen
                                          : e is MindfulnessModel
                                              ? AppColors.primaryBlue
                                              : AppColors.primaryGrey2,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          e.name,
                                          style:
                                              AppTextStyles.subTitle.copyWith(
                                            color: AppColors.primaryWhite,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          e.category,
                                          style:
                                              AppTextStyles.subTitle.copyWith(
                                            color: AppColors.primaryBlack
                                                .withOpacity(0.7),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          e.description,
                                          style:
                                              AppTextStyles.bodyText.copyWith(
                                            color: AppColors.primaryWhite,
                                          ),
                                          maxLines: (e.description.length / 2)
                                              .toInt(),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                            )
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
