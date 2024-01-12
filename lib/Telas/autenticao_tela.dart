import 'package:flutter/material.dart';
import 'package:helloworld/_commum/meu_snackbar.dart';
import 'package:helloworld/_commum/minhascores.dart';
import 'package:helloworld/componentes/decora%C3%A7%C3%A3o_campo_autentica%C3%A7%C3%A3o.dart';

class Autenticaotela extends StatefulWidget {
  const Autenticaotela({super.key});

  @override
  State<Autenticaotela> createState() => _MyWidgetState();
}

bool queroEntrar = true;
final _formkey = GlobalKey<FormState>();

TextEditingController _emailController = TextEditingController();
TextEditingController _senhaController = TextEditingController();
TextEditingController _nomeController = TextEditingController();

class _MyWidgetState extends State<Autenticaotela> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    MinhasCores.azulTopoGradiente,
                    MinhasCores.baixo_gradiente,
                  ])),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formkey,
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.asset("assets/logo.png", height: 128),
                        const Text(
                          "GymApp",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        TextFormField(
                            controller: _emailController,
                            decoration:
                                getAuthenticationInputDecoration("E-mail:"),
                            validator: (String? value) {
                              if (value == null) {
                                return "O e-mail não pode ser vazio";
                              }
                              if (value.length < 5) {
                                return "Digite um e-mail válido";
                              }
                              if (!value.contains("@")) {
                                return "Digite um e-mail válido";
                              }
                              return null;
                            }),
                        const SizedBox(height: 8),
                        TextFormField(
                            controller: _senhaController,
                            decoration:
                                getAuthenticationInputDecoration("Senha:"),
                            obscureText: true,
                            validator: (String? value) {
                              if (value == null) {
                                return "A  Senha não pode ser vazio";
                              }
                              if (value.length < 5) {
                                return "A Senha é muito curto";
                              }
                              return null;
                            }),
                        const SizedBox(height: 8),
                        Visibility(
                            visible: !queroEntrar,
                            child: Column(
                              children: [
                                TextFormField(
                                    decoration:
                                        getAuthenticationInputDecoration(
                                            "Confirme Senha:"),
                                    obscureText: true,
                                    validator: (String? value) {
                                      if (value == null) {
                                        return "A confirmação de Senha não pode ser vazio";
                                      }
                                      if (value.length < 5) {
                                        return "A confirmação de Senha é muito curto";
                                      }
                                      return null;
                                    }),
                                const SizedBox(
                                  height: 8,
                                ),
                                TextFormField(
                                    controller: _nomeController,
                                    decoration:
                                        getAuthenticationInputDecoration(
                                            "Nome:"),
                                    validator: (String? value) {
                                      if (value == null) {
                                        return "O nome não pode ser vazio";
                                      }
                                      if (value.length < 5) {
                                        return "O nome é muito curto";
                                      }
                                      return null;
                                    }),
                              ],
                            )),
                        const SizedBox(
                          height: 16,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              botaoClickado();
                            },
                            child: Text(
                              (queroEntrar) ? "Entrar" : "Cadastrar",
                            )),
                        const Divider(),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                queroEntrar = !queroEntrar;
                              });
                            },
                            child: Text((queroEntrar)
                                ? "Ainda não tem uma conta? Cadastrar-se!"
                                : "Já tem uma conta? Entre!"))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  botaoClickado() {
    if (_formkey.currentState!.validate()) {
      if (queroEntrar) {
        print("Entrada validada");
      } else {
        print("Cadastro validado");
        print(
            "${_emailController.text},${_senhaController.text}, ${_nomeController.text},");
        monstrarSnackBar(
            context: context,
            texto: "Cadastro Efeituado com Sucesso!",
            isErro: false);
      }
    } else {
      print("Erro no formulário!");
    }
  }
}
