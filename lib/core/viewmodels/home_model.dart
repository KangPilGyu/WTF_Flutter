import 'package:wtf_main/core/models/user.dart';
import 'package:wtf_main/core/services/db_service.dart';

import '../../locator.dart';
import '../enum/viewstate.dart';
import '../models/post.dart';
import '../services/post_service.dart';
import 'base_model.dart';

class HomeModel extends BaseModel {
  PostService _postService = locator<PostService>();
  DBService _dbService = locator<DBService>();

  List<Post> get posts => _postService.posts;
  User displayUser = User.initial();

  Future gePosts(int userId) async {
    setState(ViewState.Busy);
    await _postService.getPostsForUser(userId);
    setState(ViewState.Idle);
  }

  Future createUser(User user) async {
    var result = await _dbService.createUser(user);
    return result;
  }

  Future getUser(userId) async {
    User result = await _dbService.getUser(userId);
    print(result.name.toString());
    print(result.id.toString());
    displayUser = result;
    notifyListeners();
    return result;
  }
}
