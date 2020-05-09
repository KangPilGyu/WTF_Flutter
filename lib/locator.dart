import 'core/services/app_setting_service.dart';
import 'core/services/api.dart';
import 'core/services/authentication_service.dart';
import 'core/services/post_service.dart';
import 'core/viewmodels/comments_model.dart';
import 'core/viewmodels/home_model.dart';
import 'core/viewmodels/likebutton_model.dart';
import 'core/viewmodels/login_model.dart';
import 'core/viewmodels/app_setting_model.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AppSettingService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => PostService());
  locator.registerLazySingleton(() => Api());

  locator.registerLazySingleton(() => LoginModel());
  locator.registerLazySingleton(() => AppSettingModel());
  locator.registerFactory(() => HomeModel());
  locator.registerFactory(() => LikeButtonModel());
  locator.registerFactory(() => CommentsModel());
}
