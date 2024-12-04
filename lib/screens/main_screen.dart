import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditator_app/screens/main_screens/create_creen.dart';
import 'package:meditator_app/screens/main_screens/home_screen.dart';
import 'package:meditator_app/screens/main_screens/meditation_screen.dart';
import 'package:meditator_app/screens/main_screens/profile_screen.dart';
import 'package:meditator_app/screens/main_screens/status_screen.dart';
import 'package:meditator_app/utils/colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selecterdIndex = 0;
  final List<Widget> _mainPages = const [
    HomeScreen(),
    MeditationScreen(),
    CreateScreen(),
    StatusScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          currentIndex: _selecterdIndex,
          onTap: (index) {
            setState(() {
              _selecterdIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/home.svg",
                colorFilter: ColorFilter.mode(
                    _selecterdIndex == 0
                        ? AppColors.primaryBlue
                        : AppColors.primaryGrey,
                    BlendMode.srcIn),
                semanticsLabel: "Home-svg",
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/brain.svg",
                colorFilter: ColorFilter.mode(
                    _selecterdIndex == 1
                        ? AppColors.primaryBlue
                        : AppColors.primaryGrey,
                    BlendMode.srcIn),
                semanticsLabel: "Meditation-svg",
              ),
              label: "Meditation",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/circle-plus.svg",
                colorFilter: ColorFilter.mode(
                    _selecterdIndex == 2
                        ? AppColors.primaryBlue
                        : AppColors.primaryGrey,
                    BlendMode.srcIn),
                semanticsLabel: "Plus-svg",
              ),
              label: "Create",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/file-plus-2.svg",
                colorFilter: ColorFilter.mode(
                    _selecterdIndex == 3
                        ? AppColors.primaryBlue
                        : AppColors.primaryGrey,
                    BlendMode.srcIn),
                semanticsLabel: "Status-svg",
              ),
              label: "Status",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/user-cog.svg",
                colorFilter: ColorFilter.mode(
                    _selecterdIndex == 4
                        ? AppColors.primaryBlue
                        : AppColors.primaryGrey,
                    BlendMode.srcIn),
                semanticsLabel: "Profile-svg",
              ),
              label: "Profile",
            ),
          ],
          selectedItemColor: AppColors.primaryBlue,
          unselectedItemColor: AppColors.primaryGrey,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: false,
        ),
      ),
      body: _mainPages[_selecterdIndex],
    );
  }
}
