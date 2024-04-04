


import 'package:firebase_auth/firebase_auth.dart';


class AuthenticionServico
{
  //ciclo de cadastro dos user no Firebase
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

   Future<String?> cadastrarUsuario
   (
          {
            required String nome,
            required String senha,
            required String email ,
          }
   )
  async
  {
            try 
      {
          UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword
          (
            email: email,
            password: senha,
          );
          
            await userCredential.user!.updateDisplayName(nome);

            return null;

      }

       on FirebaseAuthException catch (e) 
      {
          if (e.code == "email-already-in-use")
          {
            return"O usuario ja está cadastrado";
          }

          return"Erro desconhecido";
      }
  }

 //ciclo de login dos user no Firebase
 Future<String?> logarUsuarios
 (
  {
  required String email,
  required String senha,
  }
 )
 
 async
 {
    try 
    {
      await _firebaseAuth.signInWithEmailAndPassword
        (
        email: email,
        password: senha
        );
        return null;
    }
     on FirebaseAuthException catch (e) 
      {
        return e.message;
      }
 }
  

  Future<void>deslogar()
  async
  {
    return _firebaseAuth.signOut();
  }
}