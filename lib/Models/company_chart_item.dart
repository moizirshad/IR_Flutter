import 'base_response.dart';

class CompanyChartItem implements Serializable {
  String ChartUrlAr;
  String ChartUrlEn;

  CompanyChartItem({this.ChartUrlAr, this.ChartUrlEn});

  CompanyChartItem.fromJson(Map<String, dynamic> json) {
    ChartUrlAr = json['ChartUrlAr'] == null ? '' : json['ChartUrlAr'];
    ChartUrlEn = json['ChartUrlEn'] == null ? '' : json['ChartUrlEn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ChartUrlEn'] = this.ChartUrlEn;
    data['ChartUrlAr'] = this.ChartUrlAr;
    return data;
  }

  CompanyChartItem getData(dynamic jsonData) {
    var responseApi = BaseResponse<Serializable>.fromJson(
        jsonData, (data) => CompanyChartItem.fromJson(data));
    return responseApi.data as CompanyChartItem;
  }
}
