import 'dart:convert';

List<Datamodel>datamodelFromJson(String str) => List<Datamodel>.from(json.decode(str).map((x) => Datamodel.fromJson(x)));

String datamodelToJson(Datamodel data) => json.encode(data.toJson());

class Datamodel {
    Datamodel({
        required this.id,
        required this.name,
        required this.email,
        required this.mobile,
        required this.phone,
        //required this.photo,
    });

    final int? id;
    final String? name;
    final String? email;
    final String? mobile;
    final String? phone;
    //String photo;

    factory Datamodel.fromJson(Map<String, dynamic> json) => Datamodel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        phone: json["phone"],
       // photo: json["photo"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "mobile": mobile,
        "phone": phone,
        //"photo": photo,
    };
}