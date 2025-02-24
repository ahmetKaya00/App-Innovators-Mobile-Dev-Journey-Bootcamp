import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationModel{
  final FirebaseAuth _auth = FirebaseAuth.instance;

Future<User?> loginWithEmailAndPassword(String email, String password) async{
  try{
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
    );
    return userCredential.user;
  }on FirebaseAuthException catch (e){
    throw Exception(e.message);
  }
}
Future<User?> registerWithEmailAndPassword(String email, String password) async{
  try{
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
    );
    if(userCredential.user != null && !userCredential.user!.emailVerified){
      await userCredential.user!.sendEmailVerification();
    }
    return userCredential.user;
  }on FirebaseAuthException catch(e){
    throw Exception(e.message);
  }
}

Future<void>signOut()async{
  await _auth.signOut();
}

User? get currentUser => _auth.currentUser;


Future<void> resetPassword(String email) async{
  try{
    await _auth.sendPasswordResetEmail(email: email.trim());
  }on FirebaseAuthException catch(e){
    throw Exception(e.message);
  }
}

}