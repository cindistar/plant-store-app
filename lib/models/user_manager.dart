import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../helpers/firebase_errors.dart';
import 'user.dart';

class UserManager extends ChangeNotifier {
  UserManager() {
    _loadCurrentUser();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Usuario user;

  bool _loading = false;
  bool get loading => _loading;

  bool get isLoggedIn => user != null;

  Future<void> signIn(
      {Usuario user, Function onFail, Function onSuccess}) async {
    loading = true;

    try {
      final UserCredential result = await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);

      // Este 'user' é da classe User do Firebase e não o user da função
      await _loadCurrentUser(firebaseUser: result.user);

      //await Future.delayed(Duration(seconds: 4));

      onSuccess();
    } on FirebaseAuthException catch (e) {
      onFail(getErrorString(e.code));
    }
    loading = false;
  }

  Future<void> signUp(
      {Usuario user, Function onFail, Function onSuccess}) async {
    loading = true;
    try {
      final UserCredential result = await auth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);

      user.id = result.user.uid;
      this.user = user;

      await user.saveData();

      onSuccess();
    } on FirebaseAuthException catch (e) {
      onFail(getErrorString(e.code));
    }
    loading = false;
  }

  void signOut() {
    auth.signOut();
    user = null;
    notifyListeners();
  }

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> _loadCurrentUser({User firebaseUser}) async {
    final User currentUser = firebaseUser ?? auth.currentUser;
    if (currentUser != null) {
      final DocumentSnapshot docUser =
          await firestore.collection('users').doc(currentUser.uid).get();
      user = Usuario.fromDocument(docUser);
      notifyListeners();
    }
  }
}
