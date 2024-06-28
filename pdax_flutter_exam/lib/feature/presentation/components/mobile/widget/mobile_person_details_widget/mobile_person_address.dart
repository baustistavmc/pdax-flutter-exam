import 'package:flutter/material.dart';
import 'package:pdax_flutter_exam/feature/model/person_list_model.dart';
import 'package:pdax_flutter_exam/global/text_field.dart';
import 'package:pdax_flutter_exam/config/constants.dart' as color_constants;

class MobilePersonAddress extends StatelessWidget {
  const MobilePersonAddress({
    super.key,
    required this.personData,
  });
  //
  // ==================== Variables ==================== //
  final Datum personData;

  @override
  Widget build(BuildContext context) {
    // ==================== Text Editing Controllers ==================== //
    TextEditingController addressIdCtrlr = TextEditingController();
    TextEditingController streetCtrlr = TextEditingController();
    TextEditingController streetNameCtrlr = TextEditingController();
    TextEditingController buildingNoCtrlr = TextEditingController();
    TextEditingController cityCtrlr = TextEditingController();
    TextEditingController zipCodeCtrlr = TextEditingController();
    TextEditingController countryCtrlr = TextEditingController();
    TextEditingController countyCodeCtrlr = TextEditingController();
    TextEditingController latCtrlr = TextEditingController();
    TextEditingController longCtrlr = TextEditingController();

    // ==================== UI ==================== //
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Address',
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
                  // Address ID
                  Text(
                    'Address ID',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: color_constants.mainText,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  //
                  const SizedBox(height: 6),

                  CustomTextField(
                    ctrlr: addressIdCtrlr
                      ..text = personData.address!.id.toString(),
                    enabled: false,
                    hint: 'Address ID',
                    fontSize: 18,
                  ),
                ],
              ),
            ),

            const SizedBox(width: 16),

            // Street
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Street',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: color_constants.mainText,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  //
                  const SizedBox(height: 6),

                  CustomTextField(
                    ctrlr: streetCtrlr..text = personData.address!.street!,
                    enabled: false,
                    hint: 'Street',
                    fontSize: 18,
                  ),
                ],
              ),
            ),
          ],
        ),
        //

        const SizedBox(height: 16),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Street Name
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Street Name',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: color_constants.mainText,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  //
                  const SizedBox(height: 6),

                  CustomTextField(
                    ctrlr: streetNameCtrlr
                      ..text = personData.address!.streetName!,
                    enabled: false,
                    hint: 'Street Name',
                    fontSize: 18,
                  ),
                ],
              ),
            ),

            //
            const SizedBox(width: 24),

            // Building No.
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Building No.',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: color_constants.mainText,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  //
                  const SizedBox(height: 6),

                  CustomTextField(
                    ctrlr: buildingNoCtrlr
                      ..text = personData.address!.buildingNumber!,
                    enabled: false,
                    hint: 'Building No.',
                    fontSize: 18,
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // City
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'City',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: color_constants.mainText,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  //
                  const SizedBox(height: 6),

                  CustomTextField(
                    ctrlr: cityCtrlr..text = personData.address!.city!,
                    enabled: false,
                    hint: 'City',
                    fontSize: 18,
                  ),
                ],
              ),
            ),

            //
            const SizedBox(width: 24),

            // Zip Code
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Zip Code',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: color_constants.mainText,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  //
                  const SizedBox(height: 6),

                  CustomTextField(
                    ctrlr: zipCodeCtrlr..text = personData.address!.zipcode!,
                    enabled: false,
                    hint: 'Zip Code',
                    fontSize: 18,
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Country
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Country',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: color_constants.mainText,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  //
                  const SizedBox(height: 6),

                  CustomTextField(
                    ctrlr: countryCtrlr..text = personData.address!.country!,
                    enabled: false,
                    hint: 'Country',
                    fontSize: 18,
                  ),
                ],
              ),
            ),

            //
            const SizedBox(width: 24),

            // County Code
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'County Code',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: color_constants.mainText,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  //
                  const SizedBox(height: 6),

                  CustomTextField(
                    ctrlr: countyCodeCtrlr
                      ..text = personData.address!.countyCode!,
                    enabled: false,
                    hint: 'County Code',
                    fontSize: 18,
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Latitude
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Latitude',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: color_constants.mainText,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  //
                  const SizedBox(height: 6),

                  CustomTextField(
                    ctrlr: latCtrlr
                      ..text = personData.address!.latitude.toString(),
                    enabled: false,
                    hint: 'Latitude',
                    fontSize: 18,
                  ),
                ],
              ),
            ),

            //
            const SizedBox(width: 24),

            // Longitude
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Longitude',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: color_constants.mainText,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  //
                  const SizedBox(height: 6),

                  CustomTextField(
                    ctrlr: longCtrlr
                      ..text = personData.address!.longitude.toString(),
                    enabled: false,
                    hint: 'County Code',
                    fontSize: 18,
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),
      ],
    );
  }
}
