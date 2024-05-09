import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class pickImage{
  PickupSingleImage(int sdkInt,File? image) async{
    if(Platform.isAndroid) {

      if (sdkInt < 33) {
        var photo = await Permission.manageExternalStorage.status;
        if (photo.isGranted) {
         _pickImageFromGallery(image);
        } else if (photo.isPermanentlyDenied) {
          openAppSettings();
        } else {
          await Permission.manageExternalStorage.request();
          _pickImageFromGallery(image);
        }
      }else{
        var photo = await Permission
            .photos.status;
        if (photo.isGranted) {
          _pickImageFromGallery(image);
        } else if (photo.isPermanentlyDenied) {
          openAppSettings();
        } else {
          await Permission.photos.request();
          _pickImageFromGallery(image);
        }
      }
    }
    return image;
  }

  PickupMultipleImage(int sdkInt,List<XFile> image) async{
    if(Platform.isAndroid) {

      if (sdkInt < 33) {
        var photo = await Permission.manageExternalStorage.status;
        if (photo.isGranted) {
          _pickMultipleImage(image);
        } else if (photo.isPermanentlyDenied) {
          openAppSettings();
        } else {
          await Permission.manageExternalStorage.request();
          _pickMultipleImage(image);
        }
      }else{
        var photo = await Permission
            .photos.status;
        if (photo.isGranted) {
          _pickMultipleImage(image);
        } else if (photo.isPermanentlyDenied) {
          openAppSettings();
        } else {
          await Permission.photos.request();
          _pickMultipleImage(image);
        }
      }
    }
  }

  Future<File> _pickImageFromGallery(File? image) async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    image = File(pickedFile!.path);
    return  image;
  }

  Future<List<XFile>> _pickMultipleImage(List<XFile> image) async{

    final pickedFile = await ImagePicker().pickMultiImage(limit: 5);
    if (pickedFile.isNotEmpty) {
      image.addAll(pickedFile);
    }
    print("Image List Length:" + image.length.toString());
    return  image;
  }

}