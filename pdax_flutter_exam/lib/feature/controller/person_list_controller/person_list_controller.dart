import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pdax_flutter_exam/config/providers/dio_provider/dio_provider.dart';
import 'package:pdax_flutter_exam/feature/controller/provider/person_list_provider.dart';
import 'package:pdax_flutter_exam/feature/model/person_list_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'person_list_controller.g.dart';

// ============================== PERSON LIST CONTROLLER ============================== //
@riverpod
class PersonListController extends _$PersonListController {
  @override
  Future<void> build() async {
    // Initial fetch
    await fetchPersonList();
  }

  // ==================== REQUEST GET API METHOD ==================== //
  Future<void> fetchPersonList() async {
    final dio = ref.watch(dioProvider);
    final isFirstFetch = ref.watch(isFirstFetchProvider);

    try {
      Response response = await dio.get(
        '/persons',
        queryParameters: {'_quantity': isFirstFetch ? 10 : 20},
      );

      debugPrint('GET Response Status Code: ${response.statusCode}');

      if (response.statusCode == 200) {
        // Parse response data to list
        PersonListModel personModel = PersonListModel.fromJson(response.data);
        List<Datum> dataList = personModel.data!;

        // appends parsed data to list provider
        await ref.read(personListProvider.notifier).addValues(dataList);

        if (isFirstFetch) {
          // sets is first fetch boolean to false
          await ref.read(isFirstFetchProvider.notifier).setBool(false);
        }
      }
    } catch (e) {
      debugPrint('error fetching data $e');
    }
  }
}
