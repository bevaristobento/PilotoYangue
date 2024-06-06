// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:liquid_pull_refresh/liquid_pull_refresh.dart';
// ignore: unused_import
import 'package:piloto_yangue1/componentes/decoration.dart';

class Contas extends StatelessWidget {
  const Contas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor:  const Color.fromARGB(255, 255, 187, 0),
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
                  "Contas",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            )),
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
              for (int i = 0; i < 2; i++)
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    color: const Color.fromARGB(255, 255, 187, 0),
                      child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 200,
                    ),
                  )),
                )
            ],
          ),
        ));
  }
}
