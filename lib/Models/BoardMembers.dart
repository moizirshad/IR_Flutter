import 'dart:convert';

BaseModel customerFromJson(String str) => BaseModel.fromJson(json.decode(str));
String customerToJson(BaseModel data) => json.encode(data.toJson());


class BaseModel{
  int StatusCode;
  String StatusMessage;
  List<Data> data;
  final String ErrorMessage;

  BaseModel({
    this.StatusCode,
    this.StatusMessage,
    this.data,
    this.ErrorMessage,
  });

  factory BaseModel.fromJson(Map<String, dynamic> json) => BaseModel(
    StatusCode: json["StatusCode"],
    StatusMessage: json["StatusMessage"],
    data: List<Data>.from(json["Data"].map((x) => Data.fromJson(x))),
    ErrorMessage: json["ErrorMessage"],
  );

  Map<String, dynamic> toJson() => {
    "StatusCode": StatusCode,
    "StatusMessage": StatusMessage,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "ErrorMessage": ErrorMessage,
  };
}
class Data {
  final String IndividualID;
  final String CompanyPositionTypeID;
  final String PositionID;
  final String NameEn;
  final String NameAr;
  final String PositionNameEn;
  final String PositionNameAr;
  final String CompanyPositionTypeNameAr;
  final String CompanyPositionTypeNameEn;
  final String ProfilePicURL;
  final String DisplaySeqNo;
  final String IsHighlighted;

  Data({
    this.IndividualID,
    this.CompanyPositionTypeID,
    this.PositionID,
    this.NameEn,
    this.NameAr,
    this.PositionNameEn,
    this.PositionNameAr,
    this.CompanyPositionTypeNameAr,
    this.CompanyPositionTypeNameEn,
    this.ProfilePicURL,
    this.DisplaySeqNo,
    this.IsHighlighted,

  });
  factory Data.fromJson(Map<String, dynamic> json) => Data(
    IndividualID: json["IndividualID"],
    CompanyPositionTypeID: json["CompanyPositionTypeID"],
    PositionID: json["PositionID"],
    NameEn: json["NameEn"],
    NameAr: json["NameAr"],
    PositionNameEn: json["PositionNameEn"],
    PositionNameAr: json["PositionNameAr"],
    CompanyPositionTypeNameAr: json["CompanyPositionTypeNameAr"],
    CompanyPositionTypeNameEn: json["CompanyPositionTypeNameEn"],
    ProfilePicURL: json["ProfilePicURL"],
    DisplaySeqNo: json["DisplaySeqNo"],
    IsHighlighted: json["IsHighlighted"],

  );
  Map<String, dynamic> toJson() => {
    "IndividualID": IndividualID,
    "CompanyPositionTypeID": CompanyPositionTypeID,
    "PositionID": PositionID,
    "address": NameEn,
    "address": NameAr,
    "address": PositionNameEn,
    "address": PositionNameAr,
    "address": CompanyPositionTypeNameAr,
    "address": CompanyPositionTypeNameEn,
    "address": ProfilePicURL,
    "address": DisplaySeqNo,
    "address": IsHighlighted,
  };
}






