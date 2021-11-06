import 'dart:convert';
import 'package:clone_instagram/models/story_model.dart';

class StoryController {
  // Future<StoryModel> getLink() async {
  //   StoryModel dadosJson = StoryModel.fromJson(json);
  //   return dadosJson;
  // }
  Future<List<StoryModel>> getStory() async {
    List<StoryModel> dadosJson = jsonDecode(jsonEncode(storyJson)).map<StoryModel>((map) {
      return StoryModel.fromJson(map);
    }).toList();
    return dadosJson;
  }

  var storyJson = [
    {
      "id": 1,
      "img": "https://images.unsplash.com/photo-1513360371669-4adf3dd7dff8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80",
      "name": "mayanawillemann"
    },
    {
      "id": 2,
      "img": "https://www.propatel.com/wp-content/uploads/2019/09/coding-and-testing-programming-of-software.jpg",
      "name": "girl.coding"
    },
    {
      "id": 3,
      "img": "https://yt3.ggpht.com/ytc/AKedOLS2Ze7uCowTGXg1DZ688_kSmTZIe4L-QCaxNjCXwg=s900-c-k-c0x00ffffff-no-rj",
      "name": "coisadenerd",
      "verified": true
    },
    {
      "id": 4,
      "img": "https://yt3.ggpht.com/ytc/AKedOLTWi01AyVx6BphGB23N7NJ4dkKwFcKaLwWCAaBr=s900-c-k-c0x00ffffff-no-rj",
      "name": "tiger_codes"
    },
    {
      "id": 5,
      "img": "https://www.cnnbrasil.com.br/wp-content/uploads/2021/06/21995_47022457A67E1FF5.jpg",
      "name": "neymarjr",
      "verified": true
    },
    {
      "id": 6,
      "img": "https://pt.psg.fr/img/DefaultOpenGraphImage.jpg?2019",
      "name": "psg",
      "verified": true
    },
  ];
  // user profile

  String profile = "https://avatars.githubusercontent.com/u/69606427?v=4";
// String name = "marco_rozo";
  String name = "Seu Story";
}
