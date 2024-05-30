// ignore_for_file: must_be_immutable

// ignore: unused_import, avoid_web_libraries_in_flutter
import 'dart:js';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:piloto_yangue1/componentes/decoration.dart';
import 'package:piloto_yangue1/telas/auth_piloto.dart';
import 'package:piloto_yangue1/telas/contas.dart';
import 'package:piloto_yangue1/telas/registro.dart';
import 'package:piloto_yangue1/telas/servi%C3%A7o_carga.dart';
import 'package:piloto_yangue1/telas/sobre.dart';

class HomePiloto extends StatelessWidget {
  Future<Position> getLocation() async {
    var position = await Geolocator.getCurrentPosition();
    return position;
  }

  //tem de chamar uma função para pegar a  posição do dispotivo
  //~
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
                "Piloto Yangue",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          )),
      body: FutureBuilder<Position>(
        builder: (context, snapshot) {
          return FlutterMap(
              options: MapOptions(
                initialCenter:
                    LatLng(snapshot.data!.latitude, snapshot.data!.longitude),
                initialZoom: 15,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                ),
                MarkerLayer(markers: [
                  Marker(
                      point: LatLng(
                          snapshot.data!.latitude, snapshot.data!.longitude),
                      child: const Icon(
                        Icons.circle,
                        color: Colors.yellow,
                      )),
                  const Marker(
                      point: LatLng(-8.8567788, 13.3434885),
                      child: Icon(
                        Icons.location_on,
                        color: Color.fromARGB(255, 216, 0, 0),
                      ))
                ]),
                PolylineLayer(
                  polylines: [
                    Polyline(
                      points: [
                        LatLng(
                            snapshot.data!.latitude, snapshot.data!.longitude),
                        LatLng(-8.8567788, 13.3434885),
                      ],
                      color: Colors.blue,
                    ),
                  ],
                ),
              ]);
        },
        future: getLocation(),
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  children: [
                                    Container(
                                      width: 300,
                                      height: 400,
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Center(
                                              child: Image.asset(
                                            "assets/Group161.png",
                                            height: 100,
                                          )),
                                          const Center(
                                              child: SizedBox(
                                            height: 8,
                                          )),
                                          const Center(
                                              child: Text("Piloto Yangue")),
                                          const Center(child: Text("Vêm cá")),
                                        ],
                                      ),
                                    ),
                                  ]);
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
        backgroundColor: Colors.white,
        shape: const CircleBorder(),
        child: const Icon(Icons.search, color: Colors.yellowAccent,),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.yellowAccent,
        child: IconTheme(
          data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    icon: const Icon(Icons.home),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePiloto(),
                          ));
                    }),
                     IconButton(
                    icon: const Icon(Icons.local_shipping),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ServicosCargas()));
                    }),
                     const SizedBox(
                  width: 24,
                ),
                IconButton(
                    icon: const Icon(Icons.edit_document),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Registros()));
                    }),
                 const SizedBox(
                  width: 24,
                ),
                IconButton(
                    icon: const Icon(Icons.person),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Contas()));
                    }),
                IconButton(
                    icon: const Icon(Icons.info),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Sobre()));
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
