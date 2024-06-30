import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // Implementasi auth service
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // get current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // sign in/login
  Future<UserCredential> signInWithEmailPassword(String email, password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    }
    // tangkap semua error
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // sign up/register akun
  Future<UserCredential> signUpWithEmailPassword(String email, password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    }
    // tangkap semua error
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // logout
  Future<void> signOut() async {
    return await _auth.signOut();
  }
}
