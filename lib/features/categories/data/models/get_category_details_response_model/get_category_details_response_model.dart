import 'data.dart';

class GetCategoryDetailsResponseModel {
  bool? status;
  dynamic message;
  Data? data;

  GetCategoryDetailsResponseModel({this.status, this.message, this.data});

  factory GetCategoryDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    return GetCategoryDetailsResponseModel(
      status: json['status'] as bool?,
      message: json['message'] as dynamic,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };
}
