import 'package:flutter/material.dart';
import 'package:quotes_app/helper/network_helper/network.dart';
import 'package:quotes_app/models/image_model/image_model.dart';
import 'package:quotes_app/models/quotes_model/quotes_model.dart';

class HomePage extends StatefulWidget {
   HomePage({Key? key, required this.model,required this.quotableModel}) : super(key: key);

  ImageModel model;
  QuotableModel quotableModel ;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                 image: NetworkImage('${widget.model.url}'),
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
                        IconButton(onPressed: (){}, icon: Icon(Icons.refresh,size: 30,),)
                      ],
                    ),
                    SizedBox(height: 20,),
                    Text('Quotes',style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple
                    ),),
                    SizedBox(height: 60,),
                    Container(
                      padding: EdgeInsets.all(13.0),
                      width: double.infinity,
                      height: 350,
                      decoration: BoxDecoration(
                        color: Color(0xffE6F0FD),
                        borderRadius: BorderRadius.circular(40)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Image(
                                image: AssetImage( 'assets/images/pngegg.png',),width: 80,height: 80,),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left:  30.0,top: 6),
                              child: Text('${widget.quotableModel.content}',style:
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
                              child: Text('- ${widget.quotableModel.author} -',style:
                              TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,

                              ),),
                            ),
                          )
                        ],
                      )
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
