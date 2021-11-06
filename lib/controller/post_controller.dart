import 'dart:convert';
import 'package:clone_instagram/models/post_model.dart';

class PostController {
  // Future<StoryModel> getLink() async {
  //   StoryModel dadosJson = StoryModel.fromJson(json);
  //   return dadosJson;
  // }
  // user prfile

  Future<List<PostModel>> getPosts() async {
    List<PostModel> dadosJson = jsonDecode(jsonEncode(postJson)).map<
        PostModel>((map) {
      return PostModel.fromJson(map);
    }).toList();
    return dadosJson;
  }

  var postJson = [
    {
      "id": 1,
      "name": "salem_cat",
      "profileImg":
      "https://images.unsplash.com/photo-1542652735873-fb2825bac6e2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
      "postImg":
      "https://images.unsplash.com/photo-1559624989-7b9303bd9792?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=688&q=80",
      "caption": " I'm serious",
      "isLoved": true,
      "commentCount": "10",
      "likedBy": "mayanawilleman",
      "likedCount": "11.459",
      "timeAgo": "1 day ago"
    },
    {
      "id": 2,
      "name": "xiquinho",
      "profileImg":
      "https://images.unsplash.com/photo-1520315342629-6ea920342047?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=880&q=80",
      "postImg":
      "https://images.unsplash.com/photo-1518288774672-b94e808873ff?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=738&q=80",
      "caption":
      " - Quando eu era jovem",
      "isLoved": true,
      "commentCount": "7",
      "likedBy": "mayanawilleman",
      "likedCount": "9.327",
      "timeAgo": "1 day ago"
    },
    {
      "id": 3,
      "name": "petta",
      "profileImg":
      "https://images.unsplash.com/photo-1612288106997-6078c69d5386?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1074&q=80",
      "postImg":
      "https://images.unsplash.com/photo-1633094891290-794956f808cc?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80",
      "caption": " A mimir",
      "isLoved": false,
      "commentCount": "60",
      "likedBy": "mayanawilleman",
      "likedCount": "20.430",
      "timeAgo": "3 day ago"
    },
    {
      "id": 4,
      "name": "davidboca",
      "profileImg":
      "https://images.unsplash.com/profile-1561622789185-efac0f40a024?dpr=1&auto=format&fit=crop&w=150&h=150&q=60&crop=faces&bg=fff",
      "postImg":
      "https://images.unsplash.com/photo-1593421189588-d6d731b5749f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=701&q=80",
      "isLoved": false,
      "commentCount": "42",
      "likedBy": "neymarjr",
      "likedCount": "4.296",
      "timeAgo": "3 day ago"
    }
  ];

}