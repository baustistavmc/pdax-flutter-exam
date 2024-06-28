import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pdax_flutter_exam/config/constants.dart' as color_constants;
import 'package:pdax_flutter_exam/feature/controller/person_list_controller/person_list_controller.dart';
import 'package:pdax_flutter_exam/feature/controller/provider/person_list_provider.dart';
import 'package:pdax_flutter_exam/global/shimmer/shimmer.dart';

class DesktopPersonListWidget extends ConsumerWidget {
  const DesktopPersonListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ==================== Variables ==================== //
    final isFirstFetched = ref.watch(isFirstFetchProvider);
    final person = ref.watch(personListProvider);
    final counter = ref.watch(counterProvider);

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
    return !isFirstFetched
        ? ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: person.length + 1,
            itemBuilder: (context, index) {
              if (index < person.length) {
                final personData = person[index];

                return Padding(
                  padding: const EdgeInsets.only(
                    bottom: 16.0,
                  ),
                  child: InkWell(
                    hoverColor: color_constants.primary,
                    onTap: () async {
                      // Store personData to personData Provider
                      await ref
                          .read(personDetailsProvider.notifier)
                          .setValue(personData);

                      if (context.mounted) {
                        context.pushNamed('PersonDetailsScreen');
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xFFF3F3F3),
                      ),

                      //
                      // ========== Container Details ========== //
                      child: Row(
                        children: [
                          Expanded(
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
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Container(
                                            decoration: const BoxDecoration(
                                              color: color_constants.seconday,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Empty Image Link',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge
                                                    ?.copyWith(
                                                      color: Colors.white,
                                                      fontSize: 9,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // ========== Name ========== //
                                      Text(
                                        '${personData.lastname!}, ${personData.firstname!}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(
                                              color: color_constants.mainText,
                                              fontSize: 16,
                                            ),
                                      ),
                                      //
                                      // ========== Email ========== //
                                      Text(
                                        personData.email!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(
                                              color: color_constants.mainText,
                                              fontSize: 16,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // =================== Arrow Icon =================== //
                          IconButton(
                            onPressed: () async {
                              await ref
                                  .read(personDetailsProvider.notifier)
                                  .setValue(personData);

                              if (context.mounted) {
                                context.pushNamed('PersonDetailsScreen');
                              }
                            },
                            icon: const Icon(
                              size: 32,
                              Icons.arrow_right,
                              color: color_constants.primary,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                // =================== Load Data or No More Data =================== //
                return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: counter != 4
                        ? Center(
                            child: InkWell(
                              onTap: () async {
                                await ref.read(counterProvider.notifier).add();

                                await ref
                                    .read(personListControllerProvider.notifier)
                                    .fetchPersonList();
                              },
                              child: Container(
                                width: 160,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: color_constants.primary,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Center(
                                  child: Text(
                                    'Load More',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge
                                        ?.copyWith(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'No more data Available',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: color_constants.mainText,
                                    ),
                              ),
                              const SizedBox(width: 8),
                              // ========== Reset Button ========== //
                              InkWell(
                                onTap: () async {
                                  ref.invalidate(personListProvider);
                                  ref.invalidate(counterProvider);
                                  ref.invalidate(isFirstFetchProvider);

                                  await ref
                                      .read(
                                          personListControllerProvider.notifier)
                                      .fetchPersonList();
                                },
                                child: Text(
                                  'reset list',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
                                        fontSize: 16,
                                        color: color_constants.subText,
                                      ),
                                ),
                              ),
                            ],
                          ));
              }
            },
          )
        : buildMobileLoadingSkeleton();
  }
}
