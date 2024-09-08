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
                          (ind) {
                            List<String> links = getRecitersAudioLinks(
                                state.reciters[index].moshaf[ind]);
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .7,
                                    child: GestureDetector(
                                      onTap: () => CustomeNavigate.navigate(
                                        context,
                                        '/playQuran',
                                        extra: {
                                          'reciterName':
                                              state.reciters[index].name,
                                          'moshaf':
                                              state.reciters[index].moshaf[ind]
                                        },
                                      ),
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
                                PlayButtonWidget(links: links, index: ind),
                              ],
                            );
                          },
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

class PlayButtonWidget extends StatefulWidget {
  const PlayButtonWidget({
    super.key,
    required this.links,
    required this.index,
  });

  final List<String> links;
  final int index;

  @override
  State<PlayButtonWidget> createState() => _PlayButtonWidgetState();
}

class _PlayButtonWidgetState extends State<PlayButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        RecitersCubit.get(context).playAudio(
          widget.links[0],
          widget.index,
        );
        setState(() {});
      },
      child: Icon(
        RecitersCubit.get(context).currentPlayingUrl != widget.links[0]
            ? Icons.play_circle_outline
            : Icons.pause_circle_outline,
        color: AppColors.primaryColor,
      ),
    );
  }
}
