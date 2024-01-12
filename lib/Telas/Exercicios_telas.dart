import 'package:flutter/material.dart';
import 'package:helloworld/Modelos/modelos_exemplos.dart';
import 'package:helloworld/_commum/minhascores.dart';
import 'package:helloworld/sentimento/sentimentos.dart';

class Exerciciostela extends StatelessWidget {
  Exerciciostela({Key? key}) : super(key: key);

  final ExerciciosModelos exerciciosModelos = ExerciciosModelos(
      id: "00X7",
      nome: "Remada Baixa Alta",
      treino: "Treino A",
      comoFazer: "Segura e Larga.20cm");
  final List<SentimentosModelos> listaSentimentos = [
    SentimentosModelos(
      sentimento: "Sentindo Pouca ativação",
      id: "00x1",
      data: "2023-02-17",
    ),
    SentimentosModelos(
      sentimento: "Sentindo Maior ativação",
      id: "00x2",
      data: "2023-02-18",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Column(children: [
          Text(
            exerciciosModelos.nome,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          Text(
            exerciciosModelos.treino,
            style: const TextStyle(fontSize: 15),
          )
        ]),
        centerTitle: true,
        backgroundColor: MinhasCores.azul_escuro,
        elevation: 0,
        toolbarHeight: 72,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(32))),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: ListView(
          children: [
            SizedBox(
              height: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Enviar Fotografia"),
                  ),
                  ElevatedButton(
                      onPressed: () {}, child: const Text("Tirar Fotografia"))
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Como Fazer?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(exerciciosModelos.comoFazer),
            const Text("Segura com Duas mãos!"),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(color: Colors.black),
            ),
            const Text(
              "Como Estou me sentindo?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(listaSentimentos.length, (index) {
                SentimentosModelos sentimentosModelosAgora =
                    listaSentimentos[index];
                return ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: Text(sentimentosModelosAgora.sentimento),
                  subtitle: Text(sentimentosModelosAgora.data),
                  leading: const Icon(Icons.double_arrow),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      print("Deletar${sentimentosModelosAgora.sentimento}");
                    },
                  ),
                );
              }),
            )
          ],
        ),
      ),
      // Inserir aqui o bloco de construção ou o widget final necessário
    );
  }
}
