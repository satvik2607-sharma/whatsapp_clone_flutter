import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp_clone_flutter/common/helper/show_alert_dialog.dart';
import 'package:whatsapp_clone_flutter/common/utils/colors.dart';
import 'package:whatsapp_clone_flutter/feature/auth/pages/image_picker_page.dart';
import 'package:whatsapp_clone_flutter/feature/auth/widgets/custom_icon_button.dart';
import 'package:whatsapp_clone_flutter/feature/auth/widgets/custom_text_field.dart';
import 'package:whatsapp_clone_flutter/feature/welcome/widgets/custom_elevated_button.dart';
import 'package:whatsapp_clone_flutter/feature/welcome/widgets/short_h_bar.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({super.key});

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  File? imageCamera;
  Uint8List? imageGallery;
  imagePickerBottomSheet() {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ShortHBar(),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  'Profile Photo',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                CustomIconButton(
                    onTap: () => Navigator.pop(context), icon: Icons.close),
                const SizedBox(
                  width: 15,
                ),
              ],
            ),
            Divider(
              color: Colors.grey!.withOpacity(0.3),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                imagePickerIcon(
                    onTap: pickmageFromCamera,
                    icon: Icons.camera_alt_rounded,
                    text: 'Camera'),
                SizedBox(
                  width: 15,
                ),
                imagePickerIcon(
                    onTap: () async {
                      Navigator.pop(context);
                      final image = await Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => ImagePickerPage()));
                      if (image == null) return;
                      setState(() {
                        imageGallery = image;
                        imageCamera = null;
                      });
                    },
                    icon: Icons.photo_camera_back_rounded,
                    text: 'Gallery')
              ],
            ),
            const SizedBox(
              height: 15,
            )
          ],
        );
      },
    );
  }

  pickmageFromCamera() async {
    try {
      Navigator.pop(context);
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      setState(() {
        imageCamera = File(image!.path);
        imageGallery = null;
      });
    } catch (e) {
      showAlertDialog(context: context, text: e.toString());
    }
  }

  imagePickerIcon(
      {required VoidCallback onTap,
      required IconData icon,
      required String text}) {
    return Column(
      children: [
        CustomIconButton(
          onTap: onTap,
          icon: icon,
          iconColor: Coloors.greenDark,
          minWidth: 50,
          border: Border.all(color: Colors.grey!.withOpacity(0.2), width: 1),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          text,
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(
          "Profile info",
          style: TextStyle(color: Coloors.greenDark),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Text(
              'Please provide your name and optional profile photo',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: imagePickerBottomSheet,
              child: Container(
                padding: EdgeInsets.all(26),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                    border: Border.all(
                      color: imageCamera == null && imageGallery == null
                          ? Colors.transparent
                          : Colors.grey!.withOpacity(0.2),
                    ),
                    image: imageCamera != null || imageGallery != null
                        ? DecorationImage(
                            fit: BoxFit.cover,
                            image: imageGallery != null
                                ? MemoryImage(imageGallery!) as ImageProvider
                                : FileImage(imageCamera!))
                        : null),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 3, right: 3),
                  child: Icon(
                    Icons.add_a_photo_rounded,
                    size: 48,
                    color: imageCamera == null && imageGallery == null
                        ? Colors.grey
                        : Colors.transparent,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: CustomTextField(
                    hintText: "Type your name here",
                    textAlign: TextAlign.left,
                    autoFocus: true,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.emoji_emotions_rounded,
                  color: Colors.grey,
                ),
                const SizedBox(
                  width: 15,
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomElevatedButton(
        buttonWidth: 90,
        onPressed: () {},
        text: "NEXT",
      ),
    );
  }
}
