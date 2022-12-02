import 'package:firebase_auth/firebase_auth.dart' as Firebase;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mastermind_ui/auth/user.dart';

class AuthRepository {
  final _googleSignIn = GoogleSignIn();

  Future<void> login() async {
    final user = await _signInWithGoogle();
    if (user == null) throw Exception("failed to log in to Google");
  }

  Future<User?> _signInWithGoogle() async {
    try {
      var account = await _googleSignIn.signInSilently();
      account ??= await _googleSignIn.signIn();
      if (account != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await account.authentication;
        final Firebase.AuthCredential credential =
            Firebase.GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        final Firebase.UserCredential userCredential = await Firebase
            .FirebaseAuth.instance
            .signInWithCredential(credential);
        final user = userCredential.user;
        return User(
            id: user?.uid ?? '',
            imageUrl: account.photoUrl ?? '',
            name: account.displayName ?? 'No name');
      } else {
        throw Exception('account not found');
      }
    } catch (error) {
      return null;
    }
  }
}
