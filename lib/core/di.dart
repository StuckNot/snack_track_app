import 'package:get_it/get_it.dart';
import 'package:profile/profile.dart';

Future<void> setupDependencies() async {
  final sl = GetIt.instance;

  registerProfileDependencies(sl);

}
