import 'package:flutter/material.dart';
import 'package:zain_alhuda/core/functions/convert_number_to_arabic.dart';
import 'package:zain_alhuda/core/functions/custome_navigate.dart';
import 'package:zain_alhuda/features/quran/data/models/juz_model.dart';

class JuzListView extends StatelessWidget {
  const JuzListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        defaultColumnWidth: const IntrinsicColumnWidth(),
        border: TableBorder.all(width: 1),
        // columnWidths: const {
        //   0: FlexColumnWidth(1),
        //   1: FlexColumnWidth(4),
        //   2: FlexColumnWidth(2),
        //   3: FlexColumnWidth(2),
        //   4: FlexColumnWidth(4),
        // },
        children: [
          const TableRow(children: [
            TableCell(
                child: Text(
              'م',
              textAlign: TextAlign.center,
            )),
            TableCell(child: Text('اسم الجزء', textAlign: TextAlign.center)),
            TableCell(child: Text(' الصفحة', textAlign: TextAlign.center)),
            TableCell(child: Text('السورة', textAlign: TextAlign.center)),
            TableCell(child: Text('أول كلمة', textAlign: TextAlign.center)),
          ]),
          ...List.generate(
            juzData.length,
            (index) => TableRow(
              children: [
                GestureDetector(
                  onTap: () {
                    CustomeNavigate.navigate(context, '/quran', extra: juzData[index]['pageNumber']);
                  },
                  child: TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Text(juzData[index]['juzNumber'].toString(), textAlign: TextAlign.center),
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      CustomeNavigate.navigate(context, '/quran', extra: juzData[index]['pageNumber']);
                    },
                    child: TableCell(verticalAlignment: TableCellVerticalAlignment.middle, child: Text(convertToArabicRank(juzData[index]['juzNumber'])!, textAlign: TextAlign.center))),
                GestureDetector(
                    onTap: () {
                      CustomeNavigate.navigate(context, '/quran', extra: juzData[index]['pageNumber']);
                    },
                    child: TableCell(verticalAlignment: TableCellVerticalAlignment.middle, child: Text(juzData[index]['pageNumber'].toString(), textAlign: TextAlign.center))),
                TableCell(verticalAlignment: TableCellVerticalAlignment.middle, child: Text(juzData[index]['surah'].toString(), textAlign: TextAlign.center)),
                TableCell(verticalAlignment: TableCellVerticalAlignment.middle, child: Text(juzData[index]['firstWord'].toString(), textAlign: TextAlign.center)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
