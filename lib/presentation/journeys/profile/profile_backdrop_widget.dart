import 'package:finq/common/constants/size_constants.dart';
import 'package:finq/presentation/bloc/profile/profile_bloc.dart';
import 'package:finq/presentation/common_widget/rounded_profile_icon.dart';
import 'package:finq/common/extension/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBackdropWidget extends StatelessWidget {
  const ProfileBackdropWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoaded) {
          final userName = state.user?.name;
          final userAvatarUrl = state.user?.avatarUrl;
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 90 / 2),
                child: FractionallySizedBox(
                  heightFactor: 1,
                  alignment: Alignment.topCenter,
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(32)),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.1, 0.4, 0.7, 0.9],
                          colors: [
                            Color(0xFF3594DD),
                            Color(0xFF4563DB),
                            Color(0xFF5036D5),
                            Color(0xFF5B16D0),
                          ],
                        ),
                      ),
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (userName != null) Text(userName),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                              'Life is short bro.Keep Going...,Life is short bro.Keep Going...,Life is short bro.Keep Going...',
                              maxLines: 3,
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: RoundedProfileIcon(
                  imageUrl: userAvatarUrl,
                  height: Sizes.dimen_40.h,
                  width: Sizes.dimen_90.w,
                ),
              ),
            ],
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
