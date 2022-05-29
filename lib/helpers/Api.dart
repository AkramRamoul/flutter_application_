import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'SharedPreferencesManager.dart';

class Api {
  final String _baseUrl = 'http://192.168.43.5:8000/api';
  var token;

  postData(data, apiUrl) async {
    var fullUrl = _baseUrl + apiUrl;
    return await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaders());
  }

  // postFormData(data, apiUrl) async {
  //   var fullUrl = _baseUrl + apiUrl;
  //   //token = await SharedPreferencesManager().getAuthToken();
  //   return await http.post(Uri.parse(fullUrl),
  //       body: data, headers: _setFormHeaders());
  // }

  getData(apiUrl) async {
    var fullUrl = _baseUrl + apiUrl;
    token = await SharedPreferencesManager().getAuthToken();
    return await http.get(Uri.parse(fullUrl), headers: _setHeaders());
  }

  deleteData(id) async {
    var url = _baseUrl + '/offers/$id';
    token = await SharedPreferencesManager().getAuthToken();
    return await http.delete(Uri.parse(url), headers: _setHeaders());
  }

  postDataWithImage(data, apiUrl, filepath) async {
    var fullUrl = _baseUrl + apiUrl;
    token = await SharedPreferencesManager().getAuthToken();
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest('POST', Uri.parse(fullUrl))
      ..fields.addAll(data)
      ..headers.addAll(headers)
      ..files.add(await http.MultipartFile.fromPath('image', filepath));
    return await request.send();
  }

  postDataWithImages(data, apiUrl, List<XFile> files) async {
    var fullUrl = _baseUrl + apiUrl;
    token = await SharedPreferencesManager().getAuthToken();
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest('POST', Uri.parse(fullUrl))
      ..fields.addAll(data)
      ..headers.addAll(headers);
    for (var file in files) {
      request.files
          .add(await http.MultipartFile.fromPath('images[]', file.path));
    }
    return await request.send();
  }

  String getOfferImageUrl(id) {
    return _baseUrl + '/images/$id';
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
  // _setFormHeaders() => {
  //       'Content-type': 'application/x-www-form-urlencoded',
  //       'Accept': 'application/json',
  //       'Authorization': 'Bearer $token'
  //     };
}
