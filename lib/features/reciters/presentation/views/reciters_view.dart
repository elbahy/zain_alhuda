import 'package:flutter/material.dart';
import 'package:zain_alhuda/core/widgets/app_bar_space.dart';

class RecitersView extends StatelessWidget {
  const RecitersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('القراء'),
        flexibleSpace: const AppBarSpace(),
      ),
      body: const Center(
        child: Text('Reciters View'),
      ),
    );
  }
}
