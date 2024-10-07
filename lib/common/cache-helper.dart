import 'dart:convert';

import 'package:c2pa_twitter/models/user.dart';
import 'package:hive/hive.dart';

class CacheHelperService {

  Box<dynamic>? box;

  void resetUser() async{
    box!.delete('user');
  }

  Future<void> initalize() async{
   print("Initalizing cache");
   box = await Hive.openBox('userBox');
   print("Initalized cache");
  }


  void setUser(User user){
    box!.put('user', jsonEncode(User.toMap(user)));
  }

  User? getUser(){
    String userData = box!.get('user');
    if(userData.isNotEmpty){
      User user = User.create(data:jsonDecode(userData));
      return user;
    }else{
      return null;
    }
  }

  bool doesUserExist(){
    String? userData = box!.get('user');
    if(userData!=null && userData.isNotEmpty){
      return true;
    }else{
      return false;
    }
  }

}