import '../../locator.dart';
import '../services/post_service.dart';
import 'base_model.dart';

class LikeButtonModel extends BaseModel {
  PostService _postService = locator<PostService>();

  int postLikes(int postId) {
    return _postService.posts.firstWhere((post) => post.id == postId).likes;
  }

  void increaseLikes(int postId) {
    _postService.incrementLikes(postId);
    notifyListeners();
  }
}
