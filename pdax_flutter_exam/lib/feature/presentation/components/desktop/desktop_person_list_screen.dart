import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdax_flutter_exam/config/constants.dart' as color_constants;
import 'package:pdax_flutter_exam/feature/presentation/components/desktop/widget/desktop_person_list_widget.dart';

class DesktopPersonListScreen extends ConsumerWidget {
  const DesktopPersonListScreen({super.key});

  // ================== UI ================== //
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: color_constants.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Person List',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
              ),

              const SizedBox(height: 48),

              // ================== Person List Widget ================== //
              const DesktopPersonListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
