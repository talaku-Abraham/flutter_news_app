import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/models/user_dao.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>(
  (ref) => FirebaseAuth.instance,
);

final authStateProvider = StreamProvider<User?>((ref) {
  final userDao = ref.watch(userDaoProvider);

  return userDao.authStateChanges;
});

final userDaoProvider = Provider<UserDao>(
  (ref) => UserDao(ref.read(firebaseAuthProvider)),
);
