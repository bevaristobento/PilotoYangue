// ignore_for_file: must_be_immutable

// ignore: unnecessary_import
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:piloto_yangue1/componentes/decoration.dart';
// ignore: unused_import
import 'package:piloto_yangue1/telas/auth_piloto.dart';
import 'package:piloto_yangue1/telas/contas.dart';
// ignore: unused_import
import 'package:piloto_yangue1/telas/registro.dart';
import 'package:piloto_yangue1/telas/servi%C3%A7o_carga.dart';
import 'package:piloto_yangue1/telas/sobre.dart';

class HomePiloto extends StatefulWidget {
  @override
  State<HomePiloto> createState() => _HomePilotoState();
}

class _HomePilotoState extends State<HomePiloto> {
  int _pageIndex = 0;
  final List<Widget> _pages = [
    //Criei uma lista _pages que contém as diferentes telas para serem exibidas
    HomePilotoPage(),
    ServicosCargas(),
    Contas(),
    Sobre(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 255, 187, 0),
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
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: PopupMenuButton<int>(
              icon: const Icon(Icons.more_vert_rounded),
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                const PopupMenuItem<int>(
                    value: 0,
                    child: ListTile(
                      leading: Icon(
                        Icons.edit_document,
                        color: Color.fromARGB(255, 255, 187, 0),
                      ),
                      title: Text(
                        "Registros",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )),
                const PopupMenuItem<int>(
                    value: 1,
                    child: ListTile(
                      leading: Icon(
                        Icons.logout_outlined,
                        color: Color.fromARGB(255, 255, 187, 0),
                      ),
                      title: Text("Sair",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ))
              ],
            ),
          ),
        ],
      ),
      body: _pages[
          _pageIndex], //Atualizei o corpo do Scaffold para exibir a página correspondente com base no índice armazenado em _pageIndex
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showModalBottomSheet(
            context: context,
            builder: (ctx) {
              return SizedBox(
                height: 1000,
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
                        onTap: () async {
                          GeoPoint? p = await showSimplePickerLocation(
                            context: context,
                            isDismissible: true,
                            title: "Title dialog",
                            textConfirmPicker: "pick",
                            initCurrentUserPosition:
                                UserTrackingOption(enableTracking: true),
                          );
                        },
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
                          Navigator.pop(
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
        child: const Icon(
          Icons.search,
          color: const Color.fromARGB(255, 255, 187, 0),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        color: const Color.fromARGB(255, 255, 187, 0),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        items: const <Widget>[
          Icon(
            Icons.home_filled,
            size: 30,
          ),
          Icon(FontAwesomeIcons.motorcycle, size: 30),
          Icon(Icons.person_2_outlined, size: 30),
          Icon(Icons.info_outline, size: 30),
        ],
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          }); //Atualizei a função onTap do CurvedNavigationBar para alterar o índice da página quando um ícone for clicado
        },
      ),
    );
  }

  onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Registros(),
            ));
        break;
      case 1:
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AuthenticionPiloto(),
            ));
        break;
    }
  }
}

class HomePilotoPage extends StatelessWidget {
  Future<Position> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Verifica se o serviço de localização está habilitado.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Serviço de Localização está desabilitada.');
    }
 // Verifica o status da permissão de localização.
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
       if (permission == LocationPermission.denied) {
      return Future.error('permissão de localização negada.');
    }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('permissão de localização permanentemente negada.');
      
    }
    // Quando a permissão de localização é concedida, pega a localização atual.
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Position>(
      future: getLocation(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          //ConnectionState.waiting: Mostra um CircularProgressIndicator enquanto o Future está sendo resolvido.
          return const Center(
            child: Text("aguarde um pouco"),
          );
        } else if (snapshot.hasError) {
          //napshot.hasError: Mostra uma mensagem de erro se o Future falhar.
          return Center(child: Text('Erro: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data == null) {
          //!snapshot.hasData || snapshot.data == null: Mostra uma mensagem informando que não há dados disponíveis se o Future não retornar dados.
          return const Center(child: Text('Nenhum dado disponível'));
        } else {
          // ignore: unused_local_variable
          var position = snapshot.data!;
          return OSMFlutter(
            controller: MapController(
              initPosition: GeoPoint(
                  latitude: position.latitude, longitude: position.longitude),
            ),
            osmOption: OSMOption(
                userTrackingOption: const UserTrackingOption(
                    enableTracking: true, unFollowUser: false),
                zoomOption: const ZoomOption(
                  initZoom: 8,
                  minZoomLevel: 8,
                  maxZoomLevel: 19,
                ),
                userLocationMarker: UserLocationMaker(
                  personMarker: const MarkerIcon(
                    
                    icon: Icon(
                      Icons.location_history_outlined,
                      color: Colors.red,
                      size: 48,
                    ),
                  ),
                  directionArrowMarker: const MarkerIcon(
                    icon: Icon(
                      Icons.double_arrow,
                      size: 48,
                    ),
                  ),
                ),
                roadConfiguration: const RoadOption(roadColor: Colors.yellowAccent),
                markerOption: MarkerOption( 
                    defaultMarker: const MarkerIcon(
                      
                  icon: Icon(
                    Icons.person_pin_circle,
                    color: Colors.blue,
                    size: 56,
                  ),
                ),
                ),
                ),
          );
        }
      },
    );
  }
}
