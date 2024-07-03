import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart' as handler;
import 'package:permission_handler/permission_handler.dart';

class SelectImage {
  File? _image;
  ImagePicker picker = ImagePicker();

  //Image Picker function to get image from gallery
  Future<List<XFile?>?> getImageFromGallery(BuildContext context) async {
    try {
      XFile? photo;

      photo = await picker.pickImage(source: ImageSource.gallery);
      if (photo != null) {
        return [photo];
      }
    } catch (e) {
      var status = await Permission.photos.status;
      if (status.isDenied) {
        //this is while testing
        if (kDebugMode) {
          await showAlertDialog(context);
        }
        // ignore: use_build_context_synchronously
        await showAlertDialog(context);
        return null;
      } else {
        if (kDebugMode) {
          print('Exception occured! ${status}');
          await showAlertDialog(context);
        }
        await showAlertDialog(context);
        return null;
      }
    }
    return null;
  }

  //Image Picker function to get image from camera
  Future<String?> getImageFromCamera(BuildContext context) async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);

      if (pickedFile != null) {
        _image = File(pickedFile.path);
        return _image?.path;
      }
    } catch (e) {
      PermissionStatus status = await Permission.photos.status;
      if (status.isDenied) {
        if (kDebugMode) {
          print('Access Denied ${status}');
          await showAlertDialog(context);
        }
        await showAlertDialog(context);
      } else {
        if (kDebugMode) {
          await showAlertDialog(context);
          print('Exception occured! ${status}\nkDebugMode ${kDebugMode}');
          return null;
        }
        await showAlertDialog(context);
      }
      return null;
    }
    return null;
  }

  //Show options to get image from camera or gallery
  Future<List<String?>?> showOptions(BuildContext context) async {
    List<String?> imageArray = [];
    await showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: Text(
              'Photo Gallery',
              style: _textStyle()
            ),
            onPressed: () async {
              imageArray = [];
              // get image from gallery
              var imagePath = await getImageFromGallery(context);
              if (imagePath != null && imagePath.isNotEmpty) {
                imagePath.forEach((element) => imageArray.add(element?.path));
              }
              Get.back();
            },
          ),
          CupertinoActionSheetAction(
            child: Text(
              'camera',
              style: _textStyle(),
            ),
            onPressed: () async {
              String? imagePath = await getImageFromCamera(context);
              if (imagePath != null) {
                imageArray.clear();
                imageArray.add(imagePath);
              }
              Get.back();
            },
          ),
        ],
      ),
    );
    return imageArray;
  }

  Future showAlertDialog(context) async => await showCupertinoDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text('Permission Denied'),
          content: const Text('Allow Access'),
          actions: <CupertinoDialogAction>[
            CupertinoDialogAction(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () => openAppSettings(),
              child: const Text('Setting'),
            ),
          ],
        ),
      );
}

TextStyle _textStyle() => const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Color.fromRGBO(0, 0, 0, 0.60));
