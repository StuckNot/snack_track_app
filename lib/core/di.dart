import 'package:get_it/get_it.dart';
import 'package:profile_data/profile_data.dart';
import 'package:profile_domain/profile_domain.dart';

Future<void> setupDependencies() async {
  final sl = GetIt.instance;

  registerProfileDomainDependencies(sl);
  registerProfileDataDependencies(sl);

}
