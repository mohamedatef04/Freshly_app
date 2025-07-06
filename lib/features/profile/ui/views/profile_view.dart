import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freshly_app/core/functions/show_snak_bar.dart';
import 'package:freshly_app/core/services/get_it_service.dart';
import 'package:freshly_app/core/theme/app_colors.dart';
import 'package:freshly_app/features/profile/data/repos/profile_repo_impl.dart';
import 'package:freshly_app/features/profile/logic/cubits/upload_profile_image_cubit.dart';
import 'package:freshly_app/features/profile/ui/widgets/profile_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static const routeName = '/profile-view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => UploadProfileImageCubit(getIt.get<ProfileRepoImpl>()),
      child: BlocConsumer<UploadProfileImageCubit, UploadProfileImageState>(
        listener: (context, state) {
          if (state is UploadProfileImageSuccess) {
            showSnakBar(
              context,
              message: 'Image uploaded successfully',
              color: AppColors.blackColor,
            );
          } else if (state is UploadProfileImageFailure) {
            showSnakBar(
              context,
              message: state.errorMessage,
              color: AppColors.blackColor,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: ModalProgressHUD(
              inAsyncCall: state is UploadProfileImageLoading,
              child: const ProfileViewBody(),
            ),
          );
        },
      ),
    );
  }
}
