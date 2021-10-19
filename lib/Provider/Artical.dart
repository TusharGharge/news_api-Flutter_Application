

import 'package:flutter/material.dart';

class Artical with ChangeNotifier{
  final String title;
   final String author;
  final String description;
  final String urlToImage;
  final DateTime? publshedAt;
  final String content;
  final String articleUrl;


Artical({required this.title,required this.author,required this.description,required this.articleUrl,required this.content,this.publshedAt,required this.urlToImage});
}