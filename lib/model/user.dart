import 'package:flutter/cupertino.dart';

class User {
  String _username, _gender, _email, _password, _birthDate,_code,_new_password,_verif_code;
  User(
      {@required username, @required password, gender, birthDate, email,code,new_password,verif_code}) {
    this._username = username;
    this._gender = gender;
    this._email = email;
    this._birthDate = birthDate;
    this._password = password;
    this._code = code;
    this._new_password = new_password;
    this._verif_code = verif_code;
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

  set code(String code) => _code;
  get code => _code;

  set verif_code(String code) => _verif_code;
  get verif_code => _verif_code;

  set new_password(String paas) => _new_password;
  get new_password => _new_password;
}

// used to pass values by reference
class PrimitiveWrapper {
  var value;
  PrimitiveWrapper(this.value);
}