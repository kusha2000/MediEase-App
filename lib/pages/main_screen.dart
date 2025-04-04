import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mediease/pages/main_screens/create_custom_exercise_page.dart';
import 'package:mediease/pages/main_screens/custom_exercise_page.dart';
import 'package:mediease/pages/main_screens/home_page.dart';
import 'package:mediease/pages/main_screens/mindfull_exercise_page.dart';
import 'package:mediease/pages/main_screens/profile_page.dart';
import 'package:mediease/utils/colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = [
    CreateExercisePage(),
    HomePage(),
    MindFullExercisePage(),
    CustomExercisePage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: BottomNavigationBar(
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/home.svg",
                  colorFilter: ColorFilter.mode(
                      _selectedIndex == 0
                          ? AppColors.primaryBlue
                          : AppColors.primaryGrey,
                      BlendMode.srcIn),
                  semanticsLabel: "home svg",
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/brain.svg",
                  colorFilter: ColorFilter.mode(
                      _selectedIndex == 1
                          ? AppColors.primaryBlue
                          : AppColors.primaryGrey,
                      BlendMode.srcIn),
                  semanticsLabel: "brain svg",
                ),
                label: "MindFull"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/circle-plus.svg",
                  colorFilter: ColorFilter.mode(
                      _selectedIndex == 2
                          ? AppColors.primaryBlue
                          : AppColors.primaryGrey,
                      BlendMode.srcIn),
                  semanticsLabel: "circle-plus svg",
                ),
                label: "Create"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/file-plus-2.svg",
                  colorFilter: ColorFilter.mode(
                      _selectedIndex == 3
                          ? AppColors.primaryBlue
                          : AppColors.primaryGrey,
                      BlendMode.srcIn),
                  semanticsLabel: "file-plus-2 svg",
                ),
                label: "Custom"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/user-round-cog.svg",
                  colorFilter: ColorFilter.mode(
                      _selectedIndex == 4
                          ? AppColors.primaryBlue
                          : AppColors.primaryGrey,
                      BlendMode.srcIn),
                  semanticsLabel: "user-round-cog svg",
                ),
                label: "Profile"),
          ],
          selectedItemColor: AppColors.primaryBlue,
          unselectedItemColor: AppColors.primaryGrey,
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
