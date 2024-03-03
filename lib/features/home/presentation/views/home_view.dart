import 'package:flutter/material.dart';
import 'package:zain_alhuda/generated/l10n.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).settings),
      ),
      body: ListView(
        children: [
          Text(S.of(context).settings),
        ],
      ),
    );
  }
}
