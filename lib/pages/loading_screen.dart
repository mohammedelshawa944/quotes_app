import 'package:flutter/material.dart';
import 'package:quotes_app/helper/network_helper/network.dart';
import 'package:quotes_app/models/image_model/image_model.dart';
import 'package:quotes_app/models/quotes_model/quotes_model.dart';
import 'package:quotes_app/pages/home_page.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  QuotableModel quotableModel = QuotableModel();
  ImageModel imageModel = ImageModel();

  void getDataQuotable( )async{
    quotableModel = await NetworkHelper().getQuotableDataNetwork('https://api.quotable.io/random');
    imageModel =await  NetworkHelper().getImageDataNetwork('https://random.imagecdn.app/v1/image?width=500&height=150&category=${quotableModel.tags??'Sport'}&format=json');

    print(quotableModel.tags);
    if(mounted){
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return HomePage(modelIm: imageModel,modelQu: quotableModel,);
      }));
    }
  }


  @override
  void initState(){
    getDataQuotable();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
