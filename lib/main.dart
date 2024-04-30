// ignore: unused_import
import 'package:piloto_yangue1/telas/escolha.dart';
import 'package:provider/provider.dart';
// ignore: unused_import
import 'package:flutter_map/flutter_map.dart';
// ignore: unused_import
import 'package:geolocator/geolocator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:piloto_yangue1/telas/auth_piloto.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:piloto_yangue1/telas/home_piloto.dart';
import 'firebase_options.dart';
// ignore: unused_import
import 'package:latlong2/latlong.dart';
// ignore: unused_import
import 'package:latlong2/spline.dart';
// ignore: unused_import


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      
     
      home:EscolhaOpcao()
    );
  }
}

class RoteadotelaPiloto extends StatelessWidget {
  const RoteadotelaPiloto({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(stream: FirebaseAuth.instance.userChanges(),builder: (context, snapshot)
    {
      if (snapshot.hasData) 
      {// se o user está chegando ou logado vai pra tela homepiloto
       return  HomePiloto();
      }
      else
      {// se o user não está chegando ou logado vai pra tela AutenticionPiloto
      return const AuthenticionPiloto();
      }
    } ,);
  }
}

