import 'package:flutter/material.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';

class SearchButton extends StatelessWidget {
  const SearchButton(
      {super.key, required this.isSearching, required this.onPressed});

  final bool isSearching;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.search),
      color: AppColors.secondColor,
      onPressed: onPressed,
      iconSize: 35,
      isSelected: isSearching,
      selectedIcon: const Icon(Icons.close),
    );
  }
}
