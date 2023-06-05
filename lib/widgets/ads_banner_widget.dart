import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../constants/themes.dart';

class AdsBannerWidget extends StatelessWidget {
  const AdsBannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 170,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Improved Controller ',
                  style: AppTheme.kBannerTitle,
                ),
                const Gap(4),
                const Text(
                      'Design With',
                  style: AppTheme.kBannerTitle,
                ),
                const Gap(4),
                const Text(
                      'Virtual Realtiy',
                  style: AppTheme.kBannerTitle,
                ),
                const Gap(8),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kWhiteColor,
                      foregroundColor: kSecondaryColor,
                    ),
                    onPressed: () {},
                    child: Text('Buy Now!', style: AppTheme.kBodyText.copyWith(color: kPrimaryColor),))
              ],
            ),
          ),
        ),
        //Image.asset('assets/general/vr.png'),
        Expanded(
          child: Container(
            child: FractionalTranslation(
              translation: Offset(0.2, 0.0), // Adjust the position horizontally
              child: Image.asset(
                'assets/general/vr.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
