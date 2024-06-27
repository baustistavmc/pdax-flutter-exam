import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdax_flutter_exam/config/constants.dart' as color_constants;
import 'package:pdax_flutter_exam/feature/controller/person_list_controller/person_list_controller.dart';
import 'package:pdax_flutter_exam/feature/controller/provider/person_list_provider.dart';
import 'package:pdax_flutter_exam/feature/presentation/components/mobile/widget/mobile_person_list_widget.dart';

class MobilePersonListScreen extends ConsumerStatefulWidget {
  const MobilePersonListScreen({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MobilePersonListState();
}

class _MobilePersonListState extends ConsumerState<MobilePersonListScreen> {
  final scrollController = ScrollController();
  int appendCount = 1;

// init state
  @override
  void initState() {
    super.initState();

    // Scroll Listener for fetching more data
    scrollController.addListener(_onScroll);
  }

  void _onScroll() async {
    if (scrollController.position.maxScrollExtent == scrollController.offset &&
        appendCount != 4) {
      // Fetch Data on Scroll End
      await ref.read(personListControllerProvider.notifier).fetchPersonList();

      // Increment value to counter
      setState(() {
        appendCount += 1;
      });
    }
  }

  // dispose
  @override
  void dispose() {
    scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // =================== UI =================== //
    return Scaffold(
      backgroundColor: color_constants.background,
      body: RefreshIndicator(
        backgroundColor: color_constants.background,
        color: color_constants.primary,
        onRefresh: () async {
          setState(() {
            appendCount = 1;
          });

          ref.invalidate(personListProvider);
          ref.invalidate(isFirstFetchProvider);

          await ref
              .read(personListControllerProvider.notifier)
              .fetchPersonList();
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),

                  // ================== Header ================== //
                  Text(
                    'Person List',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                  ),

                  const SizedBox(height: 16),

                  // ================== Person List Widget ================== //

                  MobilePersonListWidget(
                    fetchCount: appendCount,
                  ),

                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
