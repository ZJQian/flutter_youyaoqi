import "package:flutter/material.dart";
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class MineProvide extends ChangeNotifier {

  File fileImage;

  /// 打开相机
  openCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    fileImage = image;
    notifyListeners();
  }

  /// 打开相册
  openPhotoLibrary() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    fileImage = image;
    notifyListeners();
  }
}