import '../consts/consts.dart';

class FirestoreServices {
  static getUser(uid) {
    return firestore
        .collection(userCollection).snapshots();
  }
}
