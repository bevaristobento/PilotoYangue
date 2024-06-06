import 'package:flutter/material.dart';
import 'package:piloto_yangue1/componentes/decoration.dart';
class Registros extends StatelessWidget {
  const Registros({super.key});

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
                  "Registro",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            )),
       
        body: const Center (
          child:  Text(""),
        ),
        floatingActionButton:FloatingActionButton(
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
                                decoration:
                                    getAuthenticationInputDecoration("Origem"),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                decoration:
                                   getAuthenticationInputDecoration("Destino"),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(255, 255, 187, 0),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 50,
                                      vertical: 15,
                                    )),
                                onPressed: () {},
                                child: const Text(
                                  "piloto",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
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
                                //  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePiloto() ));
                                },
                                child: const Text(
                                  "Cancelar",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: const Icon(Icons.travel_explore),
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}