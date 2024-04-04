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
        title: const Text("tela inicial"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
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
