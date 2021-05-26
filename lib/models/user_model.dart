class UserModel {
  final String userId;
  final String fullName;
  final String emailId;
  final String profileURL;

  UserModel(
      {required this.userId,
      required this.fullName,
      required this.emailId,
      this.profileURL = ''});

  Map<String, dynamic> toJson() {
    return ({
      'userId': userId,
      'fullName': fullName,
      'emailId': emailId,
      'profileImage': profileURL
    });
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        userId: json['userId'] as String,
        fullName: json['fullName'] as String,
        emailId: json['emailId'] as String,
        profileURL: json['profileImage'] as String);
  }
}
