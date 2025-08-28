/*
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helper/navigator.dart';
import '../../../core/utils/app_route.dart';
import '../../auth/data/model/user_model.dart';
import '../../auth/views/login_view.dart';
import '../cubit/user_cubit.dart';
import '../cubit/user_state.dart';

class HomeViews extends StatelessWidget {
  static String id = AppRoute.home;
  final UserModel? user;

  const HomeViews({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit()..controlUser(user!),
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              if (state is UserLoading) {
                return CircularProgressIndicator();
              } else if (state is UserError) {
                return Text(state.error);
              } else if (state is UserSuccess) {
                return Text(state.user.email);
              } else {
                return SizedBox();
              }
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigation.goTo(
                  context,
                  LoginView(),
                  type: NavigationType.pushAndRemoveUntil,
                );
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
*/
