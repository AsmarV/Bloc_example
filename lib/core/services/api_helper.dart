import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/message_model.dart';



class ApiHelper {

  ///END-POINT
  String baseUrl = "https://dummyjson.com/";

  ///HEADER-DEFAULT
  Map<String, String> header = {
    // 'Content-Type': 'application/json'
  };

  ///GET METHOD
  Future get({required String url, Map<String, String>? header}) async {
    try {
      var response = await http.get(Uri.parse(baseUrl + url),
          headers: header ?? this.header);

      debugPrint("=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=");
      debugPrint("===== GET => ${baseUrl + url} =====");
      debugPrint(
          "===== STATES CODE => ${response.statusCode.toString()} =====");
      debugPrint("===== BODY => ${response.body.toString()} =====");
      debugPrint("===== HEADER => ${response.headers.toString()} =====");
      debugPrint("=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=");

      return _returnResponse(response);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  ///POST METHOD
  Future post(
      {required String url,
      required Map<String, dynamic> body,
      Map<String, String>? header}) async {
    try {
      var response = await http.post(Uri.parse(baseUrl + url),
          body: body, headers: header ?? this.header);

      debugPrint("=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=");
      debugPrint("===== POST => ${baseUrl + url} =====");
      debugPrint(
          "===== STATES CODE => ${response.statusCode.toString()} =====");
      debugPrint("===== BODY => ${response.body.toString()} =====");
      debugPrint("===== HEADER => ${response.headers.toString()} =====");
      debugPrint("=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=");

      return _returnResponse(response);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  ///PUT METHOD
  Future put(
      {required String url,
      required Map<String, dynamic> body,
      Map<String, String>? header}) async {
    try {
      var response = await http.put(Uri.parse(baseUrl + url),
          body: body, headers: header ?? this.header);

      debugPrint("=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=");
      debugPrint("===== PUT => ${baseUrl + url} =====");
      debugPrint(
          "===== STATES CODE => ${response.statusCode.toString()} =====");
      debugPrint("===== BODY => ${response.body.toString()} =====");
      debugPrint("===== HEADER => ${response.headers.toString()} =====");
      debugPrint("=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=");


      return _returnResponse(response);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  ///DELETE METHOD
  Future delete({required String url, Map<String, String>? header}) async {
    try {
      var response = await http.delete(Uri.parse(baseUrl + url),
          headers: header ?? this.header);

      debugPrint("=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=");
      debugPrint("===== DELETE => ${baseUrl + url} =====");
      debugPrint("===== STATES CODE => ${response.statusCode.toString()} =====");
      debugPrint("===== BODY => ${response.body.toString()} =====");
      debugPrint("===== HEADER => ${response.headers.toString()} =====");
      debugPrint("=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=");

      return _returnResponse(response);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  dynamic _returnResponse(http.Response response) {

    var responseJson = json.decode(response.body.toString());
    Message message = Message.fromJson(responseJson);

    switch (response.statusCode) {
      case 200:
      case 201:
        var responseJson = json.decode(response.body.toString());
        debugPrint(responseJson.toString());
        return responseJson;

      case 400:
      case 401:
      case 403:
      case 404:
        throw message.message;

      case 500:
      default:
        throw 'Server internal error !!';

    }
  }
}
