import 'package:flutter/material.dart';
import 'package:quotes_app/helper/network_helper/network.dart';
import 'package:quotes_app/models/image_model/image_model.dart';
import 'package:quotes_app/pages/home_page.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  ImageModel model = ImageModel();
  String? imageUrl;

  void getDataImage()async{
    await NetworkHelper().getDataNetwork().then((value) {
      model = value;
    });
    print(model);

    if(mounted){
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return HomePage(model:  model,);
      }));
    }
  }

  @override
  void initState(){
    getDataImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
