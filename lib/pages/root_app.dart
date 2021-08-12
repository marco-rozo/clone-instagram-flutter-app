import 'package:clone_instagram/controller/story_controller.dart';
import 'package:clone_instagram/data/story_json.dart';
import 'package:clone_instagram/theme/colors.dart';
import 'package:clone_instagram/theme/InstagramAppIcons_icons.dart';
import 'package:clone_instagram/widgets/story_item.dart';
import 'package:flutter/material.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> with StoryController{

  List stories = [];
  _getStories() {
    getStory().then((value) async {
      setState(() {
        stories = value;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getStories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: getAppBar()
      ),
      backgroundColor: black,
      bottomNavigationBar: getFooter(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: <Widget>[
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
                                  colors: storyBorderColor)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Container(
                              width: 65,
                              height: 65,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: black,
                                      width: 2
                                  ),
                                  shape: BoxShape.circle,
                                  image: DecorationImage(image:
                                  NetworkImage(profile,),fit: BoxFit.cover)
                              ),
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
                            style: TextStyle(color: white, fontSize: 14),
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
                  })),
                ],),
            ),
          ],
        ),
      ),
    );
  }
}

Widget getFooter() {
  return Container(
    width: double.infinity,
    height: 80,
    decoration: BoxDecoration(color: black),
    child: Row(
      children: [
        Flexible(
          child: Center(
              child: IconButton(
            icon: Icon(InstagramAppIcons.home_active_icon, color: white),
            onPressed: () {},
          )),
        ),
        Flexible(
          child: Center(
              child: IconButton(
            icon: Icon(InstagramAppIcons.search_icon, color: white),
            onPressed: () {},
          )),
        ),
        Flexible(
          child: Center(
              child: IconButton(
            icon: Icon(InstagramAppIcons.reels_icon, color: white),
            onPressed: () {},
          )),
        ),
        Flexible(
          child: Center(
            child: IconButton(
              icon: Icon(InstagramAppIcons.love_icon, color: white),
              onPressed: () {},
            ),
          ),
        ),
        Flexible(
          child: Center(
              child: IconButton(
            icon: Icon(InstagramAppIcons.account_icon, color: white),
            onPressed: () {},
          )),
        ),
      ],
    ),
  );
}

Widget getAppBar(){
    return AppBar(
      backgroundColor: black,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(InstagramAppIcons.Instagram_logo, size: 42),
          Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
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
                child: Icon(InstagramAppIcons.messenger_facebook, size: 26, color: white,),
              ),
            ],
          ),
        )
      ],
    ),
    );
}
