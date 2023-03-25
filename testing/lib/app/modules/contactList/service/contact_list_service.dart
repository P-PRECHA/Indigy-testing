import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:testing/app/modules/contactList/model/user_model.dart';

class ContactListService extends GetConnect {
  @override
  void onInit() {
    super.onInit();
  }

  Future<List<userModel>?> getUser() async {
    try {
      var url = Uri.parse('https://randomuser.me/api/?results=100');
      final response = await http.get(url).timeout(const Duration(seconds: 20),
          onTimeout: () {
        throw TimeoutException(
            'The connection has timed out, Please try again!');
      });

      if (response.statusCode == HttpStatus.ok) {
        final jsonData = jsonDecode(response.body);
        final List<dynamic> usersData = jsonData['results'];
        return usersData.map((json) => userModel.fromJson(json)).toList();
      } else {
        throw 'Failed to fetch data from API';
      }
    } on SocketException {
      print("You are not connected to internet");
      return null;
    }
  }
}
