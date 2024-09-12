import 'package:flutter/material.dart';
import 'package:zain_alhuda/core/utils/app_styles.dart';

class CustomOfflineMessage extends StatelessWidget {
  const CustomOfflineMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.wifi_off_sharp, color: Colors.blueGrey, size: 100),
        Text(
          'لا يوجد اتصال',
          style: AppStyles.elmisri700Size18
              .copyWith(color: Colors.blueGrey, fontSize: 18),
        ),
      ],
    );
  }
}
