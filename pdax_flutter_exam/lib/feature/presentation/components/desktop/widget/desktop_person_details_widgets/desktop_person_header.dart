import 'package:flutter/material.dart';
import 'package:pdax_flutter_exam/config/constants.dart' as color_constants;
import 'package:pdax_flutter_exam/feature/model/person_list_model.dart';

class DesktopPersonHeader extends StatelessWidget {
  const DesktopPersonHeader({
    super.key,
    required this.personData,
  });
  //
  // ==================== Variables ==================== //
  final Datum personData;

  // ==================== UI ==================== //
  //
  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: SizedBox(
            height: 264,
            width: 264,
            child: ClipOval(
              child: Image.network(
                personData.image!,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    decoration: const BoxDecoration(
                      color: color_constants.seconday,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        'Empty Image Link',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: Colors.white,
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        //
        const SizedBox(width: 16),

        // ==================== Name & Email ===================== //
        Expanded(
          child: Text(
            '${personData.lastname}, ${personData.firstname}',
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontSize: 48,
                  color: color_constants.mainText,
                ),
          ),
        ),
      ],
    );
  }
}
