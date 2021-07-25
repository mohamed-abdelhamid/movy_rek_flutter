import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage{
  FlutterSecureStorage storage;

  SecureStorage(){
    storage = FlutterSecureStorage();
  }

  Future<String> getToken(String key) async => await storage.read(key: key);
  void deleteToken(String key) async => await storage.delete(key: key);
  void deleteAll() async => await storage.deleteAll();
  void writeToken(String key, String value) async => await storage.write(key: key, value: value);

}