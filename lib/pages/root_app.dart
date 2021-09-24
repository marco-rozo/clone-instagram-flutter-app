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
                                  colors: storyBorderColor)),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Container(
                              width: 65,
                              height: 65,
                              decoration: BoxDecoration(
                                  border: Border.all(color: black, width: 2),
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
                    }),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(child: Divider(color: grey))
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 15, left: 16),
                        child: Row(
                          children: [
                            Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: storyBorderColor)),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: black, width: 1),
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            "https://images.unsplash.com/profile-1561622789185-efac0f40a024?dpr=1&auto=format&fit=crop&w=150&h=150&q=60&crop=faces&bg=fff",
                                          ),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text("davidboca", style: TextStyle(color: white))
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: Icon(
                                  InstagramAppIcons.option_three,
                                  color: white,
                                ),
                                onPressed: () {},
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 400,
                    decoration: BoxDecoration(
                      border: Border.all(color: black, width: 1),
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      image: DecorationImage(
                          image: NetworkImage(
                            "https://images.unsplash.com/photo-1593421189588-d6d731b5749f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=701&q=80",
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 15, left: 16, top: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(InstagramAppIcons.love_icon, color: white),
                            SizedBox(width: 8),
                            Icon(InstagramAppIcons.comment_icon, color: white),
                            SizedBox(width: 8),
                            Icon(InstagramAppIcons.message_icon, color: white),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: 15, left: 16, top: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(InstagramAppIcons.save_icon, color: white),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding:
                              EdgeInsets.only(right: 15, left: 16, top: 12),
                          child: Text(
                            "11.593 curtidas",
                            style: TextStyle(color: white, fontWeight: FontWeight.w600, fontSize: 14),
                          )),
                    ],
                  )
                ],
              ),
            )
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
