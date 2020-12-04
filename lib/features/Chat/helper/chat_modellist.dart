

import '../model/chat_model.dart';

List <Chat_Model> getchatModelList(){

  String personImageUrl="images/person.png";
  String doctor_1_ImageUrl="images/doctor-pic-2.png";
  String doctor_2_ImageUrl="images/doctor-pic-3.png";

  List<Chat_Model> chatModel_List = new List<Chat_Model>();
  Chat_Model chatModelelement = new Chat_Model();

  // 1st category



  chatModelelement.userName="Adam Sandler";
  chatModelelement.userTitle="Psychiatrist";
  chatModelelement.lastMessage="Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod.";
  chatModelelement.chatType="patientInfo";
  chatModelelement.newMessageNum=2;
  chatModelelement.userRating=2;
  chatModelelement.lastMessageType="text";
  chatModelelement.lastMessageTime="01:08 am";
  chatModelelement.userPhotoUrl=[];
  chatModelelement.userPhotoUrl.add(personImageUrl);

  chatModel_List.add(chatModelelement);


  chatModelelement = new Chat_Model();

  chatModelelement.userName="Dr. Peter Parker";
  chatModelelement.userTitle="Psychiatrist";
  chatModelelement.lastMessage="Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod.";
  chatModelelement.chatType="patientInfo";
  chatModelelement.newMessageNum=2;
  chatModelelement.userRating=3;
  chatModelelement.lastMessageType="text";
  chatModelelement.lastMessageTime="08:10 pm";
  chatModelelement.userPhotoUrl=[];
  chatModelelement.userPhotoUrl.add(doctor_1_ImageUrl);

  chatModel_List.add(chatModelelement);



  chatModelelement = new Chat_Model();

  chatModelelement.userName="Lab Name, Dr. Tia Hanks & 2 more";
  chatModelelement.userTitle="Specialized Hospital";
  chatModelelement.lastMessage="Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod.";
  chatModelelement.chatType="group-chat";
  chatModelelement.newMessageNum=5;
  chatModelelement.userRating=5;
  chatModelelement.isGroup=true;
  chatModelelement.lastMessageType="text";
  chatModelelement.lastMessageTime="10:38 am";
  chatModelelement.userPhotoUrl=[];
  chatModelelement.userPhotoUrl.add(doctor_1_ImageUrl);
  chatModelelement.userPhotoUrl.add(doctor_2_ImageUrl);
  chatModelelement.userPhotoUrl.add(doctor_1_ImageUrl);

  chatModel_List.add(chatModelelement);



  chatModelelement = new Chat_Model();

  chatModelelement.userName="Pharmacy Name";
  chatModelelement.userTitle="Psychiatrist";
  chatModelelement.lastMessage="";
  chatModelelement.chatType="pharmacy";
  chatModelelement.newMessageNum=0;
  chatModelelement.userRating=4;
  chatModelelement.lastMessageType="call";
  chatModelelement.lastMessageTime="05:19 am";
  chatModelelement.callTime="01:20:00";
  chatModelelement.userPhotoUrl=[];
  chatModelelement.userPhotoUrl.add(doctor_2_ImageUrl);

  chatModel_List.add(chatModelelement);


  chatModelelement = new Chat_Model();

  chatModelelement.userName="Rad Center Name";
  chatModelelement.userTitle="Psychiatrist";
  chatModelelement.lastMessage="Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod.";
  chatModelelement.chatType="rad";
  chatModelelement.newMessageNum=0;
  chatModelelement.userRating=2.5;
  chatModelelement.lastMessageType="text";
  chatModelelement.lastMessageTime="01:08 am";
  chatModelelement.userPhotoUrl=[];
  chatModelelement.userPhotoUrl.add(personImageUrl);


  chatModel_List.add(chatModelelement);



  chatModelelement = new Chat_Model();

  chatModelelement.userName="Company Name";
  chatModelelement.lastMessage="Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod.";
  chatModelelement.chatType="nuclear";
  chatModelelement.userTitle="Laboratory";
  chatModelelement.newMessageNum=3;
  chatModelelement.userRating=4;
  chatModelelement.lastMessageType="text";
  chatModelelement.lastMessageTime="12:13 am";
  chatModelelement.userPhotoUrl=[];
  chatModelelement.userPhotoUrl.add(personImageUrl);


  chatModel_List.add(chatModelelement);




  return chatModel_List;

  }







