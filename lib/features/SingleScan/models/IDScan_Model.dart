class IDScan_Model {
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
  String husbandNameArabic;
  String husbandNameEnglish;
  String phoneNumber;
  String emergencyPhone;
  String email;
  String ethnicGroup;

  IDScan_Model(
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
      this.husbandNameArabic,
      this.husbandNameEnglish,
      this.phoneNumber,
        this.emergencyPhone,
      this.email,
        this.ethnicGroup});

  IDScan_Model.fromJson(Map<String, dynamic> json) {
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
    husbandNameArabic = json['husbandNameArabic'];
    husbandNameEnglish = json['husbandNameEnglish'];
    phoneNumber = json['phoneNumber'];
    emergencyPhone = json['emergencyPhone'];
    email = json['email'];
    ethnicGroup= json['ethnicGroup'];
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
    data['husbandNameArabic'] = this.husbandNameArabic;
    data['husbandNameEnglish'] = this.husbandNameEnglish;
    data['phoneNumber'] = this.phoneNumber;
    data['emergencyPhone'] = this.emergencyPhone;
    data['email'] = this.email;
    data['ethnicGroup'] = this.ethnicGroup;
    return data;
  }
}