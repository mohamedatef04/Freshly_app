import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freshly_app/core/theme/app_styles.dart';
import 'package:freshly_app/core/utils/assets.dart';
import 'package:freshly_app/features/profile/logic/cubits/user_details_cubit.dart';
import 'package:freshly_app/features/search/ui/views/search_view.dart';
import 'package:go_router/go_router.dart';

class CustomListtile extends StatefulWidget {
  const CustomListtile({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<CustomListtile> createState() => _CustomListtileState();
}

class _CustomListtileState extends State<CustomListtile> {
  @override
  void initState() {
    context.read<UserDetailsCubit>().getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String? userName;
    String? imageUrl;
    return BlocConsumer<UserDetailsCubit, UserDetailsState>(
      listener: (context, state) {
        if (state is UserDetailsLoaded) {
          userName = state.userDetailsModel.name;
          imageUrl = state.userDetailsModel.imageUrl;
        }
      },
      builder: (context, state) {
        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  widget.scaffoldKey.currentState!.openDrawer();
                },
                icon: Icon(Icons.menu, size: 24.sp),
              ),
              Container(
                width: 44.w,
                height: 44.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color.fromARGB(255, 196, 211, 201),
                  image: DecorationImage(
                    image:
                        imageUrl != null
                            ? NetworkImage(imageUrl!)
                            : const NetworkImage(
                              'https://cdn-icons-png.flaticon.com/512/149/149071.png',
                            ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
          title: Text('Welcome !', style: AppStyles.grey16),
          subtitle: Text(userName ?? '', style: AppStyles.black18),
          trailing: GestureDetector(
            onTap: () {
              GoRouter.of(context).push(SearchView.routeName);
            },
            child: Image.asset(Assets.imagesSearch, width: 24.w),
          ),
        );
      },
    );
  }
}
