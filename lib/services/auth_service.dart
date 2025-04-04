import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {

  // get instance of firebase auth
final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // get current user
User? getCurrentUser() {
  return _firebaseAuth.currentUser;
}
  // sign in
Future<UserCredential> signInWithEmailPassword(String email, password) async {
  try {
    // sign user in
    UserCredential userCredential =
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

  return userCredential;
  }
  on FirebaseAuthException catch (e) {
    throw Exception(e.code);
  }
}
  // sign up
Future<UserCredential> signUpWithEmailPassword(String email, password) async {
  try {
    // sign user up
    UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password,);
    return userCredential;
  }
  on FirebaseAuthException catch (e) {
    throw Exception(e.code);
  }
}
  // sign out
Future<void> signOut() async {
  return await _firebaseAuth.signOut();
}

}

extension on FirebaseAuth {
  signInWithEmailPassword({required String email, required password}) {}
  signUpWithEmailPassword({required String email, required password}) {}
}