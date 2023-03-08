class UserAuthModel {
  bool? success;
  String? message;
  int? idUser;
  String? username;
  String? email;
  String? role;
  String? token;

  UserAuthModel(
      {this.success,
        this.message,
        this.idUser,
        this.username,
        this.email,
        this.role,
        this.token});

  UserAuthModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    idUser = json['id_user'];
    username = json['username'];
    email = json['email'];
    role = json['role'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['id_user'] = this.idUser;
    data['username'] = this.username;
    data['email'] = this.email;
    data['role'] = this.role;
    data['token'] = this.token;
    return data;
  }
}