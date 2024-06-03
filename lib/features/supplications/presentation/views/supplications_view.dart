import 'package:flutter/material.dart';
import 'package:zain_alhuda/core/utils/app_assets.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';
import 'package:zain_alhuda/core/widgets/app_bar_space.dart';

class SupplicationsView extends StatelessWidget {
  const SupplicationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الأدعية'),
        flexibleSpace: const AppBarSpace(),
      ),
      body: const Center(
        child: Text('Supplications View'),
      ),
    );
  }
}
