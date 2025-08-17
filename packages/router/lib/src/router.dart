import 'package:authenticate/authenticate.dart';
import 'package:auto_route/auto_route.dart';

part 'router.gr.dart';


@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    ...AuthenticateRouter().routes
  ];
}
