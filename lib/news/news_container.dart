import 'package:flutter/material.dart';
import 'package:flutter_app_news_c9_fri/api/api_manger.dart';
import 'package:flutter_app_news_c9_fri/model/NewsResponse.dart';
import 'package:flutter_app_news_c9_fri/model/SourceResponse.dart';
import 'package:flutter_app_news_c9_fri/news/news_item.dart';

class NewsContainer extends StatefulWidget{
  Source source ;
  NewsContainer({required this.source});

  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
      future: ApiManager.getNewsBySourceId(widget.source.id??""),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          }else if(snapshot.hasError){
            return Column(
              children: [
                Text("Something went wrong"),
                ElevatedButton(onPressed: (){
                  ApiManager.getNewsBySourceId(widget.source.id??"");
                  setState(() {

                  });
                }, child: Text('Try Again'))
              ],
            );
          }
          /// response
          if(snapshot.data?.status != 'ok'){
            return Column(
              children: [
                Text(snapshot.data?.message ?? "Something went wrong"),
                ElevatedButton(onPressed: (){
                  ApiManager.getNewsBySourceId(widget.source.id??"");
                  setState(() {

                  });
                }, child: Text('Try Again'))
              ],
            );
          }
          var newsList = snapshot.data?.articles ?? [];
          return ListView.builder(
              itemBuilder: (context,index){
                return NewsItem(news: newsList[index]);
              },
            itemCount: newsList.length,
          );
        }
    );
  }
}
