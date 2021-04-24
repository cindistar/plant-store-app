import 'package:cloud_firestore/cloud_firestore.dart';

class Usuario {
  Usuario({this.email, this.password, this.name, this.id});

  Usuario.fromDocument(DocumentSnapshot document) {
    id = document.id;
    name = document.data()['name'] as String;
    email = document.data()['email'] as String;
  }

  String id;
  String name;
  String email;
  String password;

  String confirmPassword;

  DocumentReference get firesttoreRef =>
      FirebaseFirestore.instance.doc('users/$id');

  CollectionReference get cartReference => firesttoreRef.collection('cart');

  Future<void> saveData() async {
    await firesttoreRef.set(toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }
}
