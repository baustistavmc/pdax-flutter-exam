import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdax_flutter_exam/config/constants.dart' as color_constants;
import 'package:pdax_flutter_exam/feature/controller/person_list_controller/person_list_controller.dart';
import 'package:pdax_flutter_exam/feature/controller/provider/person_list_provider.dart';

class MobilePersonListWidget extends ConsumerWidget {
  const MobilePersonListWidget({
    super.key,
    required this.fetchCount,
  });

  final int fetchCount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ==================== Variables ==================== //

    final isFirstFetched = ref.watch(isFirstFetchProvider);
    final person = ref.watch(personListProvider);

    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        // Initial Fetching of data (First Time)
        if (isFirstFetched) {
          await ref
              .read(personListControllerProvider.notifier)
              .fetchPersonList();
        }
      },
    );

    // ================== Person Card/UI ================== //
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: person.length + 1,
      itemBuilder: (context, index) {
        debugPrint('Test length = ${person.length}');

        if (index < person.length) {
          final personData = person[index];

          return Padding(
            padding: const EdgeInsets.only(
              bottom: 16.0,
            ),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 20,
              ),
              decoration: BoxDecoration(
                color: color_constants.background,
                border: Border.all(
                  width: 4,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              //
              // ========== Container Details ========== //
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // =================== Image =================== //
                  Flexible(
                    child: SizedBox(
                      height: 48,
                      width: 48,
                      child: ClipOval(
                        child: Image.network(
                          personData.image!,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              decoration: const BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  'Empty Image Link',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
                                        color: color_constants.subText,
                                        fontSize: 9,
                                        fontWeight: FontWeight.bold,
                                      ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 16),

                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ========== Name ========== //
                        Text(
                          '${personData.lastname!}, ${personData.firstname!}',
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                        ),
                        //
                        // ========== Email ========== //
                        Text(
                          personData.email!,
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          // =================== Load Data or No More Data =================== //
          return fetchCount != 4
              ? const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: color_constants.primary,
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 24,
                  ),
                  child: Center(
                    child: Text(
                      'No more data',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontSize: 14,
                            color: color_constants.mainText,
                          ),
                    ),
                  ),
                );
        }

        // else {
        //   return Center(
        //     child: InkWell(
        //       onTap: () async {
        //         await ref
        //             .read(personListControllerProvider.notifier)
        //             .fetchPersonList();
        //       },
        //       child: Container(
        //         width: 160,
        //         height: 40,
        //         decoration: BoxDecoration(
        //           border: Border.all(
        //             color: color_constants.primary,
        //             width: 2,
        //           ),
        //           borderRadius: BorderRadius.circular(6),
        //         ),
        //         child: Center(
        //           child: Text(
        //             'Load More',
        //             style:
        //                 Theme.of(context).textTheme.headlineLarge?.copyWith(
        //                       color: color_constants.primary,
        //                       fontSize: 16,
        //                     ),
        //           ),
        //         ),
        //       ),
        //     ),
        //   );
        // }
      },
    );
  }
}