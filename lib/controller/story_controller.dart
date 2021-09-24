import 'dart:convert';
import 'package:clone_instagram/models/story_model.dart';

class StoryController {
  // Future<StoryModel> getLink() async {
  //   StoryModel dadosJson = StoryModel.fromJson(json);
  //   return dadosJson;
  // }
  Future<List<StoryModel>> getStory() async {
    List<StoryModel> dadosJson = jsonDecode(jsonEncode(json)).map<StoryModel>((map) {
      return StoryModel.fromJson(map);
    }).toList();
    return dadosJson;
  }

  var json = [
    {
      "id": 1,
      "img": "https://scontent.ffbe2-1.fna.fbcdn.net/v/t1.6435-9/46193022_1176884289146140_3022185224235646976_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=8bfeb9&_nc_ohc=YjAqcJogWtYAX8byc0G&_nc_ht=scontent.ffbe2-1.fna&oh=23e6687abe3a6a3253178561abbc485f&oe=615FC285",
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
}
