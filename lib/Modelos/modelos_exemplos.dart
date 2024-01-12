class ExerciciosModelos {
  String id;
  String nome;
  String treino;
  String comoFazer;
  String? urlImagem;

  ExerciciosModelos({
    required this.id,
    required this.nome,
    required this.treino,
    required this.comoFazer,
  });

  ExerciciosModelos.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        nome = map["nome"],
        treino = map["treino"], // Corrigir aqui
        comoFazer = map["comoFazer"],
        urlImagem = map["urlImagem"];
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "nome": nome,
      "treino": treino,
      "comoFazer": comoFazer,
      "urlImagem": urlImagem,
    };
  }
}
