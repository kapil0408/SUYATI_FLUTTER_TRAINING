import 'package:flutter/foundation.dart';

class User 
{
  /*
    This class encapsulates the json reponse from the api
    {
      'userId': '1908789',
      'username': username,
      'name':'Kapil Goyal',
      'lastLogin': '7 Oct 2022 03:58 PM',
      'email': 'kkgoayl@suyati.com'
    }
   */

    String? userId; //_ is presenting that it is a private variable
    String? userName;
    String? name;
    String? lastLogin;
    String? email;
 
    User({     //it is constructor
      required this.userId, 
      required this.userName, 
      required this.name, 
      required this.lastLogin, 
      required this.email
      });
    
    
    // Properties
    //  String get userId => _userId;
    //  set userId (String userId) => _userId = userId;

    //  String get userName => _userName;
    //  set userName (String username) => _username = username;

    // String get name => _name;
    // set name (String name) => _name;

    // String get lastLogin => _lastLogin;
    // set lastLogin (String lastLogin) => _lastLogin = lastLogin;

    // String get email => _email;
    // set email(String email) => _email = email;

    // create the user object from json input
    factory User.fromJson(Map<String, dynamic> json) 
    {
      return User(
       userId : json['userId'],
       userName : json['userName'],
       name : json['name'],
       lastLogin : json['lastLogin'],
       email : json['email'],
      );
    }

    // exports to json
    Map<String, dynamic> toJson(){
      final Map<String, dynamic> data = <String, dynamic>{};
      data['userId'] = userId;
      data['userName'] = userName;
      data['name'] = name;
      data['lastLogin'] = lastLogin;
      data['email'] = email;
      return data;
    }
}