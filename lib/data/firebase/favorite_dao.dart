import 'package:cloud_firestore/cloud_firestore.dart';

class FavoriteDao {
  FavoriteDao({required this.db});

  final FirebaseFirestore db;

  Future<bool> isFavorite(String userId, String articleUrl) async {
    final query =
        await db
            .collection("Users")
            .doc(userId)
            .collection("Favorites")
            .where('articleUrl', isEqualTo: articleUrl)
            .limit(1)
            .get();

    return query.docs.isEmpty ? false : true;
  }

  Future<void> addFavorite(String userId, String articleUrl) async {
    await db.collection("users").doc(userId).collection('favorites').add({
      'articleId': articleUrl,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> removeFavorite(String userId, String articleId) async {
    await db
        .collection("users")
        .doc(userId)
        .collection('favorites')
        .doc(articleId)
        .delete();
  }

  //   addFavorite(userId, articleId)

  // removeFavorite(userId, articleId)

  // isFavorite(userId, articleId)

  // getUserFavorites(userId)

  // toggleFavorite(userId, articleId)
}
