import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:piloto_yangue1/componentes/decoration.dart';
import 'package:piloto_yangue1/comun/cores_piloto.dart';
import 'package:piloto_yangue1/comun/my_snackbar.dart';
import 'package:piloto_yangue1/servicos/auth_servico.dart';
import 'package:piloto_yangue1/telas/home_piloto.dart';
import 'package:uuid/uuid.dart';

class AuthenticionPiloto extends StatefulWidget {
  const AuthenticionPiloto({super.key});

  @override
  State<AuthenticionPiloto> createState() => _AuthenticionPilotoState();
}

FirebaseFirestore db = FirebaseFirestore.instance;
bool querorEntrar = true;

final _formkey = GlobalKey<FormState>();

final TextEditingController _emailController = TextEditingController();
final TextEditingController _senhaController = TextEditingController();
final TextEditingController _nomeController = TextEditingController();

AuthenticionServico _authServico = AuthenticionServico();

class _AuthenticionPilotoState extends State<AuthenticionPiloto> {
  
  bool _senhaVisivel = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 244, 235),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomLeft,
                  colors: [
                    CoresPiloto.amarelosuperior,
                    CoresPiloto.amareloinferior,
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Form(
              key: _formkey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset(
                        'assets/Group161.png',
                        height: 170,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: getAuthenticationInputDecoration("email"),
                        validator: (String? value) {
                          if (value == null) {
                            return " este campo não pode estar vazio";
                          }

                          if (value.length < 5) {
                            return "O e-mail é muito curto, preencha esse campo ";
                          }

                          if (!value.contains("@")) {
                            return "O e-mail não é válido ";
                          }

                          if(!value.contains("gmail.com")){
                             return "o e-mail não está completo "; 
                          }
                          if(value != value.toLowerCase()){
                             return "o e-mail deve conter apenas letras Minúsculas "; 
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: _senhaController,
                        decoration:
                            getAuthenticationInputDecoration('senha').copyWith(
                          suffixIcon: IconButton(
                            icon: Icon(
                              _senhaVisivel
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _senhaVisivel = !_senhaVisivel;
                              });
                            },
                          ),
                        ),
                        obscureText: !_senhaVisivel,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return " este campo não pode estar vazio";
                          }

                          if (value.length < 5) {
                            return "A senha é muito curta ";
                          }

                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Visibility(
                        visible: !querorEntrar,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _nomeController,
                              decoration:
                                  getAuthenticationInputDecoration("nome"),
                              validator: (String? value) {
                                if (value == null) {
                                  return "este campo não pode estar vazio";
                                }

                                if (value.length <10) {
                                  return "O nome é muito curto ";
                                }

                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            var resposta = await botaoPrincipalClicado(context);
                            if (resposta != null) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePiloto(),
                                  ));
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 255, 187, 0)),
                            overlayColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return const Color.fromARGB(
                                      255, 221, 252, 252);
                                }
                                return const Color.fromARGB(255, 253, 250, 46);
                              },
                            ),
                          ),
                          child: Text(
                            (querorEntrar) ? "Entrar" : "Cadastrar",
                            style: const TextStyle(
                                color: Color.fromARGB(255, 3, 3, 3),
                                fontWeight: FontWeight.bold),
                          )),
                      const Divider(),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            querorEntrar = !querorEntrar;
                          });
                        },
                        child: Text(
                          (querorEntrar)
                              ? "Ainda não tens conta ? cadastra-se"
                              : "Já tens uma conta? Entrar",
                          style: const TextStyle(
                              color: Color.fromARGB(255, 3, 3, 3),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Divider(),
                      ElevatedButton.icon(
                        icon: Image.asset(
                          'assets/logo1.png',
                          height: 24,
                          width: 24,
                        ),
                        label: Text(
                          (querorEntrar)
                              ? "Entrar com a google"
                              : "Cadastra-se com a google",
                          style: const TextStyle(
                              color: Color.fromARGB(255, 3, 3, 3),
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () async {
                          var User = await _signInWithGoogle();
                          if (User != null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePiloto(),
                                ));
                          }
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 248, 248, 248),
                        )),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // criando a colecçao
  void sendData() {
    String id = Uuid().v1();
    db.collection("cadastro passageiro").doc(id).set({
      "email": _emailController.text,
      "senha": _senhaController.text,
      "nome": _nomeController.text,
    });
  }

// metodo pra entrar com a google cadastro e login
  Future<User?> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return null;
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      print("Existe um erro");
      return null;
    }
  }

  Future<UserCredential?> botaoPrincipalClicado(BuildContext context) async {
    String nome = _nomeController.text;
    String email = _emailController.text;
    String senha = _senhaController.text;

    if (_formkey.currentState!.validate()) {
      if (querorEntrar) {
        // processos & Chamado da função e  de login
        print("Entrada Validada");

        var resultado = await _authServico
            .logarUsuarios(email: email, senha: senha)
            .onError((FirebaseAuthException error, stackTrace) {
          var msg = "";
          if (error.code == "email-already-in-use") {
            msg = "Email Já em Uso";
          }
          if (error.code == "weak-password") {
            msg = "Senha Fraca demais,use pelo menos 6 caracteres  ";
          }
          if (error.code == "wrong-password") {
            msg = "Palavra passe errada";
          }

          // ignore: use_build_context_synchronously
          mostrarSnackBar(context: context, texto: msg);
          return null;
        });

        return resultado;
        // processos & Chamado da função e  de login
      } else {
        // processos & Chamado da função de Cadastro

        print("Cadastro Validado");

        print(
            "${_emailController.text},${_senhaController.text},${_nomeController.text},");

        var resposta = _authServico
            .cadastrarUsuario(nome: nome, senha: senha, email: email.trim())
            .onError((FirebaseAuthException error, stackTrace)
                // ignore: body_might_complete_normally_nullable
                {
          var msg = "";
          if (error.code == "email-already-in-use") {
            msg = "Email Já em Uso";
          }
          if (error.code == "weak-password") {
            msg = "Senha Fraca demais,use pelo menos 6 caracteres  ";
          }
          if (error.code == "wrong-password") {
            msg = "Palavra passe errada";
          }

          mostrarSnackBar(context: context, texto: msg);
        });
        // ignore: unnecessary_null_comparison
        if (resposta != null) {// a função senddata receberá enviará os  dados caso cadastro for feito com exito
          sendData();
        } 

        return resposta;

        // processos & Chamado da função de Cadastro
      }
    } else {
      print("Form Inválido");
      return null;
    }
  }
}
