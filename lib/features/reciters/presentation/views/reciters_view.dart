import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zain_alhuda/core/functions/custome_navigate.dart';
import 'package:zain_alhuda/core/functions/get_reciters_audio_links.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';
import 'package:zain_alhuda/core/utils/app_styles.dart';
import 'package:zain_alhuda/core/widgets/app_bar_space.dart';
import 'package:zain_alhuda/features/reciters/presentation/cubit/reciters_cubit.dart';
import 'package:zain_alhuda/features/reciters/presentation/cubit/reciters_state.dart';
import 'package:zain_alhuda/features/reciters/presentation/widgets/app_bar_search_widget.dart';

class RecitersView extends StatelessWidget {
  const RecitersView({super.key});

  @override
  Widget build(BuildContext context) {
    final player = AudioPlayer();
    return Scaffold(
      appBar: AppBar(
        title: const Text('القراء'),
        flexibleSpace: const AppBarSpace(),
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(50), child: AppBarSearchWidget()),
      ),
      body: BlocBuilder<RecitersCubit, RecitersState>(
        buildWhen: (previous, current) =>
            current is GetRecitersLoading ||
            current is GetRecitersFailure ||
            current is GetRecitersSuccess,
        builder: (context, state) {
          if (state is GetRecitersLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetRecitersFailure) {
            return Center(
              child: Text(state.errorMsg),
            );
          } else if (state is GetRecitersSuccess) {
            state.reciters.sort((a, b) => a.name.compareTo(b.name));
            return ListView.builder(
                itemCount: state.reciters.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: ListTile(
                      title: Text(
                        state.reciters[index].name,
                        style: AppStyles.elmisri700Size18
                            .copyWith(color: AppColors.primaryColor),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          state.reciters[index].moshaf.length,
                          (ind) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width * .7,
                                  child: GestureDetector(
                                    onTap: () => CustomeNavigate.navigate(
                                        context, '/playQuran',
                                        extra: state.reciters[index].name),
                                    child: Text(
                                      state.reciters[index].moshaf[ind].name,
                                      style:
                                          AppStyles.elmisri500Size16.copyWith(
                                        color: AppColors.thirdColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  List<String> links = getRecitersAudioLinks(
                                      state.reciters[index].moshaf[ind]);
                                  RecitersCubit.get(context)
                                      .playAudio(links[0]);
                                },
                                child: const Icon(
                                  Icons.play_circle_outline,
                                  color: AppColors.primaryColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
