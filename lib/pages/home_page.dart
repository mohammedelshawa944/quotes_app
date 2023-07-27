import 'package:flutter/material.dart';
import 'package:quotes_app/helper/network_helper/network.dart';
import 'package:quotes_app/models/image_model/image_model.dart';
import 'package:quotes_app/models/quotes_model/quotes_model.dart';
import 'package:quotes_app/pages/loading_screen.dart';

class HomePage extends StatefulWidget {
   HomePage({Key? key, required this.modelIm,required this.modelQu}) : super(key: key);

  ImageModel modelIm;
  QuotableModel modelQu ;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  void getDataQuotable( )async{
    widget.modelQu = await NetworkHelper().getQuotableDataNetwork('https://api.quotable.io/random');
    widget.modelIm =await  NetworkHelper().getImageDataNetwork('https://random.imagecdn.app/v1/image?width=500&height=150&category=${widget.modelQu.tags??'Sport'}&format=json');
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                 image: widget.modelIm.url != null? NetworkImage('${widget.modelIm.url}') :
                 NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJzMNWNPsA8KiUFY_YiEC7rub3JEDOCUXXHwJ40dp7&s'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.8), BlendMode.dstATop),
              ),
            ),
          ),
          SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.search,size: 30,),
                        SizedBox(width: 15,),
                        IconButton(onPressed: (){

                        }, icon: Icon(Icons.refresh,size: 30,color: Colors.black,),)
                      ],
                    ),
                    SizedBox(height: 60,),
                    // Text('Quotes',style: TextStyle(
                    //   fontSize: 40,
                    //   fontWeight: FontWeight.bold,
                    //   color: Colors.black
                    // ),),
                    SizedBox(height: 60,),
                    Container(
                      padding: EdgeInsets.all(13.0),
                      width: double.infinity,
                      height: 400,
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(40)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                              image: AssetImage( 'assets/images/pngegg.png',),width: 70,height: 70,),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left:  30.0),
                              child: Text('${widget.modelQu.content}',style:
                                TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,

                                ),),
                            ),
                          ),
                          SizedBox(height: 60,),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left:  130.0),
                              child: Text('- ${widget.modelQu.author} -',style:
                              TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,

                              ),),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(Icons.favorite_border),
                                Icon(Icons.save_alt),
                                Icon(Icons.share),
                              ],
                            ),
                          ),
                        ],
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 110.0,top: 150),
                      child: ElevatedButton(
                        style: ButtonStyle(backgroundColor:MaterialStatePropertyAll(Colors.white70)),
                          onPressed: (){},
                          child: Row(
                            children: [
                              Icon(Icons.camera_alt_outlined,color: Colors.black,size: 30,),
                              SizedBox(width: 8,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Take Screenshot',style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black
                                ),),
                              )
                            ],
                          ),
                      ),
                    )
                  ],
                ),
              ),
          ),
        ],
      ),
    );
  }
}
