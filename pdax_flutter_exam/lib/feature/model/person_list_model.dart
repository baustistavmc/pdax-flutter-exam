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
    required String status,
    required int code,
    required int total,
    required List<Datum> data,
  }) = _PersonListModel;

  factory PersonListModel.fromJson(Map<String, dynamic> json) =>
      _$PersonListModelFromJson(json);
}

@freezed
class Datum with _$Datum {
  const factory Datum({
    required int id,
    required String firstname,
    required String lastname,
    required String email,
    required String phone,
    required DateTime birthday,
    required String gender,
    required Address address,
    required String website,
    required String image,
  }) = _Datum;

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
}

@freezed
class Address with _$Address {
  const factory Address({
    required int id,
    required String street,
    required String streetName,
    required String buildingNumber,
    required String city,
    required String zipcode,
    required String country,
    required String countyCode,
    required double latitude,
    required double longitude,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
