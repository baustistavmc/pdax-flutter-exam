import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdax_flutter_exam/config/providers/dimension_provider/dimension_provider.dart';
import 'package:pdax_flutter_exam/feature/presentation/components/desktop/desktop_person_list_screen.dart';
import 'package:pdax_flutter_exam/feature/presentation/components/mobile/mobile_person_list_screen.dart';

class PersonListScreen extends ConsumerWidget {
  const PersonListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dimension = ref.watch(dimensionControllerProvider);

    if (dimension is DimensionMobile) {
      return const MobilePersonListScreen();
    }

    if (dimension is DimensionDesktop) {
      return const DesktopPersonListScreen();
    }

    return const MobilePersonListScreen();
  }
}
