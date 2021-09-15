import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injectable.config.dart';

final getItInstance = GetIt.instance;

@injectableInit
GetIt configureDependencies() => $initGetIt(getItInstance);
