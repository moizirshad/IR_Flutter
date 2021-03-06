class BaseResponse<T extends Serializable> {
  int statusCode;
  String statusMessage;
  T data;
  Null errorMessage;

  BaseResponse(
      {this.statusCode, this.statusMessage, this.data, this.errorMessage});

  factory BaseResponse.fromJson(
      Map<String, dynamic> json, Function(Map<String, dynamic>) create) {
    return BaseResponse<T>(
      statusCode: json["StatusCode"],
      statusMessage: json["StatusMessage"],
      data: create(json["Data"]),
      errorMessage: json['ErrorMessage'],
    );
  }

  Map<String, dynamic> toJson() => {
        "StatusCode": this.statusCode,
        "StatusMessage": this.statusMessage,
        "Data": this.data?.toJson(),
        "ErrorMessage": this.errorMessage,
      };
}

abstract class Serializable {
  Map<String, dynamic> toJson();
}
