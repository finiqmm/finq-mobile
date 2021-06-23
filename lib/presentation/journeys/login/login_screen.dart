import 'package:finq/common/constants/route_constants.dart';
import 'package:finq/common/constants/size_constants.dart';
import 'package:finq/di/get_it.dart';
import 'package:finq/presentation/bloc/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finq/common/extension/size_extension.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final AuthBloc authBloc;
  @override
  void initState() {
    super.initState();
    authBloc = getItInstance<AuthBloc>();
  }

  @override
  void dispose() {
    authBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<AuthBloc>(
        create: (context) => authBloc,
        child: Container(
          
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: Sizes.dimen_230.w,
                height: Sizes.dimen_230.h,
                child: Image.asset(
                  'assets/launcher_icon/app_icon.png',
                  fit: BoxFit.contain,
                ),
              ),
              ElevatedButton.icon(
                onPressed: () => authBloc.add(SignInPressed()),
                label: const Text(
                  'SIGN IN WITH GOOGLE',
                  style: TextStyle(color: Colors.white),
                ),
                icon: const Icon(FontAwesomeIcons.google, color: Colors.white),
              ),
              SizedBox(
                height: 30,
              ),
              BlocConsumer<AuthBloc, AuthState>(
                listenWhen: (previous, current) => current is SignInSuccess,
                listener: (context, state) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      RouteList.main, (route) => false);
                },
                builder: (context, state) {
                  if (state is SignInLoading) {
                    return CircularProgressIndicator();
                  }
                  if (state is SignInError) {
                    return Text('Something went wrong');
                  }
                  return SizedBox.shrink();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
