class PatientInfo {
  String address;
  String birthDate;
  String cityArabic;
  String cityEnglish;
  String encryption;
  String fullNameArabic;
  String fullNameEnglish;
  String genderArabic;
  String genderEnglish;
  String id;
  String idCardExpiration;
  String idValidity;
  String jobArabic;
  String jobEnglish;
  String mainBirthPlaceArabic;
  String mainBirthPlaceEnglish;
  String maritalStatusArabic;
  String maritalStatusEnglish;
  String nationality;
  String profileImage;
  String religionArabic;
  String religionEnglish;
  String ssn;
  String sId;
  String sN;
  String eMR;
  String createdBy;

  PatientInfo(
      {this.address,
        this.birthDate,
        this.cityArabic,
        this.cityEnglish,
        this.encryption,
        this.fullNameArabic,
        this.fullNameEnglish,
        this.genderArabic,
        this.genderEnglish,
        this.id,
        this.idCardExpiration,
        this.idValidity,
        this.jobArabic,
        this.jobEnglish,
        this.mainBirthPlaceArabic,
        this.mainBirthPlaceEnglish,
        this.maritalStatusArabic,
        this.maritalStatusEnglish,
        this.nationality,
        this.profileImage,
        this.religionArabic,
        this.religionEnglish,
        this.ssn,
        this.sId,
        this.sN,
        this.eMR,
        this.createdBy});

  PatientInfo.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    birthDate = json['birthDate'];
    cityArabic = json['cityArabic'];
    cityEnglish = json['cityEnglish'];
    encryption = json['encryption'];
    fullNameArabic = json['fullNameArabic'];
    fullNameEnglish = json['fullNameEnglish'];
    genderArabic = json['genderArabic'];
    genderEnglish = json['genderEnglish'];
    id = json['id'];
    idCardExpiration = json['idCardExpiration'];
    idValidity = json['idValidity'];
    jobArabic = json['jobArabic'];
    jobEnglish = json['jobEnglish'];
    mainBirthPlaceArabic = json['mainBirthPlaceArabic'];
    mainBirthPlaceEnglish = json['mainBirthPlaceEnglish'];
    maritalStatusArabic = json['maritalStatusArabic'];
    maritalStatusEnglish = json['maritalStatusEnglish'];
    nationality = json['nationality'];
    profileImage = json['profileImage'];
    religionArabic = json['religionArabic'];
    religionEnglish = json['religionEnglish'];
    ssn = json['ssn'];
    sId = json['_id'];
    sN = json['SN'];
    eMR = json['EMR'];
    createdBy = json['createdBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['birthDate'] = this.birthDate;
    data['cityArabic'] = this.cityArabic;
    data['cityEnglish'] = this.cityEnglish;
    data['encryption'] = this.encryption;
    data['fullNameArabic'] = this.fullNameArabic;
    data['fullNameEnglish'] = this.fullNameEnglish;
    data['genderArabic'] = this.genderArabic;
    data['genderEnglish'] = this.genderEnglish;
    data['id'] = this.id;
    data['idCardExpiration'] = this.idCardExpiration;
    data['idValidity'] = this.idValidity;
    data['jobArabic'] = this.jobArabic;
    data['jobEnglish'] = this.jobEnglish;
    data['mainBirthPlaceArabic'] = this.mainBirthPlaceArabic;
    data['mainBirthPlaceEnglish'] = this.mainBirthPlaceEnglish;
    data['maritalStatusArabic'] = this.maritalStatusArabic;
    data['maritalStatusEnglish'] = this.maritalStatusEnglish;
    data['nationality'] = this.nationality;
    data['profileImage'] = this.profileImage;
    data['religionArabic'] = this.religionArabic;
    data['religionEnglish'] = this.religionEnglish;
    data['ssn'] = this.ssn;
    data['_id'] = this.sId;
    data['SN'] = this.sN;
    data['EMR'] = this.eMR;
    data['createdBy'] = this.createdBy;
    return data;
  }
}