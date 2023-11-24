import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAutenticacao {
  final FirebaseAuth _auth = FirebaseAuth.instance;
}

final fAutenticacao = FirebaseAutenticacao();