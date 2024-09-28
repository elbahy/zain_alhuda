import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:zain_alhuda/core/functions/convert_surah_number_to_name.dart';
import 'package:zain_alhuda/core/utils/app_assets.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';
import 'package:zain_alhuda/core/utils/app_styles.dart';
import 'package:zain_alhuda/core/widgets/app_bar_space.dart';
import 'package:zain_alhuda/features/reciters/presentation/cubit/reciters_cubit.dart';
import 'package:zain_alhuda/features/reciters/presentation/cubit/reciters_state.dart';
import 'package:zain_alhuda/features/reciters/presentation/data/reciters_model.dart';
import 'package:zain_alhuda/features/reciters/presentation/widgets/custom_offline_message.dart';
import 'package:zain_alhuda/features/reciters/presentation/widgets/search_button_widget.dart';

class PlayQuranView extends StatefulWidget {
  const PlayQuranView(
      {super.key, required this.reciterName, required this.moshaf});

  final String reciterName;
  final Moshaf moshaf;

  @override
  State<PlayQuranView> createState() => _PlayQuranViewState();
}

class _PlayQuranViewState extends State<PlayQuranView> {
  List<int> surahNumbers = [];
  List<int> filteredSurahNumbers = []; // قائمة السور المرشحة
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // ملأ قائمة السور الأصلية
    surahNumbers = widget.moshaf.surahList.split(',').map(int.parse).toList();
    filteredSurahNumbers = List.from(surahNumbers); // نسخ القائمة الأصلية
  }

  @override
  dispose() {
    RecitersCubit.audioPlayer.stop();
    super.dispose();
  }

  bool isSearching = false;

  void filterSurahs(String query) {
    RecitersCubit.get(context).audioPlayerDispose();

    if (query.isEmpty) {
      setState(() {
        filteredSurahNumbers = List.from(surahNumbers); // إعادة كل السور
      });
    } else {
      setState(() {
        filteredSurahNumbers = surahNumbers.where((surahNumber) {
          // تحقق مما إذا كانت السورة تحتوي على النص المدخل
          String surahName = surahNames[surahNumber] ?? '';
          return surahName.contains(query); // تحقق من الاسم
        }).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // List<int> surahNumbers =
    //     widget.moshaf.surahList.split(',').map(int.parse).toList();

    // List<String> links = getRecitersAudioLinks(widget.moshaf);
    List<String> links = filteredSurahNumbers
        .map((e) =>
            '${widget.moshaf.server}/${e.toString().padLeft(3, '0')}.mp3')
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.reciterName),
        flexibleSpace: const AppBarSpace(),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: !isSearching
                ? Text(
                    widget.moshaf.name,
                    style: AppStyles.elmisri500Size16.copyWith(
                      color: AppColors.secondColor,
                    ),
                  )
                : TextField(
                    controller: searchController,
                    onChanged: (value) => filterSurahs(value),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: AppColors.primaryColor,
                      ),
                      hintText: 'ابحث باسم السورة',
                      hintStyle: AppStyles.elmisri500Size16,
                      fillColor: AppColors.secondColor,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      )),
                    ),
                    style: AppStyles.elmisri500Size16
                        .copyWith(color: AppColors.primaryColor),
                  ),
          ),
        ),
        actions: [
          SearchButton(
              isSearching: isSearching,
              onPressed: () {
                setState(() {
                  isSearching = !isSearching;
                });
              })
        ],
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          List<ConnectivityResult> connectivity,
          Widget child,
        ) {
          final bool connected =
              !connectivity.contains(ConnectivityResult.none);
          if (!connected) {
            RecitersCubit.get(context).audioPlayerDispose();
            return const Center(child: CustomOfflineMessage());
          }
          return child;
        },
        child: BlocBuilder<RecitersCubit, RecitersState>(
          builder: (context, state) {
            return ListView.builder(
              itemCount: filteredSurahNumbers.length,
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
                        convertSurahNumberToName(filteredSurahNumbers[index]),
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
                          RecitersCubit.get(context).playAudio(links, index);
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
      ),
    );
  }
}
