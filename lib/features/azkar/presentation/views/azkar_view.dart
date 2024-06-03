import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zain_alhuda/core/functions/custome_navigate.dart';
import 'package:zain_alhuda/core/utils/app_assets.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';
import 'package:zain_alhuda/core/utils/app_styles.dart';
import 'package:zain_alhuda/features/azkar/data/models/azkar_model.dart';
import 'package:zain_alhuda/features/azkar/presentation/cubit/azkar_cubit.dart';
import 'package:zain_alhuda/features/azkar/presentation/cubit/azkar_state.dart';
import 'package:zain_alhuda/features/azkar/presentation/widgets/azkar_type_item.dart';

class AzkarView extends StatelessWidget {
  const AzkarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الأذكار'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primaryColor, AppColors.thirdColor],
            ),
            image: DecorationImage(image: AssetImage(Assets.assetsImagesAppBarBg), fit: BoxFit.cover),
          ),
        ),
      ),
      body: BlocBuilder<AzkarCubit, AzkarState>(builder: (context, state) {
        if (state is AzkarLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is AzkarLoaded) {
          AzkarModel azkarModel = state.azkarList;

          return Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .75,
              child: ListView.builder(
                itemCount: azkarModel.data.length,
                itemBuilder: (context, index) {
                  return AzkarTypeItem(
                    azkarType: azkarModel.data[index].title,
                    onTap: () {
                      CustomeNavigate.navigate(context, '/azkarContent', extra: azkarModel.data[index]);
                    },
                  );
                },
              ),
            ),
          );
        } else if (state is AzkarError) {
          return Center(child: Text(state.message));
        } else {
          return Container();
        }
      }),
    );
  }
}
