import 'package:flutter/material.dart';
import 'package:wtf_main/core/viewmodels/app_setting_model.dart';
import 'package:wtf_main/ui/shared/app_themes.dart';
import '../../core/enum/viewstate.dart';
import '../../core/models/user.dart';
import '../../core/viewmodels/home_model.dart';
import '../shared/text_styles.dart';
import '../shared/ui_helpers.dart';
import 'base_view.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppSettingModel appSettingModel = Provider.of<AppSettingModel>(context);
    User user = Provider.of<User>(context);
    return BaseView<HomeModel>(
      onModelReady: (model) => model.gePosts(user.id),
      builder: (BuildContext context, HomeModel model, Widget child) =>
          Scaffold(
            body: model.state == ViewState.Busy
                ? Center(
              child: CircularProgressIndicator(),
            )
                : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                UIHelper.verticalSpaceLarge(),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Welcome ${user.name}',
                    style: headerStyle,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Here are all your posts',
                    style: subHeaderStyle,
                  ),
                ),
                UIHelper.verticalSpaceSmall(),
                Row(
                  children: <Widget>[
                    RaisedButton(
                      child: Text("PinkLight"),
                      onPressed: () => appSettingModel.changeAppTheme(AppTheme.PinkLight),
                    ),
                    RaisedButton(
                      child: Text("PinkDark"),
                      onPressed: () => appSettingModel.changeAppTheme(AppTheme.PinkDark),
                    ),
                  ],
                )
              ],
            ),
          ),
    );
  }
}



//class HomeView extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    User user = Provider.of<User>(context);
//    return BaseView<HomeModel>(
//      onModelReady: (model) => model.gePosts(user.id),
//      builder: (BuildContext context, HomeModel model, Widget child) =>
//          Scaffold(
//        backgroundColor: backgroundColor,
//        body: model.state == ViewState.Busy
//            ? Center(
//                child: CircularProgressIndicator(),
//              )
//            : Column(
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: <Widget>[
//                  UIHelper.verticalSpaceLarge(),
//                  Padding(
//                    padding: EdgeInsets.only(left: 20),
//                    child: Text(
//                      'Welcome ${user.name}',
//                      style: headerStyle,
//                    ),
//                  ),
//                  Padding(
//                    padding: EdgeInsets.only(left: 20),
//                    child: Text(
//                      'Here are all your posts',
//                      style: subHeaderStyle,
//                    ),
//                  ),
//                  UIHelper.verticalSpaceSmall(),
//                  Expanded(
//                    child: _getPostUi(model.posts),
//                  )
//                ],
//              ),
//      ),
//    );
//  }
//
//  Widget _getPostUi(List<Post> posts) => ListView.builder(
//        itemCount: posts.length,
//        itemBuilder: (BuildContext context, int index) => PostListItem(
//          post: posts[index],
//          onTap: () {
//            Navigator.pushNamed(context, '/post', arguments: posts[index]);
//          },
//        ),
//      );
//}
