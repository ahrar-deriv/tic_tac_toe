class SignUpRequestModel {
  final String username;
  final String password;
  final int score;

  SignUpRequestModel({
    required this.username,
    required this.password,
    required this.score,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'score': score,
    };
  }

  factory SignUpRequestModel.fromJson(Map<String, dynamic> json) =>
      SignUpRequestModel(
          username: json['username'],
          password: json['password'],
          score: json['score']);
}
