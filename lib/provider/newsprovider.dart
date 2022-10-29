import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Newsprovider extends ChangeNotifier {
  List Businessdata = [];
  List Sciencedata = [];
  List Sportsdata = [];

  getdata({required String CategoryName}) async {
    print('get');
    try {
      http.Response res = await http.get(Uri.parse(
          'https://newsapi.org/v2/top-headlines?category=$CategoryName&country=eg&apiKey=a0b05fa063584f49b5447acf4266155d'));
      if (res.statusCode == 200) {
        print('get res');
        print(json.decode(res.body).toString());
        if (CategoryName == 'business') {
          Businessdata = json.decode(res.body)['articles'];
        } else if (CategoryName == 'sports') {
          Sportsdata = json.decode(res.body)['articles'];
        } else if (CategoryName == 'science') {
          Sciencedata = json.decode(res.body)['articles'];
        }
        notifyListeners();
      } else {
        print('hhhhhhhhh');
        print('${json.decode(res.body)['message']}');
        notifyListeners();
      }
      notifyListeners();
    } on SocketException {
      print('get net');

      notifyListeners();
    } catch (e) {
      print(e.toString());
      notifyListeners();
    }
  }
}
