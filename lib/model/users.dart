class Users {
  String login;
  int id;

  Users.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        login = json['login'];
}