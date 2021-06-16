class UserClass {
  final String userName;
  final String password;

  UserClass({required this.userName,required  this.password});

  factory UserClass.fromJson(Map<String, dynamic> json) {
    return UserClass(
      userName: json['userName'],
      password: json['password'],
    );
  }
  
}