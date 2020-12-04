class SavePatient {
  List accessUsers;
  List accessUserIdRequests;
  String sId;
  String createdBy;
  String sN;
  String eMR;
  String createdAt;
  String updatedAt;
  int iV;

  SavePatient(
      {this.accessUsers,
        this.accessUserIdRequests,
        this.sId,
        this.createdBy,
        this.sN,
        this.eMR,
        this.createdAt,
        this.updatedAt,
        this.iV});

  SavePatient.fromJson(Map<String, dynamic> json) {
    accessUsers = json['accessUsers'];
    accessUserIdRequests = json['accessUserIdRequests'];
    sId = json['_id'];
    createdBy = json['createdBy'];
    sN = json['SN'];
    eMR = json['EMR'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessUsers'] = this.accessUsers;
    data['accessUserIdRequests'] = this.accessUserIdRequests;
    data['_id'] = this.sId;
    data['createdBy'] = this.createdBy;
    data['SN'] = this.sN;
    data['EMR'] = this.eMR;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}