class SubscribeModel {
  int statusCode;
  List<Data> data;

  SubscribeModel({this.statusCode, this.data});

  SubscribeModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String sId;
  String type;
  int priceMonthly;
  int priceAnnualy;
  String messagesMonthly;
  String inMailSMSMonthly;
  int storage;
  String sharing;
  String outboundPatientSharing;
  String viewSharedPatients;
  String pollFeatureMonthly;
  String messageRetentionAndDeletion;
  String umedmiBotResponses;
  String callVideoFeature;
  String autoScheduler;
  String aDSBlocker;
  String templates;
  String clinicSheetBuilder;
  String dashboard;
  String printing;
  String voiceNotesAndUploads;
  String voiceRecognition;
  String handwritingRecognition;
  String extractForms;
  int iV;

  Data(
      {this.sId,
        this.type,
        this.priceMonthly,
        this.priceAnnualy,
        this.messagesMonthly,
        this.inMailSMSMonthly,
        this.storage,
        this.sharing,
        this.outboundPatientSharing,
        this.viewSharedPatients,
        this.pollFeatureMonthly,
        this.messageRetentionAndDeletion,
        this.umedmiBotResponses,
        this.callVideoFeature,
        this.autoScheduler,
        this.aDSBlocker,
        this.templates,
        this.clinicSheetBuilder,
        this.dashboard,
        this.printing,
        this.voiceNotesAndUploads,
        this.voiceRecognition,
        this.handwritingRecognition,
        this.extractForms,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    type = json['type'];
    priceMonthly = json['priceMonthly'];
    priceAnnualy = json['priceAnnualy'];
    messagesMonthly = json['messagesMonthly'];
    inMailSMSMonthly = json['inMailSMSMonthly'];
    storage = json['storage'];
    sharing = json['sharing'];
    outboundPatientSharing = json['outboundPatientSharing'];
    viewSharedPatients = json['viewSharedPatients'];
    pollFeatureMonthly = json['pollFeatureMonthly'];
    messageRetentionAndDeletion = json['messageRetentionAndDeletion'];
    umedmiBotResponses = json['umedmiBotResponses'];
    callVideoFeature = json['callVideoFeature'];
    autoScheduler = json['autoScheduler'];
    aDSBlocker = json['ADSBlocker'];
    templates = json['templates'];
    clinicSheetBuilder = json['clinicSheetBuilder'];
    dashboard = json['dashboard'];
    printing = json['printing'];
    voiceNotesAndUploads = json['voiceNotesAndUploads'];
    voiceRecognition = json['voiceRecognition'];
    handwritingRecognition = json['handwritingRecognition'];
    extractForms = json['extractForms'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['type'] = this.type;
    data['priceMonthly'] = this.priceMonthly;
    data['priceAnnualy'] = this.priceAnnualy;
    data['messagesMonthly'] = this.messagesMonthly;
    data['inMailSMSMonthly'] = this.inMailSMSMonthly;
    data['storage'] = this.storage;
    data['sharing'] = this.sharing;
    data['outboundPatientSharing'] = this.outboundPatientSharing;
    data['viewSharedPatients'] = this.viewSharedPatients;
    data['pollFeatureMonthly'] = this.pollFeatureMonthly;
    data['messageRetentionAndDeletion'] = this.messageRetentionAndDeletion;
    data['umedmiBotResponses'] = this.umedmiBotResponses;
    data['callVideoFeature'] = this.callVideoFeature;
    data['autoScheduler'] = this.autoScheduler;
    data['ADSBlocker'] = this.aDSBlocker;
    data['templates'] = this.templates;
    data['clinicSheetBuilder'] = this.clinicSheetBuilder;
    data['dashboard'] = this.dashboard;
    data['printing'] = this.printing;
    data['voiceNotesAndUploads'] = this.voiceNotesAndUploads;
    data['voiceRecognition'] = this.voiceRecognition;
    data['handwritingRecognition'] = this.handwritingRecognition;
    data['extractForms'] = this.extractForms;
    data['__v'] = this.iV;
    return data;
  }
}