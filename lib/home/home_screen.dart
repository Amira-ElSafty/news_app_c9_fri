import 'package:flutter/material.dart';
import 'package:flutter_app_news_c9_fri/api/api_manger.dart';
import 'package:flutter_app_news_c9_fri/category/category_details.dart';
import 'package:flutter_app_news_c9_fri/category/category_fragments.dart';
import 'package:flutter_app_news_c9_fri/home/home_drawer.dart';
import 'package:flutter_app_news_c9_fri/model/SourceResponse.dart';
import 'package:flutter_app_news_c9_fri/model/category.dart';
import 'package:flutter_app_news_c9_fri/my_theme.dart';
import 'package:flutter_app_news_c9_fri/settings/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            color: MyTheme.whiteColor,
            child: Image.asset(
              'assets/images/main_background.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            )),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              selectedDrawerItem == HomeDrawer.settings ? 'Settings':
              selectedCategory == null ?'News App' : selectedCategory!.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          drawer: Drawer(
            child: HomeDrawer(onDrawerItemClick: onDrawerItemClick),
          ),
          body:selectedDrawerItem == HomeDrawer.settings ?
              SettingTab():
          selectedCategory == null ?
          CategoryFragment(onCategoryClick:onCategoryClick ):
          CategoryDetails(category: selectedCategory!),
        ),
      ],
    );
  }

  Category? selectedCategory ;

  void onCategoryClick(Category newSelectedCategory){
    selectedCategory = newSelectedCategory ;
    setState(() {

    });
  }

  int selectedDrawerItem = HomeDrawer.categories ;
  void onDrawerItemClick(int newSelectedDrawerItem){
    selectedDrawerItem = newSelectedDrawerItem ;
    selectedCategory = null ;
    Navigator.pop(context);
    setState(() {

    });
  }
}
