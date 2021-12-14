import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:interview_bigb/models/food_screen2_model.dart';

Future<FoodModel> fetchFoodDetails() async {
  String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYxNzI2MDU0OTI1ZTM0MmE0ZDBkMzM4MiIsImlhdCI6MTYzOTQ2NjIwNCwiZXhwIjoxNjQyMDU4MjA0fQ.tSEkVJh7nqe7n2MQZoJMAI4YDp84H40yE95H1rJ_LFQ';
  var headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token'
  };
  final response = await http.get(
    Uri.parse(
        'https://fuddo.backb.in/api/v1/restaurant/10.025262804034076/76.30770989631989?limit=10&page=1'),
    headers: headers,
  );

  if (response.statusCode == 200) {
    return FoodModel.fromMap(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
