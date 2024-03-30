import 'package:go_router/go_router.dart';

class CustomeNavigate {
  static void navigate({required context, required String screen}) {
    GoRouter.of(context).push(screen);
  }

  static void replace({required context, required String screen}) {
    GoRouter.of(context).push(screen);
  }
}
