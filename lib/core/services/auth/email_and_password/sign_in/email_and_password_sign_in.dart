import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../app/modules/bottom_navigation/pages/bottom_navigation_bar.dart';
import '../../../../models/user/user.dart';
import '../../../../view_model/user/user_view_model.dart';

/// [loginUserWithEmailAndPassword] is a Method that connects with the Firebase
/// server, login the user, and redirects the user to [BottomNavigation].
/// Used in [SignInWithEmailAndPasswordPage].
Future<void> loginUserWithEmailAndPassword(
    BuildContext context, User user) async {
  assert(context != null);
  var _auth = FirebaseAuth.instance;

  await _auth
      .signInWithEmailAndPassword(email: user.email, password: user.password)
      .then((firebaseUser) {
    GetIt.I.get<UserViewModel>().recoverUserData();
    Navigator.pushNamedAndRemoveUntil(
      context,
      BottomNavigator.id,
      (route) => false,
    );
  }).catchError((error) {
    debugPrint(error);
    debugPrint('Unable to register. Try again later!');
  });
}
