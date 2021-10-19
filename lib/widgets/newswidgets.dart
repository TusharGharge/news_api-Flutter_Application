
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_api/Screen/newsweb.dart';

class newswidget extends StatelessWidget {
  final String? imageurl;
  final String? title;
  final String? description;
  final String? articalurl;
  final DateTime? publishAt;
  final String? Author;
  final String? content;
const  newswidget({
    this.Author,
    this.title,
    this.description,this.articalurl,this.imageurl,this.publishAt, this.content,
   
  
  });



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 15.0, bottom: 15, left: 5, right: 5),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.33,
              width: double.infinity,
              child: Image.network(
              imageurl!,
                fit: BoxFit.cover,
                //height: 32,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 2.0, left: 15, right: 10, bottom: 10),
            child: Container(
                child: Column(
              children: [
               Text(
                title!,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      fontFamily: 'fila'),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                    description!,
                    style: TextStyle(fontSize: 20, color: Colors.black87)),
                    
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: (){
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Newsweb(
                                  posturll:articalurl,
                                ),
                              ));
    
                  },
                  child: Row(
                    children: [
                        Text(Author!,style: TextStyle(fontSize: 16),),
                        SizedBox(width:5),
                     Text(DateFormat.yMMMMd().format(publishAt!),style: TextStyle(fontSize: 16),),
                   
                     
                    ],
                  ),
                ),
              ],
            )),
          )
        ],
      )),
    );
  }
}
