abstract class SurveyStates {}

class SurveyInitialState extends SurveyStates {}

class SurveyLoadingStates extends SurveyStates {}

class SurveySuccessStates extends SurveyStates {}

class SurveyErrorStates extends SurveyStates {}

class AnswerIdStates extends SurveyStates {}

class SurveyResultLoadingStates extends SurveyStates {}

class SurveyResultSuccessStates extends SurveyStates {}

class SurveyResultErrorStates extends SurveyStates {}

class CreatePatientSurveyLoadingStates extends SurveyStates {}

class CreatePatientSurveySuccessStates extends SurveyStates {}

class CreatePatientSurveyErrorStates extends SurveyStates {}
