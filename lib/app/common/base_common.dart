import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:theday/app/common/model/account.dart';

class BaseCommon {
  static BaseCommon? _instance;
  String? accessToken;
  String? refreshToken;
  String? mode;
  Account? accountSession;
  String? deviceToken;

  BaseCommon._internal();

  static BaseCommon get instance {
    _instance ??= BaseCommon._internal();
    return _instance!;
  }

  Map<String, String> headerRequest({bool isUsingToken = true}) {
    if (isUsingToken) {
      return {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $accessToken'
      };
    }
    return {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json; charset=UTF-8',
    };
  }

  Future<void> saveAccount(
      {required Account account}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    accountSession = account;
    accessToken = account.token;
    log(jsonEncode(account));
    await prefs.setString('token', account.token!);
  }

  Future<void> removeLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    accessToken = '';
    refreshToken = '';
    await prefs.remove('username');
    await prefs.remove('password');
  }
}
