import 'package:flutter/material.dart';
import 'package:pdax_flutter_exam/feature/model/person_list_model.dart';
import 'package:pdax_flutter_exam/global/text_field.dart';
import 'package:pdax_flutter_exam/config/constants.dart' as color_constants;

class MobilePersonContact extends StatelessWidget {
  const MobilePersonContact({
    super.key,
    required this.personData,
  });
  //
  // ==================== Variables ==================== //
  final Datum personData;

  @override
  Widget build(BuildContext context) {
    // ==================== Text Editing Controllers ==================== //
    TextEditingController phoneCtrlr = TextEditingController();
    TextEditingController emailCtrl = TextEditingController();
    TextEditingController websisteCtlr = TextEditingController();

    // ==================== UI ==================== //
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //
        Text(
          'CONTACT',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: color_constants.subText,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
        ),

        const SizedBox(width: 8),

        // Divider
        const Divider(
          color: color_constants.primary,
          thickness: 1.5,
        ),

        const SizedBox(height: 16),

        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Phone
                  Text(
                    'Phone',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: color_constants.mainText,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  //
                  const SizedBox(height: 6),

                  CustomTextField(
                    ctrlr: phoneCtrlr..text = personData.phone!,
                    enabled: false,
                    hint: 'Phone',
                    fontSize: 18,
                  ),
                ],
              ),
            ),

            const SizedBox(width: 16),

            // Email
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: color_constants.mainText,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  //
                  const SizedBox(height: 6),

                  CustomTextField(
                    ctrlr: emailCtrl..text = personData.email!,
                    enabled: false,
                    hint: 'Email',
                    fontSize: 18,
                  ),
                ],
              ),
            ),
          ],
        ),
        //

        const SizedBox(height: 16),

        // Website
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Website',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: color_constants.mainText,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
            ),

            //
            const SizedBox(height: 6),

            CustomTextField(
              ctrlr: websisteCtlr..text = personData.website!,
              enabled: false,
              hint: 'Website',
              fontSize: 18,
            ),
          ],
        ),
      ],
    );
  }
}
