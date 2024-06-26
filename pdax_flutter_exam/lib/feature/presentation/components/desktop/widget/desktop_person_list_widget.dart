import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdax_flutter_exam/feature/controller/person_list_controller.dart';
// import 'package:pdax_flutter_exam/config/constants.dart' as color_constants;

class DesktopPersonListWidget extends ConsumerWidget {
  const DesktopPersonListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ================== Variables ================== //
    final personList = ref.watch(personListControllerProvider);

    return personList.when(
      data: (person) {
        return Expanded(
          child: ListView.builder(
            itemCount: person.data!.length,
            itemBuilder: (context, index) {
              // ========== Variables ========== //
              final personData = person.data![index];

              debugPrint('index ${person.data![index]}');

              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: const Text(
                      'test',
                      // style: Theme.of(context)
                      //     .textTheme
                      //     .labelLarge
                      //     ?.copyWith(color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              );
            },
          ),
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (error, stackTrace) {
        debugPrint('error');

        return const Text('error');
      },
    );
  }
}
