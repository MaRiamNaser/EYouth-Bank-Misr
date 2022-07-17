// To parse this JSON data, do
//
//     final lesson = lessonFromJson(jsonString);

import 'dart:convert';

Lesson lessonFromJson(String str) => Lesson.fromJson(json.decode(str));

String lessonToJson(Lesson data) => json.encode(data.toJson());

class Lesson {
  Lesson({
    this.quiz,
    this.id,
    this.title="",
    this.description="",
    this.lessonNumber,
    this.lessonType="",
    this.image="",
    this.video="",
    this.game,
    this.lessonLink="",
    this.courseId,
    this.levels,
    this.gameimages,
    this.audios,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.checked,
  });

  Quiz? quiz;
  String? id;
  String title;
  String description;
  int? lessonNumber;
  String lessonType;
  String image;
  String video;
  List<Game>? game;
  String lessonLink;
  String? courseId;
  List<Level>? levels;
  List<dynamic>? gameimages;
  List<dynamic>? audios;
  DateTime ?createdAt;
  DateTime? updatedAt;
  int? v;
  bool? checked;


  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
    quiz: Quiz.fromJson(json["quiz"]),
    id: json["_id"]??"",
    title: json["title"]??"",
    description: json["description"]??"",
    lessonNumber: json["lessonNumber"],
    lessonType: json["lessonType"]??"",
    image: json["image"]??"",
    video: json["video"]??"",
    game: List<Game>.from(json["game"].map((x) => Game.fromJson(x))),
    lessonLink: json["lessonLink"]??"",
    courseId: json["courseId"],
    levels: List<Level>.from(json["levels"].map((x) => Level.fromJson(x))),
    gameimages: List<dynamic>.from(json["gameimages"].map((x) => x)),
    audios: List<dynamic>.from(json["audios"].map((x) => x)),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    checked: json["checked"],
  );

  Map<String, dynamic> toJson() => {
    "quiz": quiz!.toJson(),
    "_id": id,
    "title": title,
    "description": description,
    "lessonNumber": lessonNumber,
    "image": image,
    "video": video,
    "game": List<dynamic>.from(game!.map((x) => x.toJson())),
    "lessonLink": lessonLink,
    "courseId": courseId,
    "levels": List<dynamic>.from(levels!.map((x) => x)),
    "gameimages": List<dynamic>.from(gameimages!.map((x) => x)),
    "audios": List<dynamic>.from(audios!.map((x) => x)),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "checked": checked,
    "lessonType": lessonType,

  };
}

class Game {
  Game({
    this.title="",
    this.des="",
    this.id="",
    this.img=""
  });

  String title;
  String des;
  String id;
  String img;

  factory Game.fromJson(Map<String, dynamic> json) => Game(
    title: json["title"]??"",
    des: json["des"]??"",
    id: json["_id"]??"",
    img: json["img"]??"",
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "des": des,
    "_id": id,
    "image": img ,
  };
}

class Quiz {
  Quiz({
    this.head,
    this.answers,
    this.options,
  });

  String? head;
  List<Answer>? answers;
  List<Option> ?options;

  factory Quiz.fromJson(Map<String, dynamic> json) => Quiz(
    head: json["head"],
    answers: List<Answer>.from(json["answers"].map((x) => Answer.fromJson(x))),
    options: List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "head": head,
    "answers": List<dynamic>.from(answers!.map((x) => x.toJson())),
    "options": List<Option>.from(options!.map((x) => x.toJson())),
  };
}

class Answer {
  Answer({
    this.answer,
    this.id,
  });

  String? answer;
  String? id;

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
    answer: json["answer"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "answer": answer,
    "_id": id,
  };
}

// To parse this JSON data, do
//
//     final level = levelFromJson(jsonString);

Level levelFromJson(String str) => Level.fromJson(json.decode(str));

String levelToJson(Level data) => json.encode(data.toJson());

class Level {
  Level({
    this.levelNumber=0,
    this.checked=false,
    this.content,
  });

  int levelNumber;
  bool checked;
  List<Content>? content;

  factory Level.fromJson(Map<String, dynamic> json) => Level(
    levelNumber: json["levelNumber"]??0,
    checked: json["checked"]??false,
    content: List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "levelNumber": levelNumber,
    "checked": checked,
    "content": List<dynamic>.from(content!.map((x) => x.toJson())),
  };
}
class Option {
  Option({
    this.option="",
    this.id="",
  });

  String option;
  String id;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
    option: json["option"]??"",
    id: json["_id"]??"",
  );

  Map<String, dynamic> toJson() => {
    "option": option,
    "_id": id,
  };
}
class Content {
  Content({
    this.title,
    this.des,
    this.checked,
    this.id,
  });

  String ?title;
  String ?des;
  bool ?checked;
  String? id;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    title: json["title"],
    des: json["des"],
    checked: json["checked"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "des": des,
    "checked": checked,
    "_id": id,
  };
}
