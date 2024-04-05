import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:piloto_yangue1/servicos/auth_servico.dart';

class HomePiloto extends StatelessWidget {
  const HomePiloto({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(  
        backgroundColor:const Color.fromARGB(255, 228, 231, 6),
        title: Row(
          children: [
            Image.asset( 'assets/logotipo8.png',height: 60,),
           const SizedBox(width: 8,),
            const Text("Piloto Yangue",style: TextStyle(fontWeight: FontWeight.bold ),),
          ],
        )
       
        
        
      ),
      drawer: Drawer(backgroundColor: const Color.fromARGB(255, 228, 231, 6),
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
              onTap: () {

              },
            ),

            ListTile(
              leading: const Icon(Icons.account_circle_outlined),
              title: const Text("Conta"),
              onTap: (){},
            ),
            ListTile(
              leading: const Icon(Icons.info_outlined),
              title: const Text("Sobre"),
              onTap: (){},
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
    );
  }
}
