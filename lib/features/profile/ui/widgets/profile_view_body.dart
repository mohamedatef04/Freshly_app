import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freshly_app/core/theme/app_colors.dart';
import 'package:freshly_app/core/theme/app_styles.dart';
import 'package:freshly_app/core/widgets/custom_animated_indicator.dart';
import 'package:freshly_app/core/functions/show_custom_toast.dart';
import 'package:freshly_app/features/profile/logic/cubits/user_details_cubit.dart';
import 'package:freshly_app/features/profile/ui/widgets/custom_logout_widget.dart';
import 'package:freshly_app/features/profile/ui/widgets/custom_profile_listtile.dart';
import 'package:freshly_app/features/profile/ui/widgets/custom_user_pic.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  String? name;
  String? email;
  String? phone;
  String? address;
  String? imageUrl;
  @override
  void initState() {
    context.read<UserDetailsCubit>().getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserDetailsCubit, UserDetailsState>(
      listener: (context, state) {
        if (state is UserDetailsLoaded) {
          name = state.userDetailsModel.name;
          email = state.userDetailsModel.email;
          phone = state.userDetailsModel.phone;
          address = state.userDetailsModel.address;
          imageUrl = state.userDetailsModel.imageUrl;
        } else if (state is UserDetailsError) {
          showCustomToast(
            context,
            message: state.errorMessage,
            color: AppColors.primaryColor,
            titleText: 'Error',
            type: AnimatedSnackBarType.error,
          );
        } else {
          const CustomAnimatedIndicator();
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 15.h,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 15.h,
                    children: [
                      CustomUserPic(imageUrl: imageUrl ?? ''),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text(name ?? '', style: AppStyles.black20)],
                      ),

                      SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        child: Column(
                          spacing: 20.h,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomProfileListtile(
                              leading: const Icon(Icons.email),
                              title: 'Email',
                              subtitle: email ?? '',
                            ),
                            CustomProfileListtile(
                              leading: const Icon(Icons.phone),
                              title: 'Phone',
                              subtitle: phone ?? '',
                            ),
                            CustomProfileListtile(
                              leading: const Icon(Icons.location_on),
                              title: 'Address',
                              subtitle: address ?? '',
                            ),
                          ],
                        ),
                      ),

                      const CustomLogOutWidget(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
