// To parse this JSON data, do
//
//     final matchingItem = matchingItemFromJson(jsonString);

import 'dart:convert';

import 'package:bank_misr/Data/web_services/task_services/taskConfirmChecked_services.dart';

MatchingItem matchingItemFromJson(String str) => MatchingItem.fromJson(json.decode(str));

String matchingItemToJson(MatchingItem data) => json.encode(data.toJson());

class MatchingItem {
  MatchingItem({
   required this.name,
   required this.img,
   required this.value,
  });

  String name;
  String img;
  String value;
  bool chossing=false;
  bool accepting=false;

  factory MatchingItem.fromJson(Map<String, dynamic> json) => MatchingItem(
    name: json["name"],
    img: json["img"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "img": img,
    "value": value,
  };
}
List<MatchingItem> matching1=[
  MatchingItem(name: "Mexico", img: "assets/images/pngwing.com.png", value: ""),
  MatchingItem(name: "Egypt", img: "assets/images/pngwing.com1.png", value: ""),
  MatchingItem(name: "England", img: "assets/images/pngwing.com2.png", value: ""),
  MatchingItem(name: "Russia", img: "assets/images/pngwing.com3.png", value: ""),
  MatchingItem(name: "Japan", img: "assets/images/pngwing.com4.png", value: ""),
  MatchingItem(name: "United State", img: "assets/images/pngwing.com5.png", value: ""),
];

List<MatchingItem> matching3=[
  MatchingItem(name: "Making Change", img: "", value: "The word change refers to the loose coins you have in your pocket. It also means the difference between what something costs and the money that's been tendered to pay for it"),
  MatchingItem(name: "Inflation ", img: "", value: "it means that we’re paying more for the sum total of all the goods and services we buy.  Typically, there’s some inflation when the economy is growing. However, the rate can increase when demand for certain goods and services grows faster than production can keep up"),
  MatchingItem(name: "the Law of Supply and Demand", img: "", value: "It describes how the price of a good tends to increase when the supply of that good decreases (making it rarer) or when the demand for that good increases (making the good more sought after). It also describes how goods will decline in price when they become more widely available (less rare) or less popular among consumers. "),
  MatchingItem(name: "ATM", img: "", value: "Stands for automated teller machine, a machine that lets bank customers perform basic transactions, such as deposits and withdrawals."),
  MatchingItem(name: "Bank", img: "", value: "A financial institution and business that accepts deposits, makes loans, and handles other financial transactions."),
  MatchingItem(name: "Budget", img: "", value: "A plan that outlines what money you expect to earn or receive (your income) and how you will save it or spend it (your expenses) for a given period of time; also called a spending plan."),
];

List<MatchingItem>matching2=matching1.toList();
List<MatchingItem>matching4=matching3.toList();

