import 'package:firebase_auth/firebase_auth.dart';

class AuthenticionServico {
  //ciclo de cadastro dos user no Firebase
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential?> cadastrarUsuario({
    required String nome,
    required String senha,
    required String email,
  }) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: senha,
      );

      await userCredential.user!.updateDisplayName(nome);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        throw Exception("Email Já em Uso");
      }
      if (e.code == "weak-password") {
        throw Exception("Senha Fraca demais,use pelo menos 6 caracteres  ");
      }
      if (e.code == "wrong-password") {
        throw Exception("Palavra passe errada");
      }

      return null;
    }
  }

  //ciclo de login dos user no Firebase
  Future<UserCredential?> logarUsuarios({
    required String email,
    required String senha,
  }) async {
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: senha);
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        throw "Email Já em Uso";
      }
      if (e.code == "weak-password") {
        throw "Senha Fraca demais,use pelo menos 6 caracteres  ";
      }
      if (e.code == "wrong-password") {
        throw "Palavra passe errada";
      }
      rethrow;
    }
  }

  Future<void> deslogar() async {
    return _firebaseAuth.signOut();
  }
}
