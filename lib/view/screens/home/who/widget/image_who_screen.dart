import 'dart:io';
import 'package:flutter/material.dart';
import 'package:task_kafel_company/constant/my_theme.dart';

class ImageWhoScreen extends StatelessWidget {
  final String? imagePath;

  const ImageWhoScreen(
      {super.key,
      this.imagePath,
      required Future<void> Function(String path) onImageSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: MyTheme.primaryColor, width: 3),
      ),
      child: CircleAvatar(
        backgroundImage: imagePath == null || imagePath!.isEmpty
            ? const AssetImage('assets/images/me.jpeg')
            : FileImage(File(imagePath!)) as ImageProvider,
        radius: 60,
      ),
    );
  }
}
