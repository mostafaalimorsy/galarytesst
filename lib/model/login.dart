class LoginModel {
   int? id;
   String? name;
   String? email;
   String? email_verfied_at;
   String? created_at;
   String? updated_at;
   String? token;


  LoginModel(
      {  this.id,
        required this.name,
        required this.email,
        required this.email_verfied_at,
        required this.created_at,
        required this.updated_at,
        required this.token,
        });

  LoginModel.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    email_verfied_at = json['email_verfied_at'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    token = json['token'];

  }
}

