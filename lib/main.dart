import 'package:flutter/material.dart';
import 'package:news_api/Provider/articals.dart';
import 'package:provider/provider.dart';

import 'Screen/Homepage.dart';
import 'Screen/newsdetails.dart';
import 'Screen/newsweb.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx)=>News(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
        theme: ThemeData(
      
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
        routes: {
          Newsweb.routname:(ctx)=>Newsweb(),
          Newsdetails.routeName:(ctx)=>Newsdetails(),
          HomePage.routename:(ctx)=>HomePage(),

        },),
    );
    
  }
}
