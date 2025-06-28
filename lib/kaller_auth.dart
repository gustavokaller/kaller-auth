import 'package:flutter/material.dart';

class KallerAuth with ChangeNotifier{

  String? _message = null;
  String? _token = null;

  String _url = "https://identitytoolkit.googleapis.com";
  String _resource = "/v1/accounts";
  String _apikey = "AIzaSyCPZUPDH7-KNThUq60VnelVyXJDUM15j2U";

  void signUp(){}
  void signIn(){}
}
