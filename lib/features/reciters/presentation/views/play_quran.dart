import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zain_alhuda/core/functions/convert_surah_number_to_name.dart';
import 'package:zain_alhuda/core/functions/get_reciters_audio_links.dart';
import 'package:zain_alhuda/core/utils/app_assets.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';
import 'package:zain_alhuda/core/utils/app_styles.dart';
import 'package:zain_alhuda/core/widgets/app_bar_space.dart';
import 'package:zain_alhuda/features/reciters/presentation/cubit/reciters_cubit.dart';
import 'package:zain_alhuda/features/reciters/presentation/cubit/reciters_state.dart';
import 'package:zain_alhuda/features/reciters/presentation/data/reciters_model.dart';

class PlayQuranView extends StatefulWidget {
  const PlayQuranView(
      {super.key, required this.reciterName, required this.moshaf});

  final String reciterName;
  final Moshaf moshaf;

  @override
  State<PlayQuranView> createState() => _PlayQuranViewState();
}

class _PlayQuranViewState extends State<PlayQuranView> {
  @override
  dispose() {
    RecitersCubit.audioPlayer.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<int> surahNumbers =
        widget.moshaf.surahList.split(',').map(int.parse).toList();

    List<String> links = getRecitersAudioLinks(widget.moshaf);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.reciterName),
        flexibleSpace: const AppBarSpace(),
      ),
      body: BlocBuilder<RecitersCubit, RecitersState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: surahNumbers.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      convertSurahNumberToName(surahNumbers[index]),
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.ltr,
                      style: AppStyles.quranSurah500Size80,
                    ),
                    state is PlayAudioIcon && state.index == index
                        ? Image.asset(
                            Assets.assetsImagesPlaying,
                            color: AppColors.thirdColor,
                            width: 32,
                          )
                        : Container(),
                    GestureDetector(
                      onTap: () async {
                        RecitersCubit.get(context)
                            .playAudio(links[index], index);
                      },
                      child: Icon(
                          state is PlayAudioIcon && state.index == index
                              ? Icons.pause_circle_outline
                              : Icons.play_circle_outline,
                          color: AppColors.primaryColor,
                          size: 32),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
