import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quotes_app/models/image_model/image_model.dart';
import 'package:quotes_app/models/quotes_model/quotes_model.dart';

class NetworkHelper{


  Future<ImageModel> getImageDataNetwork(String urlImage) async{

    late ImageModel finalResponse;

    try{
      http.Response response = await http.get(Uri.parse(urlImage));

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

  Future<QuotableModel> getQuotableDataNetwork(String urlQuotable) async{

    late QuotableModel finalResponse;

    try{
      http.Response response = await http.get(Uri.parse(urlQuotable));

      if(response.statusCode == 200){
        Map<String, dynamic> decodeJson =  jsonDecode(response.body);

        QuotableModel? quotableModel = QuotableModel.fromJson(decodeJson);
        finalResponse = quotableModel;

      }
    }catch(e){
      print('Login service $e');
    }
    return finalResponse;
  }
}
