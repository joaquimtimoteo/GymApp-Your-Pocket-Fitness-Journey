class SentimentosModelos {
  String sentimento;
  String id;
  String data;
  SentimentosModelos(
      {required this.sentimento, required this.id, required this.data});
  SentimentosModelos.fromMap(Map<String, dynamic> map)
      : sentimento = map["sentimento"],
        id = map["id"],
        data = map["data"];
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "data": data,
      "sentimento": sentimento,
    };
  }
}
