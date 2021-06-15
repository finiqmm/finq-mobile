import 'package:finq/presentation/bloc/profile/profile_bloc.dart';
import 'package:finq/presentation/widgets/rounded_profile_icon.dart';
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
                      color: Colors.red,
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
                              textAlign: TextAlign.center)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 90,
                  width: 90,
                  child: ClipOval(
                    child: RoundedProfileIcon(imageUrl: userAvatarUrl),
                  ),
                ),
              )
            ],
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
