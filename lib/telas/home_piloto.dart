// ignore_for_file: must_be_immutable

// ignore: unused_import
import 'dart:js';

import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:piloto_yangue1/componentes/decoration.dart';
import 'package:piloto_yangue1/comun/postos_controlos.dart';
import 'package:piloto_yangue1/servicos/auth_servico.dart';
// ignore: unused_import
import 'package:provider/provider.dart';

class HomePiloto extends StatelessWidget {
   HomePiloto({super.key});

  //tem de chamar uma função para pegar a  posição do dispotivo
  //~

  PostoController _controller=PostoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 228, 231, 6),
          title: Row(
            children: [
              Image.asset(
                'assets/logotipo8.png',
                height: 60,
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
        backgroundColor: const Color.fromARGB(255, 228, 231, 6),
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.local_shipping_outlined),
              title: const Text("Serviços de cargas"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.app_registration_outlined),
              title: const Text("Registros"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.account_circle_outlined),
              title: const Text("Conta"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.info_outlined),
              title: const Text("Sobre"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Deslogar"),
              onTap: () {
                AuthenticionServico().deslogar();
              },
            ),
          ],
        ),
      ),
      body: ListenableBuilder(
          listenable:  _controller,
          builder: (context,widget) {

            return FlutterMap(
              
              options: MapOptions(initialZoom: 10,initialCenter: LatLng(_controller.lat,_controller.long)),
              children: [
                TileLayer(
                  urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                ),
              ],
            );
          }
          ),


          floatingActionButton: FloatingActionButton(
            onPressed: () async{
              await showModalBottomSheet(
                context: context,
                 builder:(ctx){
                return  SizedBox
                (height: 300,
                width: double.infinity,

                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                   children: [
                    const SizedBox(height: 12,),

                    TextFormField(keyboardType: TextInputType.emailAddress,decoration:getAuthenticationInputDecoration("Origem"),),

                    const SizedBox(height: 8,),

                    TextFormField(keyboardType: TextInputType.emailAddress,decoration:getAuthenticationInputDecoration("Destino"),),

                   const SizedBox(height: 12,),

                    ElevatedButton(onPressed: (){}, 
                    child:const Text("piloto"),
                    )
                   ],
                  ),
                ),
                );
              }
              );
            },
            child:const Icon(Icons.travel_explore),
            ),
    );
  }
}
