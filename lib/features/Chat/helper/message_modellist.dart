

import '../model/message_model.dart';

List <Message_Model> getMessageModelList(){

  List<Message_Model> messageModel_List = new List<Message_Model>();
  Message_Model messageModelelement = new Message_Model();

  messageModelelement.message="Lorem ipsum dolor sit amet, consetetur.";
  messageModelelement.time="10 : 35 AM";
  messageModelelement.isMe=true;
  messageModelelement.isseen=true;
  messageModelelement.messageDate="Today";
  messageModelelement.messageType="text";


  messageModel_List.add(messageModelelement);


  messageModelelement = new Message_Model();

  messageModelelement.message="Lorem ipsum.";
  messageModelelement.time="10 : 38 AM";
  messageModelelement.isMe=false;
  messageModelelement.isseen=true;
  messageModelelement.messageDate="Today";
  messageModelelement.messageType="text";


  messageModel_List.add(messageModelelement);


  messageModelelement = new Message_Model();

  messageModelelement.message="Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod.";
  messageModelelement.time="10 : 45 AM";
  messageModelelement.isMe=true;
  messageModelelement.isseen=false;
  messageModelelement.messageDate="Yesterday";
  messageModelelement.messageType="text";


  messageModel_List.add(messageModelelement);


  messageModelelement = new Message_Model();

  messageModelelement.message="";
  messageModelelement.time="10 : 45 AM";
  messageModelelement.isMe=false;
  messageModelelement.isseen=false;
  messageModelelement.messageDate="Today";
  messageModelelement.messageType="voice_note";


  messageModel_List.add(messageModelelement);


  messageModelelement = new Message_Model();

  messageModelelement.message="Lorem ipsum dolor sit amet.";
  messageModelelement.time="10 : 45 AM";
  messageModelelement.isMe=true;
  messageModelelement.isseen=false;
  messageModelelement.messageDate="Today";
  messageModelelement.messageType="location";
  messageModelelement.latitude=23.33;
  messageModelelement.longitude=35.269;

  messageModel_List.add(messageModelelement);


  messageModelelement = new Message_Model();

  messageModelelement.message="";
  messageModelelement.time="12 : 57 PM";
  messageModelelement.isMe=true;
  messageModelelement.isseen=false;
  messageModelelement.messageDate="Today";
  messageModelelement.messageType="call_request";
  messageModelelement.isCallResponsed=false;
  messageModelelement.isCallAccepted=false;
  messageModelelement.isCallRequestCanceled=false;

  messageModel_List.add(messageModelelement);


  messageModelelement = new Message_Model();

  messageModelelement.message="";
  messageModelelement.time="01 : 57 PM";
  messageModelelement.isMe=false;
  messageModelelement.isseen=false;
  messageModelelement.messageDate="Today";
  messageModelelement.messageType="call_request";
  messageModelelement.isCallResponsed=false;
  messageModelelement.isCallAccepted=false;
  messageModelelement.isCallRequestCanceled=false;

  messageModel_List.add(messageModelelement);


  messageModelelement = new Message_Model();

  messageModelelement.message="Lorem ipsum dolor sit amet";
  messageModelelement.time="05 : 35 PM";
  messageModelelement.isMe=true;
  messageModelelement.isseen=true;
  messageModelelement.isReplied=true;
  messageModelelement.messageDate="Today";
  messageModelelement.messageType="text";

  messageModel_List.add(messageModelelement);

  messageModelelement = new Message_Model();

  messageModelelement.message="";
  messageModelelement.time="05 : 35 PM";
  messageModelelement.isMe=false;
  messageModelelement.isseen=true;
  messageModelelement.messagePhotos.add("images/doctorProfile.png");
  messageModelelement.messagePhotos.add("images/doctorProfile.png");
  messageModelelement.messagePhotos.add("images/doctorProfile.png");
  messageModelelement.messagePhotos.add("images/doctorProfile.png");
  messageModelelement.messagePhotos.add("images/doctorProfile.png");
  messageModelelement.messageDate="Today";
  messageModelelement.messageType="photo";

  messageModel_List.add(messageModelelement);



  messageModelelement = new Message_Model();

  messageModelelement.message="";
  messageModelelement.time="05 : 35 PM";
  messageModelelement.isMe=true;
  messageModelelement.isseen=true;
  messageModelelement.messageDate="Today";
  messageModelelement.messageType="poll";

  messageModel_List.add(messageModelelement);


  messageModelelement = new Message_Model();

  messageModelelement.message="File Name";
  messageModelelement.time="05 : 55 PM";
  messageModelelement.isMe=true;
  messageModelelement.isseen=false;
  messageModelelement.messageDate="Today";
  messageModelelement.messageType="file";

  messageModel_List.add(messageModelelement);


  messageModel_List=messageModel_List.reversed.toList();

  return messageModel_List;
}