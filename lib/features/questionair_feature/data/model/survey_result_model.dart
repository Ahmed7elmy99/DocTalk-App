class SurveyResultModel {
  String? diagnoses;
  int? lpdRate;

  SurveyResultModel({this.diagnoses, this.lpdRate});

  SurveyResultModel.fromJson(Map<String, dynamic> json) {
    diagnoses = json['diagnoses'];
    lpdRate = json['lpdRate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['diagnoses'] = this.diagnoses;
    data['lpdRate'] = this.lpdRate;
    return data;
  }
}
