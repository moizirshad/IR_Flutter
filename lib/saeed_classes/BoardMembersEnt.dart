import 'ApiResponse.dart';

class BoardMembersEnt implements Serializable {
  String? individualID;
  String? companyPositionTypeID;
  String? positionID;
  String? nameEn;
  String? nameAr;
  String? positionNameEn;
  String? positionNameAr;
  String? companyPositionTypeNameAr;
  String? companyPositionTypeNameEn;
  String? profilePicURL;
  String? displaySeqNo;
  String? isHighlighted;

  BoardMembersEnt({this.individualID,
    this.companyPositionTypeID,
    this.positionID,
    this.nameEn,
    this.nameAr,
    this.positionNameEn,
    this.positionNameAr,
    this.companyPositionTypeNameAr,
    this.companyPositionTypeNameEn,
    this.profilePicURL,
    this.displaySeqNo,
    this.isHighlighted});

  BoardMembersEnt.fromJson(Map<String, dynamic> json) {
    individualID = json['IndividualID'];
    companyPositionTypeID = json['CompanyPositionTypeID'];
    positionID = json['PositionID'];
    nameEn = json['NameEn'];
    nameAr = json['NameAr'];
    positionNameEn = json['PositionNameEn'];
    positionNameAr = json['PositionNameAr'];
    companyPositionTypeNameAr = json['CompanyPositionTypeNameAr'];
    companyPositionTypeNameEn = json['CompanyPositionTypeNameEn'];
    profilePicURL = json['ProfilePicURL'];
    displaySeqNo = json['DisplaySeqNo'];
    isHighlighted = json['IsHighlighted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IndividualID'] = this.individualID;
    data['CompanyPositionTypeID'] = this.companyPositionTypeID;
    data['PositionID'] = this.positionID;
    data['NameEn'] = this.nameEn;
    data['NameAr'] = this.nameAr;
    data['PositionNameEn'] = this.positionNameEn;
    data['PositionNameAr'] = this.positionNameAr;
    data['CompanyPositionTypeNameAr'] = this.companyPositionTypeNameAr;
    data['CompanyPositionTypeNameEn'] = this.companyPositionTypeNameEn;
    data['ProfilePicURL'] = this.profilePicURL;
    data['DisplaySeqNo'] = this.displaySeqNo;
    data['IsHighlighted'] = this.isHighlighted;
    return data;
  }

  List<BoardMembersEnt> getData(dynamic jsonData) {
    var responseApi = jsonData["Data"];
    List<dynamic> data=responseApi.map((i) => BoardMembersEnt.fromJson(i)).toList();
    return data.cast<BoardMembersEnt>();
  }
}


