// import 'dart:io';
// import 'package:get_storage/get_storage.dart';
// import 'package:http/http.dart' as http;

// class ProjectServices {
//   Future<void> addProject({
//     required String title,
//     required String description,
//     required int price,
//     required File image,
//     required File video,
//   }) async {
//     String token = GetStorage().read('token');
//     String url = 'https://investpulse.onrender.com/projects/';

//     // Create a multipart request
//     var request = http.MultipartRequest('POST', Uri.parse(url));
//     request.headers['Authorization'] = 'Bearer $token';
//     request.headers['Content-Type'] = 'multipart/form-data';

//     // Add the image and video files
//     var imageFile = await http.MultipartFile.fromPath('image', image.path);
//     var videoFile = await http.MultipartFile.fromPath('video', video.path);
//     print(imageFile);
//     request.files.add(imageFile);
//     request.files.add(videoFile);

//     // Add the other fields
//     request.fields['title'] = title;
//     request.fields['description'] = description;
//     request.fields['price'] = price.toString();

//     try {
//       var response = await request.send();
//       if (response.statusCode == 200) {
//         String responseBody = await response.stream.bytesToString();

//         print('Project created successfully');
//         print(responseBody);
//       } else {
//         print('Failed to create project. Status code: ${response.statusCode}');
//         String responseBody = await response.stream.bytesToString();
//         print('Response body: $responseBody');
//       }
//     } catch (e) {
//       print('Error sending request: $e');
//     }
//   }
// }
// }
import 'dart:io';
import 'package:get_storage/get_storage.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;

class ProjectServices {
  Future<bool> addProject({
    required String title,
    required String description,
    required int price,
    required File image,
    // required File video,
  }) async {
    String token = GetStorage().read('token');
    String url = 'https://investpulse.onrender.com/projects/';

    // Create a multipart request
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers['Authorization'] = 'Bearer $token';

    // Add the image and video files
    // var imageLength = await image.length();
    // var videoLength = await video.length();
    // Verify the file sizes
    // if (imageLength == 0 || videoLength == 0) {
    //   print('Image or video file is empty.');
    //   return;
    // }
    request.files.add(http.MultipartFile(
      'media',
      image.readAsBytes().asStream(),
      image.lengthSync(),
      filename: 'image.jpg',
      contentType: MediaType('image', 'jpg'),
    ));
    // request.files.add(http.MultipartFile(
    //   'video',
    //   video.readAsBytes().asStream(),
    //   video.lengthSync(),
    //   filename: 'video.mp4',
    //   contentType: MediaType('video', 'mp4'),
    // ));

    // Add the other fields
    request.fields['title'] = title;
    request.fields['description'] = description;
    request.fields['price'] = price.toString();

    try {
      var response = await http.Response.fromStream(await request.send());
      if (response.statusCode == 200) {
        String responseBody = response.body;

        print('Project created successfully');

        print(responseBody);
        return true;
      } else {
        print('Failed to create project. Status code: ${response.statusCode}');
        String responseBody = response.body;
        print('Response body: $responseBody');
        return false;
      }
    } catch (e) {
      print('Error sending request: $e');
      return false;
    }
  }
}
