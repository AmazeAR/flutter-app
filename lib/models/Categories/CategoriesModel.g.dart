// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CategoriesModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesModel _$CategoriesModelFromJson(Map<String, dynamic> json) {
  return CategoriesModel(
    categoryName: json['categoryName'] as String,
    categoryImage: json['categoryImage'] as String,
    id: json['id'] as int,
  );
}

Map<String, dynamic> _$CategoriesModelToJson(CategoriesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryName': instance.categoryName,
      'categoryImage': instance.categoryImage,
    };
