import 'dart:convert';
import 'package:get_storage/get_storage.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import 'package:investify/features/user_home/data/models/project_model.dart';

class ProjectsServices2 {
  String token = GetStorage().read('token');

  Future<List<ProjectModel>> getAllProjects() async {
    String url = 'https://investpulse.onrender.com/projects/';
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'multipart/form-data',
        'Authorization': 'Bearer $token'
      },
    );
    List<ProjectModel> projectsList = [];

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      List<dynamic> projects = jsonData['projects'];
      for (var project in projects) {
        ProjectModel projectModel = ProjectModel.fromJson(project);
        projectsList.add(projectModel);
      }
      // print(projectsList);
    } else {
      print(response.statusCode);
    }
    return projectsList;
  }

  Future<List<ProjectModel>> getUserProjectsById({required String id}) async {
    String url = 'https://investpulse.onrender.com/projects/$id';
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'multipart/form-data',
        'Authorization': 'Bearer $token'
      },
    );
    List<ProjectModel> projectsList = [];

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      List<dynamic> projects = jsonData['projects'];
      for (var project in projects) {
        ProjectModel projectModel = ProjectModel.fromJson(project);
        projectsList.add(projectModel);
      }
      print(projectsList);
    } else {
      print(response.statusCode);
    }
    return projectsList;
  }

  Future<void> deletProjectById({required String id}) async {
    String url = 'https://investpulse.onrender.com/projects/delete/$id';
    final response = await http.delete(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
    );

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.statusCode);
    }
  }

  Future<void> investProgect(
      {required String progectId, required int percentage}) async {
    String url = 'https://investpulse.onrender.com/projects/like';
    final response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode({
          'projectId': progectId,
          'percentage': percentage,
        }));
    print(progectId);
    print(percentage);
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
