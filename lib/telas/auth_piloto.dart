
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:piloto_yangue1/componentes/decoration.dart';
import 'package:piloto_yangue1/comun/cores_piloto.dart';
import 'package:piloto_yangue1/comun/my_snackbar.dart';
import 'package:piloto_yangue1/servicos/auth_servico.dart';
import 'package:piloto_yangue1/telas/home_piloto.dart';

class AuthenticionPiloto extends StatefulWidget {
  const AuthenticionPiloto({super.key});

  @override
  State<AuthenticionPiloto> createState() => _AuthenticionPilotoState();
}

 bool querorEntrar =true;

 final _formkey =GlobalKey<FormState>();

 final TextEditingController   _emailController = TextEditingController();
 final TextEditingController  _senhaController = TextEditingController();
 final TextEditingController  _nomeController = TextEditingController();

 AuthenticionServico _authServico = AuthenticionServico();

class _AuthenticionPilotoState extends State<AuthenticionPiloto> {
  @override
  Widget build(BuildContext context)
  {
    return  Scaffold
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

          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Form(
              key:_formkey ,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: 
                    [
                      Image.asset('assets/3DD.png',height: 280,),
                  
                     const SizedBox(height: 0,),
                      
                     
                    TextFormField
                    (
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: 
                      getAuthenticationInputDecoration("email"),
                      validator: (String? value) 
                      {
                        if (value == null) 
                        {
                         return "O este não pode estar vazio" ;
                        }

                        if (value.length<5) 
                        {
                          return "O e-mail é muito curto ";
          
                        }

                          if (!value.contains("@")) 
                        {
                          return "O e-mail não é válido ";
          
                        }
                        return  null;
                      },
                      ),
                    
            
                   const SizedBox(height: 8,),
                  
                     TextFormField
                     (
                      controller: _senhaController,
                          decoration: getAuthenticationInputDecoration("senha"),
                          obscureText: true,

                               validator: (String? value) 
                      {
                        if (value == null) 
                        {
                         return "O este não pode estar vazio" ;
                        }

                        if (value.length<5) 
                        {
                          return "A senha é muito curta ";
          
                        }

                        return  null;
                      },
                     ),
            
                      const SizedBox(height: 8,),
                  
                      Visibility(visible: !querorEntrar,child: Column 
                      (
                        children: 
                         [
                          
                       
                          TextFormField
                          (
                            controller: _nomeController,
                            decoration:
                            getAuthenticationInputDecoration("nome"),

                            validator: (String? value) 
                      {
                        if (value == null) 
                        {
                         return "O este não pode estar vazio" ;
                        }

                        if (value.length<5) 
                        {
                          return "O nome é muito curto ";
          
                        }

                        return  null;
                      },
                            
                          ),
                  
                  
                         ],
                      ),
                      ),
                  
                       const SizedBox(height: 12,),
                  
                      ElevatedButton
                        (
                            onPressed: ()
                            {
                              botaoPrincipalClicado();
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePiloto(),)
                             );
                            },
                             style: ButtonStyle
                             (
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),

                              overlayColor: MaterialStateProperty.resolveWith<Color>
                              (
                                  
                                  (Set<MaterialState>states)
                                {
                                      if (states.contains(MaterialState.pressed)
                                      ) 
                                          {
                                            return const Color.fromARGB(179, 82, 55, 236);
                                          }
                                            return Colors.black;
                                },
                              ), 
                                   ),
                            child:
                  
                            Text
                            (
                              (querorEntrar)?"Entrar" : "Cadastrar",style: const TextStyle(color: Color.fromARGB(255, 255, 251, 251)),
                            )
                        ),
                  
                        const Divider(),
                  
                        TextButton(onPressed: ()
                        {
                          setState(() 
                            {
                             querorEntrar = !querorEntrar; 
                            }
                            );
                        },
                  
                        child: 
                  
                         Text
                        (
                          (querorEntrar)?"Ainda não tens conta ? cadastra-se": "Já tens uma conta? Entrar", style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),),
                        ),
                  
                    
                  
                    ],
                  
                  ),
                ),
              ),
            
            ),
          ),
        ],

      ),

    );
    
  }

  botaoPrincipalClicado()
    {
      String nome = _nomeController.text;
      String email = _emailController.text;
      String senha = _senhaController.text;
      
      if (_formkey.currentState!.validate()) 
      {
        if (querorEntrar) 

        { // processos & Chamado da função e  de login
         print("Entrada Validada");

          _authServico.logarUsuarios(email: email, senha: senha).then
          (
              (String? erro)
            {
              if (erro != null) 
              {
                // voltou com erro 
                mostrarSnackBar(context: context, texto: erro);
              }
              
            } 
          );
          // processos & Chamado da função e  de login
        }




        
         else 
        {// processos & Chamado da função de Cadastro

          print("Cadastro Validado");
          
          print("${_emailController.text},${_senhaController.text},${_nomeController.text},");

         _authServico.cadastrarUsuario(nome: nome, senha: senha, email: email.trim()).then
         (
              (String? erro)
            {
              if (erro != null) 
              {
              // voltou com erro  
              mostrarSnackBar(context: context, texto: erro);
              }
            },
         );
         // processos & Chamado da função de Cadastro
        }
      }

      else
      
      {
        print("Form Inválido");
      }
    }

}