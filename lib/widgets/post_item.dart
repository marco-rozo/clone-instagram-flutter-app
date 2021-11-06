import 'package:clone_instagram/theme/InstagramAppIcons_icons.dart';
import 'package:clone_instagram/theme/colors.dart';
import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {

  final String? name;
  final String? profileImg;
  final String? postImg;
  final bool? isLoved;
  final String? likedBy;
  final String? likedCount;
  final String? caption;
  final String? commentCount;
  final String? timeAgo;

  const PostItem({
    Key? key,
    this.name,
    this.profileImg,
    this.postImg,
    this.isLoved,
    this.likedBy,
    this.likedCount,
    this.caption,
    this.commentCount,
    this.timeAgo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      //perfil
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
                          colors: circleProfileImgBorderColor)),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: black, width: 1),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                profileImg!,
                              ),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(name!, style: TextStyle(color: white))
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
      //post
      Container(
        width: MediaQuery.of(context).size.width,
        height: 400,
        decoration: BoxDecoration(
          border: Border.all(color: black, width: 1),
          shape: BoxShape.rectangle,
          color: Colors.white,
          image: DecorationImage(
              image: NetworkImage(
                postImg!,
              ),
              fit: BoxFit.cover),
        ),
      ),
      //icones
      Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 15, left: 16, top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                isLoved! ? Icon(InstagramAppIcons.loved_icon, color: redLoved): Icon(InstagramAppIcons.love_icon, color: white),
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
      //informações
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 15, left: 16, top: 12),
                child: Text(
                  "$likedCount curtidas",
                  style: TextStyle(
                      color: white, fontWeight: FontWeight.w600, fontSize: 14),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(right: 15, left: 16, top: 2),
                  child: Row(
                    children: [
                      Text(
                        "$name",
                        style: TextStyle(
                            color: white, fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                      Text(
                        "$caption",
                        style: TextStyle(
                            color: white, fontWeight: FontWeight.w400, fontSize: 14),
                      ),
                    ],
                  )
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(right: 15, left: 16, top: 2),
                  child: Text(
                    "Ver todos os $commentCount comentários",
                    style: TextStyle(
                        color: grey, fontWeight: FontWeight.w400, fontSize: 14),
                  ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(right: 15, left: 16, top: 4, bottom: 12),
                  child: Text(
                    "Há $timeAgo",
                    style: TextStyle(
                        color: grey, fontWeight: FontWeight.w400, fontSize: 11),
                  ),
              ),
            ],
          ),
        ],
      )
    ]);
  }

}