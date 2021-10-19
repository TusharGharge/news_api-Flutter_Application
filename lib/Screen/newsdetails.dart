import 'package:flutter/material.dart';
import 'package:news_api/Provider/articals.dart';
import 'package:news_api/Screen/newsweb.dart';
import 'package:intl/intl.dart'; // for date format
import 'package:intl/date_symbol_data_local.dart';
import 'package:news_api/widgets/newswidgets.dart';
import 'package:provider/provider.dart';

class Newsdetails extends StatelessWidget {
  static const routeName = '/newsdetails';

  Newsdetails({Key? key}) : super(key: key);

  //const News({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      var Size = MediaQuery.of(context).size;
    // ignore: non_constant_identifier_names
    final Producttitle= ModalRoute.of(context)!.settings.arguments as String; 
    final loadedProduct = Provider.of<News>(context,listen: false).findproductid(Producttitle);

   
 
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.grey,
                    size: 23,
                  ),
                  onPressed: () {Navigator.of(context).pop();} ,
                ),
                Image.asset(
                  'Assets/chili.jpg',
                  fit: BoxFit.contain,
                  height: 32,
                ),
                Text('News',style: TextStyle(color:Colors.black),)
              ],
            ),
            
          ),
        ),
        body: newswidget(title: loadedProduct.title,Author: loadedProduct.author,description: loadedProduct.description,imageurl: loadedProduct.urlToImage,publishAt: loadedProduct.publshedAt,articalurl: loadedProduct.articleUrl,),
      ),
    );
  }


}
