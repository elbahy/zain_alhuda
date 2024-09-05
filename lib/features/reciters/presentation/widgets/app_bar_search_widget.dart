import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';
import 'package:zain_alhuda/core/utils/app_styles.dart';
import 'package:zain_alhuda/features/reciters/presentation/cubit/reciters_cubit.dart';

class AppBarSearchWidget extends StatelessWidget {
  const AppBarSearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        decoration: const InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.primaryColor,
          ),
          hintText: 'إبحث عن قارئك المفضل ',
          hintStyle: AppStyles.elmisri500Size16,
          fillColor: AppColors.secondColor,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
            Radius.circular(10),
          )),
        ),
        style:
            AppStyles.elmisri500Size16.copyWith(color: AppColors.primaryColor),
        onChanged: (value) =>
            context.read<RecitersCubit>().searchReciters(value),
      ),
    );
  }
}
