import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:news_api/Provider/Artical.dart';
import 'package:http/http.dart' as http;

class News with ChangeNotifier{
  List<Artical> _news=[]; 
  
  List<Artical> get news{
    return [..._news];
  }

Artical findproductid(String title) {
  return _news.firstWhere((element) => element.title==title);
}
  Future<void> getNews() async{

    String url ="https://newsapi.org/v2/everything?q=apple&from=2021-10-18&to=2021-10-18&sortBy=popularity&apiKey=07cc69cee1aa41899a02362d223ee561";
    //"https://newsapi.org/v2/everything?domains=wsj.com&apiKey=07cc69cee1aa41899a02362d223ee561"; 
    //"http://newsapi.org/v2/top-headlines?country=in&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=";
 
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);
    
    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){
          Artical article = Artical(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          _news.add(article);
        }notifyListeners();

      });
    }


  }
 
  
}