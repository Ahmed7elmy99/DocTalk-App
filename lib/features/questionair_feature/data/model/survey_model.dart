class SurveyModel {
  List<SurveyQuestions>? surveyQuestions;
  List<SurveyAnswers>? surveyAnswers;

  SurveyModel({this.surveyQuestions, this.surveyAnswers});

  SurveyModel.fromJson(Map<String, dynamic> json) {
    if (json['surveyQuestions'] != null) {
      surveyQuestions = <SurveyQuestions>[];
      json['surveyQuestions'].forEach((v) {
        surveyQuestions!.add(new SurveyQuestions.fromJson(v));
      });
    }
    if (json['surveyAnswers'] != null) {
      surveyAnswers = <SurveyAnswers>[];
      json['surveyAnswers'].forEach((v) {
        surveyAnswers!.add(new SurveyAnswers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.surveyQuestions != null) {
      data['surveyQuestions'] =
          this.surveyQuestions!.map((v) => v.toJson()).toList();
    }
    if (this.surveyAnswers != null) {
      data['surveyAnswers'] =
          this.surveyAnswers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SurveyQuestions {
  int? id;
  String? question;

  SurveyQuestions({this.id, this.question});

  SurveyQuestions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    return data;
  }
}

class SurveyAnswers {
  int? id;
  String? answer;

  SurveyAnswers({this.id, this.answer});

  SurveyAnswers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['answer'] = this.answer;
    return data;
  }
}
