class CovidModel{


  final String organ;
  final String status;
  final String diagnosis;


  CovidModel({this.organ, this.status, this.diagnosis});

  factory CovidModel.fromJson(Map<String, dynamic> json) {
    return CovidModel(

      organ:json['Organ'],
      status: json['Status'],
      diagnosis: json['Diagnosis']


    );
  }





}