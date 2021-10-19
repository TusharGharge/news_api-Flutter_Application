// ignore_for_file: dead_code

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Newsweb extends StatefulWidget {
   static const routname='/newsweb';
final String? posturll;
const Newsweb({ this.posturll});

  @override
  
  _NewswebState createState() => _NewswebState();
}

class _NewswebState extends State<Newsweb> {
   bool _isloading=false;
  @override
  // ignore: must_call_super
  void initState(){
    _isloading=false;
    super.initState();
  }
  Widget build(BuildContext context) {
   
    print(widget.posturll);
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.white, title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.grey,
                    size: 23,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
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
        //
         body:_isloading?const Center(child: CircularProgressIndicator()): WebView(initialUrl: widget.posturll,javascriptMode: JavascriptMode.unrestricted,),) ,
      
    );
  }
}