// To parse this JSON data, do
//
//     final personalCartModel = personalCartModelFromJson(jsonString);

import 'dart:convert';

PersonalCartModel personalCartModelFromJson(String str) =>
    PersonalCartModel.fromJson(json.decode(str));

String personalCartModelToJson(PersonalCartModel data) =>
    json.encode(data.toJson());

class PersonalCartModel {
  PersonalCartModel({
    required this.status,
    required this.data,
  });

  Status status;
  List<Datum> data;

  factory PersonalCartModel.fromJson(Map<String, dynamic> json) =>
      PersonalCartModel(
        status: Status.fromJson(json["status"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.categoryId,
    required this.categoryName,
    required this.productName,
    required this.brandName,
    required this.productImage,
    required this.price,
    required this.description,
    required this.is3Dmodel,
  });

  String id;
  String categoryId;
  String categoryName;
  String productName;
  String brandName;
  String productImage;
  String price;
  Description description;
  bool is3Dmodel;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        categoryId: json["categoryId"],
        categoryName: json["categoryName"],
        productName: json["productName"],
        brandName: json["brandName"],
        productImage: json["productImage"],
        price: json["price"],
        description: Description.fromJson(json["description"]),
        is3Dmodel: json["is_3dmodel"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "categoryId": categoryId,
        "categoryName": categoryName,
        "productName": productName,
        "brandName": brandName,
        "productImage": productImage,
        "price": price,
        "description": description.toJson(),
        "is_3dmodel": is3Dmodel,
      };
}

class Description {
  Description({
    required this.color,
    required this.dimensions,
    required this.about,
  });

  String color;
  String dimensions;
  String about;

  factory Description.fromJson(Map<String, dynamic> json) => Description(
        color: json["color"] == null ? null : json["color"],
        dimensions: json["dimensions"] == null ? null : json["dimensions"],
        about: json["about"],
      );

  Map<String, dynamic> toJson() => {
        "color": color == null ? null : color,
        "dimensions": dimensions == null ? null : dimensions,
        "about": about,
      };
}

class Status {
  Status({
    required this.code,
  });

  int code;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
      };
}

// class PersonalCartModel {
//   final String id;
//   final String catId;
//   final String catName;
//   final String proName;
//   final String brandName;
//   final String proImage;
//   final String price;
//   final bool is3DModel;

//   PersonalCartModel(
//       {required this.id,
//       required this.catId,
//       required this.catName,
//       required this.proName,
//       required this.brandName,
//       required this.proImage,
//       required this.price,
//       required this.is3DModel});
// }
