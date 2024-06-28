import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdax_flutter_exam/feature/controller/provider/person_list_provider.dart';
import 'package:pdax_flutter_exam/config/constants.dart' as color_constants;
import 'package:pdax_flutter_exam/feature/presentation/components/mobile/widget/mobile_person_details_widget/mobile_person_address.dart';
import 'package:pdax_flutter_exam/feature/presentation/components/mobile/widget/mobile_person_details_widget/mobile_person_contact.dart';
import 'package:pdax_flutter_exam/feature/presentation/components/mobile/widget/mobile_person_details_widget/mobile_person_header.dart';
import 'package:pdax_flutter_exam/feature/presentation/components/mobile/widget/mobile_person_details_widget/mobile_person_personal.dart';

class MobilePersonDetailsScreen extends ConsumerWidget {
  const MobilePersonDetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // =================== Variables =================== //
    final personData = ref.watch(personDetailsProvider);

    // =================== UI =================== //
    return Scaffold(
      backgroundColor: color_constants.background,

      // =================== App Bar =================== //
      appBar: AppBar(
        backgroundColor: color_constants.seconday,
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text(
          'Profile Details Screen',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
        ),
      ),

      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                //
                // ================== Header ================== //
                // Text(
                //   'Profile',
                //   style: Theme.of(context).textTheme.labelLarge!.copyWith(
                //         fontSize: 32,
                //         fontWeight: FontWeight.bold,
                //         color: color_constants.mainText,
                //       ),
                // ),
                //
                const SizedBox(height: 24),

                // ================== Profile Header ================== //
                Align(
                  alignment: Alignment.center,
                  child: MobilePersonHeader(
                    personData: personData!,
                  ),
                ),

                const SizedBox(height: 24),

                // =================== Contact ==================== //
                MobilePersonContact(personData: personData),

                const SizedBox(height: 24),

                // ================== Personal Information ================== //
                MobilePersonInfo(personData: personData),

                const SizedBox(height: 24),

                // ================== Address Information ================== //
                MobilePersonAddress(personData: personData),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
