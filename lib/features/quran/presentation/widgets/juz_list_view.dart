import 'package:flutter/material.dart';
import 'package:zain_alhuda/core/functions/convert_number_to_arabic.dart';
import 'package:zain_alhuda/core/functions/custome_navigate.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';
import 'package:zain_alhuda/core/utils/app_styles.dart';
import 'package:zain_alhuda/features/quran/data/models/juz_model.dart';

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
            1: FlexColumnWidth(4.25),
            2: FlexColumnWidth(1.75),
            3: FlexColumnWidth(2.2),
            4: FlexColumnWidth(4.25),
          },
          children: [
            TableRow(children: [
              const TableCell(
                  child: Text(
                'م',
                textAlign: TextAlign.center,
              )),
              const TableCell(
                  child: Text(
                'اسم الجزء',
                textAlign: TextAlign.center,
                style: AppStyles.elmisri500Size16,
              )),
              TableCell(child: Text('الصفحة', textAlign: TextAlign.center, style: AppStyles.elmisri500Size16.copyWith(color: AppColors.thirdColor))),
              const TableCell(child: Text('السورة', textAlign: TextAlign.center, style: AppStyles.elmisri500Size16)),
              const TableCell(child: Text('أول كلمة', textAlign: TextAlign.center, style: AppStyles.elmisri500Size16)),
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
                1: FlexColumnWidth(4.5),
                2: FlexColumnWidth(1.75),
                3: FlexColumnWidth(2.1),
                4: FlexColumnWidth(4.5),
              },
              children: [
                ...List.generate(
                  juzData.length,
                  (index) => TableRow(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    children: [
                      GestureDetector(
                        onTap: () {
                          CustomeNavigate.navigate(context, '/quran', extra: juzData[index]['pageNumber']);
                        },
                        child: TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Text(juzData[index]['juzNumber'].toString(), textAlign: TextAlign.center, style: AppStyles.elmisri500Size16),
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            CustomeNavigate.navigate(context, '/quran', extra: juzData[index]['pageNumber']);
                          },
                          child: TableCell(verticalAlignment: TableCellVerticalAlignment.middle, child: Text(convertToArabicRank(juzData[index]['juzNumber'])!, textAlign: TextAlign.center, style: AppStyles.elmisri500Size16))),
                      GestureDetector(
                          onTap: () {
                            CustomeNavigate.navigate(context, '/quran', extra: juzData[index]['pageNumber']);
                          },
                          child: TableCell(verticalAlignment: TableCellVerticalAlignment.middle, child: Text(juzData[index]['pageNumber'].toString(), textAlign: TextAlign.center, style: AppStyles.elmisri500Size16))),
                      TableCell(verticalAlignment: TableCellVerticalAlignment.middle, child: Text(juzData[index]['surah'].toString(), textAlign: TextAlign.center, style: AppStyles.elmisri500Size16)),
                      TableCell(verticalAlignment: TableCellVerticalAlignment.middle, child: Text(juzData[index]['firstWord'].toString(), textAlign: TextAlign.center, style: AppStyles.elmisri500Size16)),
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
