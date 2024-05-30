import 'package:flutter/material.dart';
import 'package:liquid_pull_refresh/liquid_pull_refresh.dart';
// ignore: unused_import
import 'package:piloto_yangue1/componentes/decoration.dart';
class Sobre extends StatelessWidget {
  const Sobre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Colors.yellowAccent,
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
                  "Sobre",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            )),
       body:LiquidPullRefresh(
          heightLoader: 200,
          showChildOpacityTransition: false,
          color: const Color.fromARGB(255, 0, 0, 0),
            //Cor da parte traseira do efeito de refresh
            backgroundColor: Colors.yellowAccent,
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 2));
          },
          child: ListView(
            children: [
              for (int i = 0; i < 10; i++)
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    color:Color.fromARGB(255, 255, 187, 1), 
                    child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 200,
                    ),
                  )),
                )
            ],
          ),
        ),
    );
  }
}