import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final int statusCode;
  final String statusMessage;

  const ErrorMessageModel(this.statusCode, this.statusMessage);

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) =>
      ErrorMessageModel(
          json["status"],
          json["message"]);

  @override
  List<Object?> get props => [
    statusCode,
    statusMessage
  ];
}