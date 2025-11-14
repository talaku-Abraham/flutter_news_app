import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/firebase/favorite_dao.dart';
import 'package:news_app/data/firebase/user_dao.dart';

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

final firebaseFirestoreInstanceProvider = Provider<FirebaseFirestore>(
  (ref) => FirebaseFirestore.instance,
);
final favoriteDaoProvider = Provider<FavoriteDao>(
  (ref) => FavoriteDao(db: ref.watch(firebaseFirestoreInstanceProvider)),
);
