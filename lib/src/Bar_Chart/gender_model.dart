import 'dart:convert';

List<GenderModel> genderModelFromJson(String str) => List<GenderModel>.from(
    json.decode(str).map((x) => GenderModel.fromJson(x)));

String genderModelToJson(List<GenderModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GenderModel {
  GenderModel({
    required this.name,
    required this.gender,
    required this.probability,
    required this.count,
  });

  String name;
  String gender;
  double probability;
  int count;

  factory GenderModel.fromJson(Map<String, dynamic> json) => GenderModel(
        name: json["name"],
        gender: json["gender"],
        probability: json["probability"].toDouble(),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "gender": gender,
        "probability": probability,
        "count": count,
      };
}
