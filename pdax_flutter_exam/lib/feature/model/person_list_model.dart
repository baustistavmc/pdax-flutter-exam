import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'person_list_model.freezed.dart';
part 'person_list_model.g.dart';

PersonListModel personListModelFromJson(String str) =>
    PersonListModel.fromJson(json.decode(str));

String personListModelToJson(PersonListModel data) =>
    json.encode(data.toJson());

@freezed
class PersonListModel with _$PersonListModel {
  const factory PersonListModel({
    String? status,
    int? code,
    int? total,
    List<Datum>? data,
  }) = _PersonListModel;

  factory PersonListModel.fromJson(Map<String, dynamic> json) =>
      _$PersonListModelFromJson(json);
}

@freezed
class Datum with _$Datum {
  const factory Datum({
    int? id,
    String? firstname,
    String? lastname,
    String? email,
    String? phone,
    DateTime? birthday,
    String? gender,
    Address? address,
    String? website,
    String? image,
  }) = _Datum;

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
}

@freezed
class Address with _$Address {
  const factory Address({
    String? streetName,
    String? buildingNumber,
    String? city,
    String? zipcode,
    String? country,
    String? countyCode,
    double? latitude,
    double? longitude,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
