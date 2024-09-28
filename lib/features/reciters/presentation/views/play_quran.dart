import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:zain_alhuda/core/functions/convert_surah_number_to_name.dart';
import 'package:zain_alhuda/core/functions/get_reciters_audio_links.dart';
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

  final Map<int, String> surahNames = {
    1: "الفاتحة",
    2: "البقرة",
    3: "آل عمران",
    4: "النساء",
    5: "المائدة",
    6: "الأنعام",
    7: "الأعراف",
    8: "الأنفال",
    9: "التوبة",
    10: "يونس",
    11: "هود",
    12: "يوسف",
    13: "الرعد",
    14: "إبراهيم",
    15: "الحجر",
    16: "النحل",
    17: "الإسراء",
    18: "الكهف",
    19: "مريم",
    20: "طه",
    21: "الأنبياء",
    22: "الحج",
    23: "المؤمنون",
    24: "النور",
    25: "الفرقان",
    26: "الشعراء",
    27: "النمل",
    28: "القصص",
    29: "العنكبوت",
    30: "الروم",
    31: "لقمان",
    32: "السجدة",
    33: "الأحزاب",
    34: "سبأ",
    35: "فاطر",
    36: "يس",
    37: "الصافات",
    38: "ص",
    39: "الزمر",
    40: "غافر",
    41: "فصلت",
    42: "الشورى",
    43: "الزخرف",
    44: "الدخان",
    45: "الجاثية",
    46: "الأحقاف",
    47: "محمد",
    48: "الفتح",
    49: "الحجرات",
    50: "ق",
    51: "الذاريات",
    52: "الطور",
    53: "النجم",
    54: "القمر",
    55: "الرحمن",
    56: "الواقعة",
    57: "الحديد",
    58: "المجادلة",
    59: "الحشر",
    60: "الممتحنة",
    61: "الصف",
    62: "الجمعة",
    63: "المنافقون",
    64: "التغابن",
    65: "الطلاق",
    66: "التحريم",
    67: "الملك",
    68: "القلم",
    69: "الحاقة",
    70: "المعارج",
    71: "نوح",
    72: "الجن",
    73: "المزمل",
    74: "المدثر",
    75: "القيامة",
    76: "الإنسان",
    77: "المرسلات",
    78: "النبأ",
    79: "النازعات",
    80: "عبس",
    81: "التكوير",
    82: "الانفطار",
    83: "المطففين",
    84: "الانشقاق",
    85: "البروج",
    86: "الطارق",
    87: "الأعلى",
    88: "الغاشية",
    89: "الفجر",
    90: "البلد",
    91: "الشمس",
    92: "الليل",
    93: "الضحى",
    94: "الشرح",
    95: "التين",
    96: "العلق",
    97: "القدر",
    98: "البينة",
    99: "الزلزلة",
    100: "العاديات",
    101: "القارعة",
    102: "التكاثر",
    103: "العصر",
    104: "الهمزة",
    105: "الفيل",
    106: "قريش",
    107: "الماعون",
    108: "الكوثر",
    109: "الكافرون",
    110: "النصر",
    111: "المسد",
    112: "الإخلاص",
    113: "الفلق",
    114: "الناس",
  };

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
