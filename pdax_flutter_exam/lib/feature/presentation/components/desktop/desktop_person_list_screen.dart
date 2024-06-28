import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdax_flutter_exam/config/constants.dart' as color_constants;
import 'package:pdax_flutter_exam/feature/presentation/components/desktop/widget/desktop_person_list_widget.dart';

class DesktopPersonListScreen extends ConsumerWidget {
  const DesktopPersonListScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // =================== UI =================== //
    return Scaffold(
      backgroundColor: color_constants.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
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
                      color: color_constants.mainText,
                    ),
              ),

              const SizedBox(height: 16),

              // ================== Person List Widget ================== //

              const Expanded(
                child: SingleChildScrollView(
                  child: DesktopPersonListWidget(),
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
