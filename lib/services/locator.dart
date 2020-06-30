import 'package:tunein/services/layout.dart';
import 'package:tunein/services/musicService.dart';
import 'package:tunein/services/themeService.dart';
import 'package:get_it/get_it.dart';


GetIt locator = new GetIt();

void setupLocator() {
  locator.registerSingleton(MusicService());
  locator.registerSingleton(ThemeService());
  locator.registerSingleton(LayoutService());

}