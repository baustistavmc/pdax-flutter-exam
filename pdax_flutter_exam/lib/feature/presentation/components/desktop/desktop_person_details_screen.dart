import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdax_flutter_exam/feature/controller/provider/person_list_provider.dart';
import 'package:pdax_flutter_exam/feature/presentation/components/desktop/widget/desktop_person_details_widgets/desktop_person_address.dart';
import 'package:pdax_flutter_exam/feature/presentation/components/desktop/widget/desktop_person_details_widgets/desktop_person_header.dart';
import 'package:pdax_flutter_exam/config/constants.dart' as color_constants;
import 'package:pdax_flutter_exam/feature/presentation/components/desktop/widget/desktop_person_details_widgets/desktop_person_contact.dart';
import 'package:pdax_flutter_exam/feature/presentation/components/desktop/widget/desktop_person_details_widgets/desktop_person_personal.dart';

class DesktopPersonDetailsScreen extends ConsumerWidget {
  const DesktopPersonDetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // =================== Variables =================== //
    final personData = ref.watch(personDetailsProvider);

    // =================== UI =================== //
    return Scaffold(
      backgroundColor: color_constants.background,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 80,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                //
                // ================== Header ================== //
                Text(
                  'Profile',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: color_constants.mainText,
                      ),
                ),
                //
                const SizedBox(height: 24),

                // ================== Profile Header ================== //
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: DesktopPersonHeader(
                        personData: personData!,
                      ),
                    ),

                    const SizedBox(width: 8),

                    // ================== Contact ================== //
                    Expanded(
                        child: DesktopPersonContact(personData: personData)),
                  ],
                ),

                const SizedBox(height: 24),

                // ================== Personal Information ================== //
                DesktopPersonInfo(personData: personData),

                const SizedBox(height: 24),

                // ================== Address Information ================== //
                DesktopPersonAddress(personData: personData),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
