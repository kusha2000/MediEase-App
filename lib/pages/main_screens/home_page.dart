import 'package:flutter/material.dart';
import 'package:mediease/utils/colors.dart';
import 'package:mediease/utils/text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    width: MediaQuery.of(context).size.width * 0.15,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "MediEase",
                    style: TextStyle(
                        fontSize: 29,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryBlue),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Select a Category to start exploring",
              style: AppTextStyles.subtitleStyle
                  .copyWith(color: AppColors.primaryDarkBlue),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.primaryBlue.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FilterChip(label: Text("All"), onSelected: (value) {}),
                    SizedBox(
                      width: 8,
                    ),
                    FilterChip(
                        label: Text("Mindfulness"), onSelected: (value) {}),
                    SizedBox(
                      width: 8,
                    ),
                    FilterChip(
                        label: Text("Meditation"), onSelected: (value) {}),
                    SizedBox(
                      width: 8,
                    ),
                    FilterChip(label: Text("Sleep"), onSelected: (value) {}),
                  ],
                ),
              ),
            )
          ],
        ),
      ))),
    );
  }
}
