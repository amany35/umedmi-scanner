
import '../model/clip_model.dart';

List <Clip_Model> getclipModelList(){

  String baseUrl="images/";

  List<Clip_Model> clipModel_List = new List<Clip_Model>();
  Clip_Model clipModelelement = new Clip_Model();

  // 1st category

  clipModelelement.iconPath=baseUrl+"appointments.png";
  clipModelelement.text="Appointment Card";

  clipModel_List.add(clipModelelement);

  clipModelelement = new Clip_Model();

  // 1st category

  clipModelelement.iconPath=baseUrl+"prescription.png";
  clipModelelement.text="Prescription";

  clipModel_List.add(clipModelelement);


  clipModelelement = new Clip_Model();

  // 1st category

  clipModelelement.iconPath=baseUrl+"investigation_purple.png";
  clipModelelement.text="Investigation";

  clipModel_List.add(clipModelelement);


  clipModelelement = new Clip_Model();

  // 1st category

  clipModelelement.iconPath=baseUrl+"intervention_purple.png";
  clipModelelement.text="Intervention";

  clipModel_List.add(clipModelelement);


  clipModelelement = new Clip_Model();

  // 1st category

  clipModelelement.iconPath=baseUrl+"referral_purple.png";
  clipModelelement.text="Referral";

  clipModel_List.add(clipModelelement);



  clipModelelement = new Clip_Model();

  // 1st category

  clipModelelement.iconPath=baseUrl+"report_purple.png";
  clipModelelement.text="Report";

  clipModel_List.add(clipModelelement);


  return clipModel_List;

  }







