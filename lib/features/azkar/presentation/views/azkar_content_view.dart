import 'package:flutter/material.dart';
import 'package:zain_alhuda/core/widgets/app_bar_space.dart';
import 'package:zain_alhuda/features/azkar/data/models/azkar_model.dart';
import 'package:zain_alhuda/features/azkar/presentation/widgets/azkar_content_item.dart';

class AzkarContentView extends StatefulWidget {
  const AzkarContentView({super.key, required this.data});

  final Datum data;

  @override
  State<AzkarContentView> createState() => _AzkarContentViewState();
}

class _AzkarContentViewState extends State<AzkarContentView> {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.data.title),
        flexibleSpace: const AppBarSpace(),
      ),
      body: AnimatedList(
        key: listKey,
        itemBuilder: (BuildContext context, int index, Animation<double> animation) {
          final azkarItem = widget.data.content[index];
          int count = azkarItem.repeat;

          return GestureDetector(
            onTap: () {
              setState(() {
                if (count > 1) {
                  // إنشاء نسخة جديدة من العنصر مع تحديث قيمة repeat
                  final updatedItem = azkarItem.copyWith(repeat: count - 1);
                  widget.data.content[index] = updatedItem;
                } else {
                  final removedItem = widget.data.content.removeAt(index);
                  listKey.currentState!.removeItem(index, (context, animation) {
                    return SlideTransition(
                      position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero).animate(animation),
                      child: Center(
                        child: AzkarContentItem(
                          repeat: removedItem.repeat,
                          zakr: removedItem.zekr,
                        ),
                      ),
                    );
                  });
                }
              });
            },
            child: Center(
              child: AzkarContentItem(
                repeat: count,
                zakr: azkarItem.zekr,
              ),
            ),
          );
        },
        initialItemCount: widget.data.content.length,
      ),
    );
  }
}
