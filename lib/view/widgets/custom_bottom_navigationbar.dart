import 'package:flutter/material.dart';
import 'package:task_kafel_company/constant/image.dart';
import 'package:task_kafel_company/constant/my_theme.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0, // Set the height of the bottom navigation bar
      decoration: BoxDecoration(
        color: MyTheme.whiteColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, -1),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTap,
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(ImageApp.whoImage)),
              label: "Who Am I",
            ),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(ImageApp.countryImage)),
                label: "Countries"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(ImageApp.servicesImage)),
                label: "Services"),
          ],
        ),
      ),
    );
  }
}
