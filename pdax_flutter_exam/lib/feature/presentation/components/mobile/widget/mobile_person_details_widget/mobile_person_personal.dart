import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pdax_flutter_exam/feature/model/person_list_model.dart';
import 'package:pdax_flutter_exam/global/text_field.dart';
import 'package:pdax_flutter_exam/config/constants.dart' as color_constants;

class MobilePersonInfo extends StatelessWidget {
  const MobilePersonInfo({
    super.key,
    required this.personData,
  });
  //
  // ==================== Variables ==================== //
  final Datum personData;

  @override
  Widget build(BuildContext context) {
    // ==================== Text Editing Controllers ==================== //
    TextEditingController genderCtrl = TextEditingController();
    TextEditingController birthdayCtrlr = TextEditingController();

    String formattedDate =
        DateFormat('MMMM dd, yyyy').format(personData.birthday!);

    // ==================== UI ==================== //
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Text(
          'Personal Information',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: color_constants.subText,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(width: 8),
        //
        const Divider(
          color: color_constants.primary,
          thickness: 1.5,
        ),

        const SizedBox(height: 16),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Birthday',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: color_constants.mainText,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
            ),

            //
            const SizedBox(height: 6),

            CustomTextField(
              ctrlr: birthdayCtrlr..text = formattedDate,
              enabled: false,
              hint: 'Birthday',
              fontSize: 18,
            ),
          ],
        ),

        //
        const SizedBox(
          height: 16,
        ),

        // Gender
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Gender',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: color_constants.mainText,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
            ),

            //
            const SizedBox(height: 6),

            CustomTextField(
              ctrlr: genderCtrl..text = personData.gender!,
              enabled: false,
              hint: 'Gender',
              fontSize: 18,
            ),
          ],
        ),

        const SizedBox(height: 16),
      ],
    );
  }
}
