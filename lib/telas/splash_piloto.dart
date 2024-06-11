import 'package:flutter/material.dart';
import 'package:piloto_yangue1/comun/cores_piloto.dart';

class SplashPiloto extends StatelessWidget {
  const SplashPiloto({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
     backgroundColor: const Color.fromARGB(255, 248, 225, 20),

      body:Stack
      (
        children: 
        [
          Container

          (
            decoration: const BoxDecoration

            (
                gradient: LinearGradient

              (begin: Alignment.topCenter,
               end: Alignment.bottomLeft,
                      colors: 

                    [
                      CoresPiloto.amarelosuperior,
                      CoresPiloto.amareloinferior,
                    ]

              ),

            ),

          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: 
            [
              Image.asset('assets/logotipo6.png',height: 300,),
              
              const Text("Piloto Yangue",textAlign: TextAlign.center,
              style: TextStyle
              (
             fontSize: 40,
             fontWeight: FontWeight.bold,
             color:Colors.white,
              )
          
              ,)
            ],
          ),
        ],
      ),
    );
  }
}