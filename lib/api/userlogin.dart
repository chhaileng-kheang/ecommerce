class User {
  final String status;
  final List<UserData> data;

  User({required this.status, required this.data});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      status: json['status'],
      data: List<UserData>.from(json['data'].map((x) => UserData.fromJson(x))),
    );
  }
}

class UserData {
  final String loginAccess;
  final String userId;

  UserData({required this.loginAccess, required this.userId});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      loginAccess: json['loginAccess'],
      userId: json['userid'],
    );
  }
}