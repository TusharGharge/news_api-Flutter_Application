// ignore: file_names
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_api/Provider/articals.dart';
import 'package:news_api/Screen/newsdetails.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const routename = '/Homepage';
  

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 
  void initState(){
     Provider.of<News>(context, listen: false).getNews();
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'Assets/chili.jpg',
                fit: BoxFit.contain,
                height: 32,
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: const Text('RED NEWS',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    )),
              )
            ],
          ),
          elevation: 7,
        ),
        body: FutureBuilder(
          future: Provider.of<News>(context, listen: false).getNews(),
          builder: (ctx, dataSnapshot) {
            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (dataSnapshot.error == null) {
                return Center(child: Text("Error Occured"));
              } else {
                return Consumer<News>(
                  builder: (ctx, orderData, child) => ListView.builder(
                    itemCount: orderData.news.length,
                    // ignore: avoid_unnecessary_containers
                    itemBuilder: (ctx, i) =>Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            20,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 7), // changes position of shadow
            ),
          ],
          // border: Border.all(color: Colors.black)),
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
Navigator.pushNamed(
      context,
      Newsdetails.routeName,
      arguments:orderData.news[i].title,
    );
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.215,
                width:double.infinity,
                child:Image.network(orderData.news[i].urlToImage,fit: BoxFit.cover,),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 8, right: 10, left: 15),
              child: Container(
                child: Text(
                  orderData.news[i].title,
                  style: TextStyle(fontSize: 15
                  ,fontWeight: FontWeight.bold,),
                ),
              ),
            )
          ],
        ),
      ),
    )
                  ),
                );
              }
            }
          },
        ),
      ),
    );
  }
}


// class Mainnewswidget extends StatelessWidget {
//   final String? imageString;
//   final String? title;
//   final String? id;
//   const Mainnewswidget({
//     this.title,
//      this.imageString,
//      this.id,
   
//   });

//   // final Size Size;

//   @override
//   Widget build(BuildContext context) {
//     return 
  
// }
