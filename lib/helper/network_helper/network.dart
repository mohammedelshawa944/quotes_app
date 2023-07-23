import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quotes_app/models/image_model/image_model.dart';

class NetworkHelper{

  Future<ImageModel> getDataNetwork() async{

    late ImageModel finalResponse;
    String url = 'https://random.imagecdn.app/v1/image?width=500&height=150&category=buildings&format=json';

    try{
      http.Response response = await http.get(Uri.parse(url));

      if(response.statusCode == 200){
        Map<String, dynamic> decodeJson =  jsonDecode(response.body);

        ImageModel? imageModel = ImageModel.fromJson(decodeJson);
        finalResponse = imageModel;

      }
    }catch(e){
      print('Login service $e');
    }
    return finalResponse;
  }
}
