class StoryModel {
  dynamic id;
  dynamic img;
  dynamic name;
  bool? verified;

  StoryModel({this.id, this.img, this.name, this.verified});

  factory StoryModel.fromJson(Map<String, dynamic> json) {
    return StoryModel(id: json["id"], img: json["img"], name: json["name"], verified: json["verified"],);
  }

  Map<String, dynamic> toJson() => {'id': id, 'img': img, 'name': name, 'verified': verified };
}
