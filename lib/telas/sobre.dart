import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:piloto_yangue1/componentes/decoration.dart';

class Sobre extends StatelessWidget {
  const Sobre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedTextKit(repeatForever:true,
                animatedTexts: [
                  FadeAnimatedText(
                    'Piloto Yangue  ',
                    textStyle: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center
                  ),
                  TyperAnimatedText(
                    'é uma aplicação de serviços de transportes ou seja moto-táxi cujo o objetivo é suprir as necessidades  da população no que toca a sua deslocação nas zonas sub-urbanas e urbanas',
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center
                  ),
                  TypewriterAnimatedText(
                    'E apenas com seu telefone  dinamizas e agendas a sua viajem no  ponto em q se encontra sem mas  demora Sem se deslocar as paragens e evitando assim as demanda nas paragens',
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center
                  ),
                  ScaleAnimatedText(
                    'A escoha perfeita para as Suas viagens!\n A Sua Segurança está nas mãos dos nossos Pilotos.',
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    duration: Duration(milliseconds:2000),
                    scalingFactor: 2,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
