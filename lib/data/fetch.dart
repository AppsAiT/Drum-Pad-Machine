import 'dart:convert';

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  String id;
  String title;
  String subtitle;
  String image;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        title: json["name"],
        subtitle: json["actualPrice"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subtitle": subtitle,
        "image": image,
      };
}
