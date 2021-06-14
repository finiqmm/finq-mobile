import 'package:finq/common/constants/route_constants.dart';
import 'package:finq/di/get_it.dart';
import 'package:finq/presentation/bloc/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      appBar: AppBar(
        title: Text('data'),
      ),
      body: BlocProvider<AuthBloc>(
        create: (context) => authBloc,
        child: Center(
            child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: () => authBloc.add(SignInPressed()),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                primary: Theme.of(context).accentColor,
              ),
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
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(RouteList.main, (route) => false);
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
        )),
      ),
    );
  }
}
