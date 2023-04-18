class User {
  int? id;
  int? score;
  String? createdAt;
  String? username;
  User({this.id, this.score, this.createdAt, this.username});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    score = json['score'];
    createdAt = json['createdAt'];
    username = json['username'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['score'] = score;
    data['createdAt'] = createdAt;
    data['username'] = username;
    return data;
  }
}
