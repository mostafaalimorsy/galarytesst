class GalaryModel {
  String? status;
  String? message;
  UserData? data;

  GalaryModel.fromjson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserData.fromjson(json['data']) : null;
  }
}

class UserData {
  String? image;


  UserData(
      {
        this.image,
       });

  UserData.fromjson(Map<String, dynamic> json) {
 
    image = json['images'];
   
  }
}