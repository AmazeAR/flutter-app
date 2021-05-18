import 'package:json_annotation/json_annotation.dart';

part 'CategoriesModel.g.dart';

@JsonSerializable()
class CategoriesModel {
  final int id;
  final String categoryName;
  final String categoryImage;

  CategoriesModel(
      {required this.categoryName,
      required this.categoryImage,
      required this.id});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoriesModelToJson(this);
}
