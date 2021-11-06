import 'package:clone_instagram/controller/post_controller.dart';
import 'package:clone_instagram/controller/story_controller.dart';
import 'package:clone_instagram/models/post_model.dart';
import 'package:clone_instagram/models/story_model.dart';
import 'package:clone_instagram/service/theme_service.dart';
import 'package:clone_instagram/theme/colors.dart';
import 'package:clone_instagram/theme/InstagramAppIcons_icons.dart';
import 'package:clone_instagram/widgets/post_item.dart';
import 'package:clone_instagram/widgets/story_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> with StoryController{

  StoryController storyController = StoryController();
  PostController postController = PostController();

  List<StoryModel> stories = [];
  List<PostModel> posts = [];
  _getStories() {
    storyController.getStory().then((value) async {
      setState(() {
        stories = value;
      });
    });
  }
  _getPosts() {
    postController.getPosts().then((value) async {
      setState(() {
        posts = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 10), () {
      setState(() {
        _getStories();
        _getPosts();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: getAppBar(context)
      ),
      bottomNavigationBar: getFooter(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 15, left: 8, bottom: 10, top: 8),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 68,
                          height: 68,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: circleProfileImgBorderColor)),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Container(
                              width: 65,
                              height: 65,
                              decoration: BoxDecoration(
                                  border: Border.all(color: context.theme.backgroundColor, width: 2),
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        profile,
                                      ),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          width: 70,
                          child: Text(
                            name,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: List.generate(stories.length, (index) {
                      return StoryItem(
                        img: stories[index].img,
                        name: stories[index].name,
                      );
                    }),
                  ),
                ],
              ),
            ),
            // Row(
            //   children: [
            //     Expanded(child: Divider(color: grey, height: 0.0001,))
            //   ],
            // ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: List.generate(posts.length, (index) {
                  return Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: PostItem(
                          name: posts[index].name,
                          profileImg: posts[index].profileImg,
                          postImg: posts[index].postImg,
                          isLoved: posts[index].isLoved,
                          caption: posts[index].caption,
                          likedBy: posts[index].likedBy,
                          likedCount: posts[index].likedCount,
                          commentCount: posts[index].commentCount,
                          timeAgo: posts[index].timeAgo)
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget getFooter(BuildContext context) {
  return Container(
    width: double.infinity,
    height: 80,
    child: Row(
      children: [
        Flexible(
          child: Center(
              child: IconButton(
            icon: Icon(InstagramAppIcons.home_active_icon),
            onPressed: () {},
          )),
        ),
        Flexible(
          child: Center(
              child: IconButton(
            icon: Icon(InstagramAppIcons.search_icon),
            onPressed: () {},
          )),
        ),
        Flexible(
          child: Center(
              child: IconButton(
            icon: Icon(InstagramAppIcons.reels_icon),
            onPressed: () {},
          )),
        ),
        Flexible(
          child: Center(
            child: IconButton(
              icon: Icon(InstagramAppIcons.love_icon),
              onPressed: () {},
            ),
          ),
        ),
        Flexible(
          child: Center(
              child: IconButton(
            icon: Icon(InstagramAppIcons.account_icon),
                onPressed: () {
                  PopupMenuButton(
                    icon: Icon(Icons.more_vert),
                    itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                      const PopupMenuItem(
                        child: ListTile(
                          leading: Icon(Icons.add),
                          title: Text('Item 1'),
                        ),
                      ),
                      const PopupMenuItem(
                        child: ListTile(
                          leading: Icon(Icons.anchor),
                          title: Text('Item 2'),
                        ),
                      ),
                      const PopupMenuItem(
                        child: ListTile(
                          leading: Icon(Icons.article),
                          title: Text('Item 3'),
                        ),
                      ),
                      const PopupMenuDivider(),
                      const PopupMenuItem(child: Text('Item A')),
                      const PopupMenuItem(child: Text('Item B')),
                    ],
                  );
                })),
        ),
      ],
    ),
  );
}

Widget getAppBar(BuildContext context){
  final isDarkTheme = ThemeService().getTheme();

    return AppBar(
      bottomOpacity: 0.0,
      elevation: 0.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(InstagramAppIcons.Instagram_logo, size: 42),
          Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(isDarkTheme ? Icons.light_mode_outlined : Icons.dark_mode_outlined),
                onPressed: ThemeService().switchTheme
                  // print(_box.read(_key));
              ),
              Padding(
                padding: EdgeInsets.only(left: 18),
                child: Icon(InstagramAppIcons.upload_icon, size: 24),
              ),
              Padding(
                padding: EdgeInsets.only(left: 18),
                child: Icon(InstagramAppIcons.love_icon, size: 24),
              ),
              Padding(
                padding: EdgeInsets.only(left: 18),
                child: Icon(InstagramAppIcons.messenger_facebook, size: 26),
              ),
            ],
          ),
        )
      ],
    ),
    );
}
