import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pdax_flutter_exam/config/providers/dio_provider/dio_provider.dart';
import 'package:pdax_flutter_exam/feature/model/person_list_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'person_list_controller.g.dart';

@riverpod
class PersonListController extends _$PersonListController {
  Future<PersonListModel> fetchPersonList() async {
    final dio = ref.watch(dioProvider);
    final quantity = ref.watch(quantityProvider);
    bool firstFetch = true;

    debugPrint('quantity $quantity');

    try {
      Response response = await dio.get(
        '/persons',
        queryParameters: {'_quantity': quantity},
      );

      if (response.statusCode == 200) {
        if (firstFetch) {
          await ref.read(quantityProvider.notifier).setInt(20);
          firstFetch = false;
        }
      }

      return PersonListModel.fromJson(response.data);
    } catch (e) {
      debugPrint('error fetching data $e');
      return fetchPersonList();
    }
  }

  @override
  FutureOr<PersonListModel> build() async {
    return const PersonListModel();
  }
}

@riverpod
class Quantity extends _$Quantity {
  @override
  int build() {
    return 10;
  }

  Future<void> setInt(int value) async {
    state = value;
  }
}
