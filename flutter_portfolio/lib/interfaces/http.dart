import 'dart:convert';

import 'package:flutter_portfolio/widgets/molecules/studying_card.dart';
import 'package:http/http.dart' as http;

const baseUrl = 'http://10.0.2.2:3000/api';

Future<List<StudyingInfo>> fetchStudies() async {
  final response = await http.get(Uri.parse('$baseUrl/studies'));

  if (response.statusCode == 200) {
    final bodyDecoded = jsonDecode(response.body);

    List<StudyingInfo> studyingList = List.from(bodyDecoded['data'])
        .map((e) => StudyingInfo.fromJson(e))
        .toList();
    return studyingList;
  }

  throw Exception('Failed to load Studies');
}

Future<http.Response> fetchCourses() {
  return http.get(Uri.parse('$baseUrl/courses'));
}
