import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freshly_app/core/theme/app_colors.dart';
import 'package:freshly_app/features/profile/logic/cubits/upload_profile_image_cubit.dart';
import 'package:image_picker/image_picker.dart';

class CustomUserPic extends StatefulWidget {
  const CustomUserPic({super.key, required this.imageUrl});

  final String? imageUrl;

  @override
  State<CustomUserPic> createState() => _CustomUserPicState();
}

class _CustomUserPicState extends State<CustomUserPic> {
  File? imageFile;
  String? imagePath;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
              width: 139.w,
              height: 139.h,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.greyColor),
                shape: BoxShape.circle,
                image: DecorationImage(
                  image:
                      widget.imageUrl != null
                          ? NetworkImage(widget.imageUrl!)
                          : imageFile != null
                          ? FileImage(imageFile!)
                          : const NetworkImage(
                            'https://cdn-icons-png.flaticon.com/512/149/149071.png',
                          ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              bottom: 12.h,
              right: 0,
              child: Container(
                width: 30.w,
                height: 30.h,
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: IconButton(
                    onPressed: () async {
                      final ImagePicker picker = ImagePicker();
                      // Pick an image.
                      final XFile? image = await picker.pickImage(
                        source: ImageSource.gallery,
                      );

                      setState(() {
                        imageFile = File(image!.path);
                        imagePath = image.path.split('/').last;
                      });

                      context
                          .read<UploadProfileImageCubit>()
                          .uploadProfileImage(
                            image: imageFile!,
                            path: imagePath!,
                          );
                    },
                    icon: Icon(
                      Icons.camera_alt,
                      color: AppColors.whiteColor,
                      size: 15.sp,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
