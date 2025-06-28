import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class KallerAuth with ChangeNotifier {
  String? _message;
  String? _token;

  final String _url = "https://identitytoolkit.googleapis.com";
  final String _resource = "/v1/accounts";
  final String _apikey = "AIzaSyCPZUPDH7-KNThUq60VnelVyXJDUM15j2U";

  String? get token => _token;
  String? get message => _message;

  Future<bool> signUp(String email, String senha) async {
    final uri = Uri.parse('$_url$_resource:signUp?key=$_apikey');

    try {
      final response = await http.post(
        uri,
        body: json.encode({
          'email': email,
          'password': senha,
          'returnSecureToken': true,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      final responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        _token = responseData['idToken'];
        _message = null;
        notifyListeners();
        return true;
      } else {
        _message = responseData['error']['message'] ?? 'Erro desconhecido';
        notifyListeners();
        return false;
      }
    } catch (e) {
      _message = 'Erro na conexão: $e';
      notifyListeners();
      return false;
    }
  }

  Future<bool> signIn(String email, String senha) async {
    final uri = Uri.parse('$_url$_resource:signInWithPassword?key=$_apikey');

    try {
      final response = await http.post(
        uri,
        body: json.encode({
          'email': email,
          'password': senha,
          'returnSecureToken': true,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      final responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        _token = responseData['idToken'];
        _message = null;
        notifyListeners();
        return true;
      } else {
        _message = responseData['error']['message'] ?? 'Erro desconhecido';
        notifyListeners();
        return false;
      }
    } catch (e) {
      _message = 'Erro na conexão: $e';
      notifyListeners();
      return false;
    }
  }
}
