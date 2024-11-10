// profile_controller.dart

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController {
  File? profileImage;
  final ImagePicker picker = ImagePicker();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String? selectedGender;

  Future<void> pickImage(BuildContext context) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      // Trigger UI update
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Image picked successfully!')),
      );
    }
  }

  void completeProfile() {
    // Logic to handle profile completion
    print('Name: ${nameController.text}');
    print('Phone: ${phoneController.text}');
    print('Gender: $selectedGender');
  }
}
