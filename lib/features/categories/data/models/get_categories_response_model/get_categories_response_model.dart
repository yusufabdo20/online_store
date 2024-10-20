import 'data.dart';

class GetCategoriesResponseModel {
  bool? status;
  dynamic message;
  Data? data;

  GetCategoriesResponseModel({this.status, this.message, this.data});

  factory GetCategoriesResponseModel.fromJson(json) {
    return GetCategoriesResponseModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] == null ? null : Data.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };
}
