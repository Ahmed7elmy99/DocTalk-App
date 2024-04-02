class PatientSurveyResults {
  int? lpdRate;
  int? surveyResult;
  String? patientDiagnoses;

  PatientSurveyResults(
      {this.lpdRate, this.surveyResult, this.patientDiagnoses});

  PatientSurveyResults.fromJson(Map<String, dynamic> json) {
    lpdRate = json['lpdRate'];
    surveyResult = json['surveyResult'];
    patientDiagnoses = json['patientDiagnoses'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lpdRate'] = this.lpdRate;
    data['surveyResult'] = this.surveyResult;
    data['patientDiagnoses'] = this.patientDiagnoses;
    return data;
  }
}