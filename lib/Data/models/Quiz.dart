class Quizz {
  /// Quizz Model
  Quizz({
    required this.head,
    required this.answer,
    required this.options,
  });

  String head;
  String answer;
  List<String> options;

  factory Quizz.fromJson(Map<String, dynamic> json) =>
      Quizz(
        head: json["head"],
        answer: json["answer"],
        options: List<String>.from(json["options"].map((x) => x)),
      );

  Map<String, dynamic> toJson() =>
      {
        "head": head,
        "answer": answer,
        "options": List<dynamic>.from(options.map((x) => x)),
      };
}