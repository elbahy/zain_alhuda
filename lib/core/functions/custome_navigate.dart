import 'package:go_router/go_router.dart';

class CustomeNavigate {
  static void navigate(context, String routeName, {Object? extra}) {
    GoRouter.of(context).push(routeName, extra: extra);
  }

  static void replace(context, String routeName, {Object? extra}) {
    GoRouter.of(context).push(routeName, extra: extra);
  }
}
