class Message_Model{

  bool isMe;

  String message;

  String time;

  bool isseen;

  String messageType;

  String messageDate;

  bool isStarred=false;

  bool isEdited=false;

  bool isLiked=false;

  bool isPinned= false;

  bool isReplied=false;

  List<String> messagePhotos=[];

  double latitude=0;

  double longitude=0;

  bool isCallAccepted=false;

  bool isCallRequestCanceled=false;

  bool isCallResponsed=false;

}