import 'package:flutter/material.dart';
import 'package:meditator_app/utils/app_text_styles.dart';
import 'package:meditator_app/utils/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                          color: WidgetStatePropertyAll(AppColors.primaryBlue),
                          label: Text(
                            "All",
                            style: AppTextStyles.bodyText.copyWith(
                              color: AppColors.primaryWhite,
                              fontSize: 16,
                            ),
                          ),
                          onSelected: (value) {},
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        FilterChip(
                          label: const Text("Mindfulness"),
                          onSelected: (value) {},
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        FilterChip(
                          label: const Text("Meditation"),
                          onSelected: (value) {},
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        FilterChip(
                          label: const Text("Sleep Stories"),
                          onSelected: (value) {},
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
