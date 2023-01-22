import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:delivery_app/consts/consts.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;

  //textConroller
  var emailConroller = TextEditingController();
  var passwordConroller = TextEditingController();

  //login method
  Future<UserCredential?> loginMethod({context}) async {
    UserCredential? userCredential;

    try {
      userCredential = await auth.signInWithEmailAndPassword(
          email: emailConroller.text, password: passwordConroller.text);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  //signUp method
  Future<UserCredential?> signupMethod({email, password, context}) async {
    UserCredential? userCredential;

    try {
      userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  //storing data method

  storeUserData({name, password, email}) async {
    DocumentReference store =
        firestore.collection(userCollection).doc(currentUser!.uid);
    store.set({
      'name': name,
      'password': password,
      'email': email,
      'imageUrl': '',
      'id': currentUser!.uid,
      'cart_count': '00',
      'wishlist_count': '00',
      'order_count': '00',
    });
  }

  //signout Method
  signOutMethod(context) async {
    try {
      auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
