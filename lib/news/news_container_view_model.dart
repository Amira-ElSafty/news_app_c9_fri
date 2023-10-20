import 'package:flutter/material.dart';
import 'package:flutter_app_news_c9_fri/api/api_manger.dart';
import 'package:flutter_app_news_c9_fri/model/NewsResponse.dart';

class NewsContainerViewModel extends ChangeNotifier{
  List<News>? newsList ;
  String? errorMessage ;
  void getNewsBySourceId(String sourceId)async{
    newsList = null ;
    errorMessage = null ;
    notifyListeners();
    try{
      var response = await ApiManager.getNewsBySourceId(sourceId);
      if(response.status == 'error'){
        errorMessage = response.message ;
      }else{
        newsList = response.articles ;
      }
    }catch(e){
      errorMessage = 'Error Loading News List';
    }
    notifyListeners();
  }
}