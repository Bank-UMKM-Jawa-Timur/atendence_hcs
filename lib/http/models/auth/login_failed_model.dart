import 'dart:convert';

LoginFailedModel loginFailedModelFromJson(String str) =>
    LoginFailedModel.fromJson(json.decode(str));

String loginFailedModelToJson(LoginFailedModel data) =>
    json.encode(data.toJson());

class LoginFailedModel {
  int status;
  String message;
  dynamic data;

  LoginFailedModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LoginFailedModel.fromJson(Map<String, dynamic> json) =>
      LoginFailedModel(
        status: json["status"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data,
      };
}
