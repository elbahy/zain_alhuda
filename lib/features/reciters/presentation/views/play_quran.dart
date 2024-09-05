import 'package:flutter/material.dart';
import 'package:zain_alhuda/core/widgets/app_bar_space.dart';

class PlayQuranView extends StatelessWidget {
  const PlayQuranView({super.key, required this.reciterName});

  final String reciterName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(reciterName),
        flexibleSpace: const AppBarSpace(),
      ),
    );
  }
}
