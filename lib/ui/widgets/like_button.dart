import 'package:flutter/material.dart';

import '../../core/viewmodels/likebutton_model.dart';
import '../views/base_view.dart';


class LikeButton extends StatelessWidget {
  final int postId;
  const LikeButton({Key key, this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LikeButtonModel>(
      builder: (BuildContext context, LikeButtonModel model, Widget child) =>
          Row(
        children: <Widget>[
          Text('Likes ${model.postLikes(postId)}'),
          MaterialButton(
            color: Colors.white,
            child: Icon(Icons.thumb_up),
            onPressed: () {
              model.increaseLikes(postId);
            },
          )
        ],
      ),
    );
  }
}
