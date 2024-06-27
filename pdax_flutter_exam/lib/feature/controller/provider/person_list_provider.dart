import 'package:pdax_flutter_exam/feature/model/person_list_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'person_list_provider.g.dart';

// This is a flag boolean provider to determine if the request GET API is called the first time.
@Riverpod(keepAlive: true)
class IsFirstFetch extends _$IsFirstFetch {
  @override
  bool build() {
    return true;
  }

  Future<void> setBool(bool value) async {
    state = value;
  }
}

// This is a List Provider wherein data is appended every successful get of the data
@Riverpod(keepAlive: true)
class PersonList extends _$PersonList {
  @override
  List<Datum> build() {
    return [];
  }

  Future<void> addValues(List<Datum> values) async {
    state.addAll(values);
  }
}
