import 'core/services/api.dart';
import 'core/services/authentication_service.dart';
import 'core/services/post_service.dart';
import 'core/viewmodels/comments_model.dart';
import 'core/viewmodels/home_model.dart';
import 'core/viewmodels/likebutton_model.dart';
import 'core/viewmodels/login_model.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => PostService());
  locator.registerLazySingleton(() => Api());

  locator.registerLazySingleton(() => LoginModel());
  locator.registerFactory(() => HomeModel());
  locator.registerFactory(() => LikeButtonModel());
  locator.registerFactory(() => CommentsModel());
}
