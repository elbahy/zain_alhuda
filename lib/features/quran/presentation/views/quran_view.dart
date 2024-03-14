import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zain_alhuda/features/quran/data/models/quran_model.dart';
import 'package:zain_alhuda/features/quran/presentation/cubit/quran_cubit.dart';
import 'package:zain_alhuda/features/quran/presentation/cubit/quran_state.dart';

// class QuranView extends StatelessWidget {
//   const QuranView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: BlocConsumer<QuranCubit, QuranState>(
//               listener: (context, state) {},
//               builder: (context, state) {
//                 if (state is GetQuranSuccess) {
//                   List<QuranSurahModel> quranSurah =
//                       state.quranModel.data.surahs;
//                   return ListView.builder(
//                     itemCount: quranSurah.length,
//                     itemBuilder: (context, index) {
//                       List<QuranAyahModel> quranAyah = quranSurah[index].ayahs;
//                       return Column(
//                         children: [
//                           Text(quranSurah[index].name),
//                           SizedBox(
//                               height: MediaQuery.of(context).size.height - 100,
//                               width: MediaQuery.of(context).size.width,
//                               child: PageView.builder(
//                                   itemCount: quranAyah.length,
//                                   itemBuilder: (context, index) {
//                                     return Text(quranAyah[index].text);
//                                   }))
//                         ],
//                       );
//                     },
//                   );
//                 } else {
//                   return const Center(child: CircularProgressIndicator());
//                 }
//               })),
//     );
//   }
// }

// class QuranView extends StatelessWidget {
//   const QuranView({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: BlocConsumer<QuranCubit, QuranState>(
//           listener: (context, state) {},
//           builder: (context, state) {
//             if (state is GetQuranSuccess) {
//               List<QuranSurahModel> quranSurah = state.quranModel.data.surahs;

//               // تجميع الآيات حسب الصفحة
//               Map<int, List<QuranAyahModel>> ayahsByPage = {};
//               for (var surah in quranSurah) {
//                 for (var ayah in surah.ayahs) {
//                   if (!ayahsByPage.containsKey(ayah.page)) {
//                     ayahsByPage[ayah.page] = [];
//                   }
//                   ayahsByPage[ayah.page]?.add(ayah);
//                 }
//               }

//               return PageView.builder(
//                 itemCount: ayahsByPage.length,
//                 itemBuilder: (context, index) {
//                   int currentPage = ayahsByPage.keys.elementAt(index);
//                   List<QuranAyahModel> quranAyahsOnPage =
//                       ayahsByPage[currentPage]!;

//                   // الحصول على اسم السورة
//                   int surahIndex = 0;
//                   while (surahIndex < quranSurah.length &&
//                       quranSurah[surahIndex].ayahs.first.page != currentPage) {
//                     surahIndex++;
//                   }

//                   String surahName = surahIndex < quranSurah.length
//                       ? quranSurah[surahIndex].name
//                       : '';

//                   return Card(
//                     elevation: 2,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: [
//                           Text(
//                             surahName,
//                             style: const TextStyle(
//                               fontSize: 20.0,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                           const SizedBox(height: 8.0),
//                           Text(
//                             'Page $currentPage',
//                             style: const TextStyle(
//                               fontSize: 18.0,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                           const SizedBox(height: 8.0),
//                           buildAyahsText(quranAyahsOnPage),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               );
//             } else {
//               return const Center(child: CircularProgressIndicator());
//             }
//           },
//         ),
//       ),
//     );
//   }

//   Widget buildAyahsText(List<QuranAyahModel> quranAyahs) {
//     String ayahsText = '';
//     for (int i = 0; i < quranAyahs.length; i++) {
//       String ayahText =
//           '${quranAyahs[i].text} (${quranAyahs[i].numberInSurah})';
//       ayahsText += ayahText;

//       // إضافة فراغ بين الآيات إلا الآية الأخيرة
//       if (i < quranAyahs.length - 1) {
//         ayahsText += ' ';
//       }
//     }

//     return Text(
//       ayahsText,
//       textAlign: TextAlign.center,
//     );
//   }
// }

class QuranView extends StatelessWidget {
  const QuranView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<QuranCubit, QuranState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is GetQuranSuccess) {
              List<QuranSurahModel> quranSurah = state.quranModel.data.surahs;

              //تجميع الآيات حسب الصفحة
              Map<int, List<QuranAyahModel>> ayahsByPage = {};
              for (var surah in quranSurah) {
                for (var ayah in surah.ayahs) {
                  if (!ayahsByPage.containsKey(ayah.page)) {
                    ayahsByPage[ayah.page] = [];
                  }
                  ayahsByPage[ayah.page]?.add(ayah);
                }
              }

              return PageView.builder(
                itemCount: ayahsByPage.length,
                itemBuilder: (context, index) {
                  int currentPage = ayahsByPage.keys.elementAt(index);
                  List<QuranAyahModel> quranAyahsOnPage =
                      ayahsByPage[currentPage]!;

                  // الحصول على اسم السورة
                  int surahIndex = 0;
                  while (surahIndex < quranSurah.length &&
                      quranSurah[surahIndex].ayahs.first.page != currentPage) {
                    surahIndex++;
                  }

                  List<String> surahName = surahIndex < quranSurah.length
                      ? [
                          quranSurah[surahIndex].name,
                          (surahIndex != 0 && surahIndex != 8)
                              ? 'بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ'
                              : ''
                        ]
                      : ['', ''];

                  return Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Page $currentPage',
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            surahName[0] != ''
                                ? Text(
                                    surahName[0],
                                    style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                                : const SizedBox(),
                            surahName[1] != ''
                                ? Text(
                                    surahName[1],
                                    textAlign: TextAlign.center,
                                    textDirection: TextDirection.rtl,
                                    style: const TextStyle(
                                      fontSize: 30.0,
                                      fontFamily: 'Uthmanic',
                                    ),
                                  )
                                : const SizedBox(),
                            const SizedBox(height: 8.0),
                            const SizedBox(height: 8.0),
                            buildAyahsText(quranAyahsOnPage, surahName[0]),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Widget buildAyahsText(List<QuranAyahModel> quranAyahs, String surahName) {
    String ayahsText = '';

    // البحث عن "بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ" وحذفها من البداية
    for (int i = 0; i < quranAyahs.length; i++) {
      String ayahText = quranAyahs[i].text;

      if (ayahText.startsWith("بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ")) {
        ayahText =
            ayahText.replaceFirst("بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ", '');
      }

      ayahText = '$ayahText (${quranAyahs[i].numberInSurah})';
      ayahsText += ayahText;

      // إضافة فراغ بين الآيات إلا الآية الأخيرة
      if (i < quranAyahs.length - 1) {
        ayahsText += ' ';
      }
    }

    return Text(
      ayahsText,
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
      style: const TextStyle(
        fontSize: 28.0,
        fontFamily: 'Uthmanic',
      ),
    );
  }
}
