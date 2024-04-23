import 'package:flutter/material.dart';
import 'package:zain_alhuda/core/functions/convert_number_to_arabic.dart';
import 'package:zain_alhuda/core/functions/custome_navigate.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';
import 'package:zain_alhuda/features/quran/data/models/juz_model.dart';
import 'package:zain_alhuda/features/quran/presentation/widgets/juz_text_widget.dart';

class JuzListView extends StatelessWidget {
  const JuzListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          defaultColumnWidth: const IntrinsicColumnWidth(),
          border: TableBorder.all(width: 1),
          columnWidths: const {
            0: FlexColumnWidth(.75),
            1: FlexColumnWidth(4.3),
            2: FlexColumnWidth(1.5),
            3: FlexColumnWidth(2.1),
            4: FlexColumnWidth(4.6),
          },
          children: const [
            TableRow(children: [
              TableCell(
                  child: SizedBox(
                height: 30,
                child: JuzTextWidget(
                  text: 'م',
                  isHeader: true,
                ),
              )),
              TableCell(
                  child: JuzTextWidget(
                text: 'اسم الجزء',
                isHeader: true,
              )),
              TableCell(
                  child: JuzTextWidget(
                text: 'الصفحة',
                isHeader: true,
              )),
              TableCell(
                  child: JuzTextWidget(
                text: 'السورة',
                isHeader: true,
              )),
              TableCell(
                  child: JuzTextWidget(
                text: 'بداية الجزء',
                isHeader: true,
              )),
            ])
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              defaultColumnWidth: const IntrinsicColumnWidth(),
              border: TableBorder.all(width: 1),
              columnWidths: const {
                0: FlexColumnWidth(.75),
                1: FlexColumnWidth(4.3),
                2: FlexColumnWidth(1.5),
                3: FlexColumnWidth(2.1),
                4: FlexColumnWidth(4.6),
              },
              children: [
                ...List.generate(
                  juzData.length,
                  (index) => TableRow(
                    decoration: BoxDecoration(
                      color: index % 2 == 0 ? Colors.white : AppColors.secondColor,
                    ),
                    children: [
                      GestureDetector(
                        onTap: () {
                          CustomeNavigate.navigate(context, '/quran', extra: juzData[index]['pageNumber']);
                        },
                        child: TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: SizedBox(
                            height: 30,
                            child: JuzTextWidget(
                              text: juzData[index]['juzNumber'].toString(),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            CustomeNavigate.navigate(context, '/quran', extra: juzData[index]['pageNumber']);
                          },
                          child: TableCell(
                              verticalAlignment: TableCellVerticalAlignment.middle,
                              child: JuzTextWidget(
                                text: convertToArabicRank(juzData[index]['juzNumber'])!,
                              ))),
                      GestureDetector(
                          onTap: () {
                            CustomeNavigate.navigate(context, '/quran', extra: juzData[index]['pageNumber']);
                          },
                          child: TableCell(
                              verticalAlignment: TableCellVerticalAlignment.middle,
                              child: JuzTextWidget(
                                text: juzData[index]['pageNumber'].toString(),
                              ))),
                      TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: JuzTextWidget(
                            text: juzData[index]['surah'].toString(),
                          )),
                      TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: JuzTextWidget(
                            text: juzData[index]['firstWord'].toString(),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
