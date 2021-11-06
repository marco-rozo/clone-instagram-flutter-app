class PostModel {
  dynamic id;
  dynamic name;
  dynamic profileImg;
  dynamic postImg;
  bool? isLoved;
  dynamic likedBy;
  dynamic likedCount;
  dynamic caption;
  dynamic commentCount;
  dynamic timeAgo;

  PostModel({
      this.id,
      this.name,
      this.profileImg,
      this.postImg,
      this.isLoved,
      this.likedBy,
      this.likedCount,
      this.caption,
      this.commentCount,
      this.timeAgo
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json["id"],
      name: json["name"],
      profileImg: json["profileImg"],
      postImg: json["postImg"],
      isLoved: json["isLoved"],
      likedBy: json["likedBy"],
      likedCount: json["likedCount"],
      caption: json["caption"],
      commentCount: json["commentCount"],
      timeAgo: json["timeAgo"],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'profileImg': profileImg,
    'postImg': postImg,
    'isLoved': isLoved,
    'likedBy': likedBy,
    'likedCount': likedCount,
    'caption': caption,
    'commentCount': commentCount,
    'timeAgo': timeAgo,
  };

}
