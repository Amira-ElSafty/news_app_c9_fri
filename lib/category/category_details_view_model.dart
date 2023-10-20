import 'package:flutter/material.dart';
import 'package:flutter_app_news_c9_fri/api/api_manger.dart';
import 'package:flutter_app_news_c9_fri/model/SourceResponse.dart';

class CategoryDetailsViewModel extends ChangeNotifier{
  List<Source>? sourceList ;
  String? errorMessage ;

  void getSourceByCategory(String categoryId)async{
    sourceList = null ;
    errorMessage = null ;
    notifyListeners();
    try{
      var response = await ApiManager.getSources(categoryId);
      if(response.status == 'error'){
        errorMessage = response.message ;
      }else{  /// status = 'ok
        sourceList = response.sources ;
      }
    }catch(e){
      errorMessage = 'Error loading source list';
    }
    notifyListeners();
  }
}