import 'data.dart';

class GetCategoriesResponseModel {
  bool? status;
  dynamic message;
  Data? data;

  GetCategoriesResponseModel({this.status, this.message, this.data});

  factory GetCategoriesResponseModel.fromJson(Map<String, dynamic> json) {
    return GetCategoriesResponseModel(
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
