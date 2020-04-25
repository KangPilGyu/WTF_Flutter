import '../../locator.dart';
import '../enum/viewstate.dart';
import '../models/post.dart';
import '../services/post_service.dart';
import 'base_model.dart';

class HomeModel extends BaseModel {
  PostService _postService = locator<PostService>();

  List<Post> get posts => _postService.posts;

  Future gePosts(int userId) async {
    setState(ViewState.Busy);
    await _postService.getPostsForUser(userId);
    setState(ViewState.Idle);
  }
}
