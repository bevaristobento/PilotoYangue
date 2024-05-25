// ignore_for_file: must_be_immutable

// ignore: unused_import, avoid_web_libraries_in_flutter
import 'dart:js';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:piloto_yangue1/componentes/decoration.dart';
// ignore: unused_import
import 'package:piloto_yangue1/servicos/auth_servico.dart';
import 'package:piloto_yangue1/telas/auth_piloto.dart';
import 'package:piloto_yangue1/telas/contas.dart';
import 'package:piloto_yangue1/telas/registro.dart';
import 'package:piloto_yangue1/telas/servi%C3%A7o_carga.dart';
import 'package:piloto_yangue1/telas/sobre.dart';
// ignore: unused_import
import 'package:provider/provider.dart';
// ignore: unused_import, depend_on_referenced_packages

class HomePiloto extends StatelessWidget {
  //tem de chamar uma função para pegar a  posição do dispotivo
  //~
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 228, 231, 6),
          title: Row(
            children: [
              Image.asset(
                "assets/Group161.png",
                height: 40,
              ),
              const SizedBox(
                width: 8,
              ),
              const Text(
                "Piloto Yangue",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          )),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 239, 243, 6),
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.local_shipping_outlined),
              title: const Text("Serviços de cargas"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ServicosCargas()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.app_registration_outlined),
              title: const Text("Registros"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Registros()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_circle_outlined),
              title: const Text("Conta"),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Contas()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outlined),
              title: const Text("Sobre"),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Sobre()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Deslogar"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AuthenticionPiloto()));
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text(""),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showModalBottomSheet(
            context: context,
            builder: (ctx) {
              return SizedBox(
                height: 300,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: getAuthenticationInputDecoration("Origem"),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: getAuthenticationInputDecoration("Destino"),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 255, 187, 0),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 50,
                              vertical: 15,
                            ),
                            ),
                        onPressed: () async {
                          await showDialog(
                            context: context,
                            builder: (ctx) {
                              return SimpleDialog(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                                children:[
                                  Container(
                                    width: 300,
                                    height: 400,
                                    padding: const EdgeInsets.all(16),
                                    child: Column(mainAxisSize: MainAxisSize.min,
                                     children: [
                                    Center(child: Image.asset("assets/Group161.png",height: 100,)),
                                   const Center(child:  SizedBox(height: 8,)),
                                                                 const  Center(child: Text("Piloto Yangue")),
                                                                const    Center(child: Text("Vêm cá")),
                                  ],),
                                   
                                  ),
                                ]
                                
                              );
                            },
                          );
                        },
                        child: const Text(
                          "piloto",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 255, 187, 0),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 15,
                            )),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePiloto()));
                        },
                        child: const Text(
                          "Cancelar",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.travel_explore),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
