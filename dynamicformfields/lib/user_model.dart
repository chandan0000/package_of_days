class UserModel {
  String? userName;
  int? userAge;
  List<String>? emails;
  UserModel({this.userName, this.userAge, this.emails});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['UserName'] = this.userName;
    data['UserAge'] = this.userAge;
    data['Emails'] = this.emails;
    return data;
  }
}
