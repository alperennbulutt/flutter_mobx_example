import 'package:mobx/mobx.dart';
part 'weather_store.g.dart';

class WatherStore = _WatherStoreBase with _$WatherStore;

abstract class _WatherStoreBase with Store {}
