import 'package:flutter/cupertino.dart';

class User {
  String _username, _gender, _email, _password, _birthDate;
  User(
      {@required username, @required password, gender, birthDate, email,}) {
    this._username = username;
    this._gender = gender;
    this._email = email;
    this._birthDate = birthDate;
    this._password = password;
  }

  set username(String un) => _username;
  get username => _username;

  set gender(String g) => _gender;
  get gender => _gender;

  set birthDate(String date) => _birthDate;
  get birthDate => _birthDate;

  set email(String mail) => _email;
  get email => _email;

  set password(String pass) => _password;
  get password => _password;
}

// used to pass values by reference
class PrimitiveWrapper {
  var value;
  PrimitiveWrapper(this.value);
}