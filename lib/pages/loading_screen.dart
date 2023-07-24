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


  ImageModel imageModel = ImageModel();

  void getDataImage()async{
    await NetworkHelper().getImageDataNetwork('https://random.imagecdn.app/v1/image?width=500&height=150&category=Business&format=json').then((value) {
      imageModel = value;
    });
  }

  QuotableModel quotableModel = QuotableModel();
  List<String>? tags=[];

  void getDataQuotable()async{
    await NetworkHelper().getQuotableDataNetwork('https://api.quotable.io/random').then((value) {
      quotableModel = value;
    });
    tags = quotableModel.tags;
    if(mounted){
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return HomePage(model:  imageModel, quotableModel: quotableModel,);
      }));
    }
  }


  @override
  void initState(){
    getDataImage();
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
