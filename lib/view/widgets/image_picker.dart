import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:task_kafel_company/constant/my_theme.dart';

class ImageUpload extends StatefulWidget {
  final Function(String path) onImageSelected;

  const ImageUpload({super.key, required this.onImageSelected});

  @override
  // ignore: library_private_types_in_public_api
  _ImageUploadState createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  File? _imageFile;

  Future<File?> cameraPicker() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      return File(image.path);
    }
    return null;
  }

  Future<File?> galleryPicker() async {
    PermissionStatus status;
    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      if (androidInfo.version.sdkInt <= 32) {
        status = await Permission.storage.request();
      } else {
        status = await Permission.photos.request();
      }
    } else {
      status = await Permission.photos.request();
    }
    if (status.isGranted) {
      var image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        return File(image.path);
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: dialog,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: MyTheme.primaryColor, width: 3),
          ),
          child: CircleAvatar(
            backgroundImage: _imageFile == null
                ? const AssetImage('assets/images/me.jpeg')
                : FileImage(_imageFile!),
            radius: 60,
            child: _imageFile == null
                ? Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: MyTheme.primaryColor,
                      ),
                      child: Icon(
                        Icons.add,
                        size: 20,
                        color: MyTheme.whiteColor,
                      ),
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }

  void dialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () async {
                      final temp = await cameraPicker();
                      if (temp != null) {
                        setState(() {
                          _imageFile = temp;
                          widget.onImageSelected(temp.path);
                        });
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                      }
                    },
                    icon: Icon(Icons.camera_alt_outlined,
                        size: 40, color: Theme.of(context).primaryColor),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Camera",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: MyTheme.primaryColor,
                          fontSize: 15,
                        ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () async {
                      final temp = await galleryPicker();
                      if (temp != null) {
                        setState(() {
                          _imageFile = temp;
                          widget.onImageSelected(temp.path);
                        });
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                      }
                    },
                    icon: Icon(Icons.image_outlined,
                        size: 40, color: Theme.of(context).primaryColor),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Gallery",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: MyTheme.primaryColor,
                          fontSize: 15,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
