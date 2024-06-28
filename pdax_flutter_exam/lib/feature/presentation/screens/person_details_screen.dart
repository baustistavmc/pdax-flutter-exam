import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdax_flutter_exam/config/providers/dimension_provider/dimension_provider.dart';
import 'package:pdax_flutter_exam/feature/presentation/components/desktop/desktop_person_details_screen.dart';
import 'package:pdax_flutter_exam/feature/presentation/components/mobile/mobile_person_details_screen.dart';

class PersonDetailsScreen extends ConsumerWidget {
  const PersonDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dimension = ref.watch(dimensionControllerProvider);

    if (dimension is DimensionMobile) {
      return const MobilePersonDetailsScreen();
    }

    if (dimension is DimensionDesktop) {
      return const DesktopPersonDetailsScreen();
    }

    return const DesktopPersonDetailsScreen();
  }
}
