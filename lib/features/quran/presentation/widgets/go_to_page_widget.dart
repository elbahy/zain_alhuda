import 'package:flutter/material.dart';
import 'package:zain_alhuda/core/databases/cache/cache_helper.dart';
import 'package:zain_alhuda/core/functions/custome_navigate.dart';
import 'package:zain_alhuda/core/services/service_locator.dart';
import 'package:zain_alhuda/core/utils/app_styles.dart';

Future<dynamic> goToPage(BuildContext context, TextEditingController goToPageController) {
  return showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          content: TextField(
            controller: goToPageController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(12),
                hintText: 'ادخل رقم الصفحة',
                hintStyle: AppStyles.elmisri500Size16,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                )),
            onChanged: (value) {
              // التحقق من أن القيمة المدخلة هي أرقام فقط
              if (!RegExp(r'^[0-9]*$').hasMatch(value)) {
                // إذا كانت القيمة تحتوي على أحرف غير رقمية، إعادة النص القديم
                goToPageController.text = value.replaceAll(RegExp(r'[^0-9]'), '');
                // تحريك المؤشر إلى نهاية النص
                goToPageController.selection = TextSelection.fromPosition(
                  TextPosition(offset: goToPageController.text.length),
                );
              } else {
                // التحقق من أن القيمة لا تتجاوز 604
                int intValue = int.tryParse(value) ?? 0;
                if (intValue > 604) {
                  goToPageController.text = '604';
                  // تحريك المؤشر إلى نهاية النص
                  goToPageController.selection = TextSelection.fromPosition(
                    TextPosition(offset: goToPageController.text.length),
                  );
                }
              }
            },
          ),
          actions: [
            TextButton.icon(
                onPressed: () {
                  CustomeNavigate.replace(context, '/quran', extra: int.tryParse(goToPageController.text) ?? getIt<CacheHelper>().getData(key: 'lastQuranPage'));
                },
                icon: const Icon(Icons.arrow_forward),
                label: const Text(
                  'انتقال',
                  style: AppStyles.elmisri500Size16,
                ))
          ],
        );
      });
}
