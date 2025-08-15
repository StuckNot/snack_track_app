import 'package:authenticate/authenticate.dart';
import 'package:auto_route/auto_route.dart';

part 'authenticate_router.gr.dart';

@AutoRouterConfig()
class AuthenticateRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoginRoute.page),
  ];
}
