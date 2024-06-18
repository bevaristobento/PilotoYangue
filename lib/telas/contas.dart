// ignore: unused_import
import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:liquid_pull_refresh/liquid_pull_refresh.dart';
// ignore: unused_import
import 'package:piloto_yangue1/componentes/decoration.dart';

class Contas extends StatefulWidget {
  const Contas({super.key});

  @override
  State<Contas> createState() => _ContasState();
}

class _ContasState extends State<Contas> {
  String? userName;
  File? _imagem;
  

  @override
  void initState(){
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {//Obtém o usuário autenticado.
//Busca o documento do usuário na coleção "cadastro passageiro" usando o uid do usuário.
    
    User? currentUser= FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      DocumentSnapshot userData= await FirebaseFirestore.instance.collection('cadastro passageiro').doc(currentUser.uid)
.get(); 
if (userData.exists) {
  setState(() {
  userName=userData['nome'];
}); 
  
}  }
  }

  Future<void>_pickImage() async{////Permite que o usuário selecione uma imagem da galeria.Atualiza o estado com o arquivo de imagem selecionado.
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imagem = File(pickedFile.path);
      });
      
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: LiquidPullRefresh(
          heightLoader: 200,
          showChildOpacityTransition: false,
          color: const Color.fromARGB(255, 0, 0, 0),  // Cor da parte traseira do efeito de refresh
          backgroundColor:  const Color.fromARGB(255, 255, 187, 0),
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 2));
          },
          child: ListView(
            children: [
              for (int i = 0; i < 1; i++)
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    color: const Color.fromARGB(255, 255, 187, 0),
                      child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 250,
                      padding: EdgeInsets.all(16.6),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: _pickImage,

                            child: CircleAvatar(radius:50,backgroundImage:  _imagem != null ? FileImage(_imagem!):AssetImage('assets/profiles_placeholder.png') as ImageProvider,
                            child: _imagem == null ? Icon(Icons.add_a_photo,size: 50,color: Colors.white,) : null,),//CircleAvatar: Exibe a imagem selecionada ou um ícone de adicionar foto se nenhuma imagem for selecionada.
                          ),
                          const SizedBox(height: 16,),
                          Text(userName ?? 'Carregando...',style: TextStyle(fontWeight: FontWeight.bold),)//Text: Exibe o nome do usuário carregado do Firestore.
                        ],
                      ),
                    ),
                  )),
                )
            ],
          ),
        ));
  }
}
