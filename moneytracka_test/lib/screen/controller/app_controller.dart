import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moneytracka_test/provider/provider.dart';
import 'package:moneytracka_test/app_themes/app_text.dart';
import 'package:moneytracka_test/app_themes/app_colors.dart';

class CheckPassword {
  static var refProvider;

// check if the user password contains any of the requirement
  static checkPasswordStrength() {
    final userPassword = refProvider.watch(passwordChecker);
    if (userPassword.toString().length > 7) {
      refProvider.read(passwordEightCharacters.notifier).state = true;
    } else {
      refProvider.read(passwordEightCharacters.notifier).state = false;
    }
    if (userPassword.toString().contains(RegExp(r'[A-Z]')) ||
        userPassword.toString().contains(RegExp(r'[a-z]'))) {
      refProvider.read(uppercasePassword.notifier).state = true;
    } else {
      refProvider.read(uppercasePassword.notifier).state = false;
    }
    if (userPassword.toString().contains(RegExp(
        r'[!@#$¥%^&*()¢_+{}\[\]:;<>,$€.?~\£\-← ↑ → ↓ ↔ ↕ ↖ ↗ ↘ ↙× ÷ = < > ≤ ≥ ≠ ≈ ± √ ∑ ∫ ∆ π ≡ ∞ ∠]'))) {
      refProvider.read(passwordContainsSymbols.notifier).state = true;
    } else {
      refProvider.read(passwordContainsSymbols.notifier).state = false;
    }
  }
}

class ImageSelector {
  static final ImagePicker picker = ImagePicker();
  static XFile? image;

  // Function to show the options bottom sheet
  static void showImagePickerOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading:
                  Icon(Icons.camera, color: AppColors.blackColor, size: 23),
              title: Text('Take a photo',
                  style: AppTextStyle.regular()
                      .copyWith(fontSize: 18, color: AppColors.blackColor)),
              onTap: () {
                Navigator.pop(context);
                takePhoto();
              },
            ),
            ListTile(
              leading: Icon(Icons.image, color: AppColors.blackColor, size: 23),
              title: Text('Choose from gallery',
                  style: AppTextStyle.regular()
                      .copyWith(fontSize: 18, color: AppColors.blackColor)),
              onTap: () {
                Navigator.pop(context);
                getImage();
              },
            ),
          ],
        );
      },
    );
  }

// Function to capture photo
  static Future<void> takePhoto() async {
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      image = pickedFile;
    }
  }

  // get image from user phone storage
  static Future<void> getImage() async {
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    
    image = pickedFile;
  }
}
