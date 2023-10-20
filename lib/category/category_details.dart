import 'package:flutter/material.dart';
import 'package:flutter_app_news_c9_fri/api/api_manger.dart';
import 'package:flutter_app_news_c9_fri/model/SourceResponse.dart';
import 'package:flutter_app_news_c9_fri/model/category.dart';
import 'package:flutter_app_news_c9_fri/tabs/tab_container.dart';

class CategoryDetails extends StatefulWidget {
  Category category ;
  CategoryDetails({required this.category});
  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse>(
        future: ApiManager.getSources(widget.category.id),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          } else if(snapshot.hasError){
            return Column(
              children: [
                Text("something went wrong"),
                ElevatedButton(onPressed: (){
                  ApiManager.getSources(widget.category.id);
                  setState(() {

                  });
                }, child: Text('Try Again'))
              ],
            );
          }
          /// response
          if(snapshot.data?.status != 'ok'){
            /// code , message
            return Column(
              children: [
                Text(snapshot.data?.message??""),
                ElevatedButton(onPressed: (){
                  ApiManager.getSources(widget.category.id);
                  setState(() {

                  });
                }, child: Text('Try Again'))
              ],
            );
          }
          var sourcesList = snapshot.data?.sources ?? [];
          return TabContainer(sourcesList: sourcesList);
        }
    );
  }
}
