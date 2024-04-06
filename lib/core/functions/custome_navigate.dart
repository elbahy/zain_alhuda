import 'dart:async';

import 'package:go_router/go_router.dart';

class CustomeNavigate {
  static void navigate(context, String routeName,
      {Object? extra, FutureOr<dynamic> Function(Object?)? then}) {
    GoRouter.of(context).push(routeName, extra: extra).then(then ?? (value) {});
  }

  static void replace(context, String routeName,
      {Object? extra, FutureOr<dynamic> Function(Object?)? then}) {
    GoRouter.of(context)
        .pushReplacement(routeName, extra: extra)
        .then(then ?? (value) {});
  }
}
