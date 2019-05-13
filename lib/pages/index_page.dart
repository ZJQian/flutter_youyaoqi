import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './discover_page.dart';
import './library_page.dart';
import './mine_page.dart';
import './update_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../provide/currentIndex_provide.dart';


class IndexPage extends StatelessWidget {

  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon:Icon(CupertinoIcons.home),
      title:Text('更新')
    ),
    BottomNavigationBarItem(
      icon:Icon(CupertinoIcons.search),
      title:Text('发现')
    ),
    BottomNavigationBarItem(
      icon:Icon(CupertinoIcons.bookmark),
      title:Text('书架')
    ),
     BottomNavigationBarItem(
      icon:Icon(CupertinoIcons.person),
      title:Text('我的')
    ),
  ];

   final List<Widget> tabBodies = [
      UpdatePage(),
      DiscoverPage(),
      LibraryPage(),
      MinePage()
   ];


  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Provide<CurrentIndexProvide>(

      builder: (context,child,val){
        int currentIndex= Provide.value<CurrentIndexProvide>(context).currentIndex;
        print(currentIndex);
        return Scaffold(
            backgroundColor: Colors.white,
            bottomNavigationBar: CupertinoTabBar(
              backgroundColor: Colors.white,
              currentIndex: currentIndex,
              items:bottomTabs,
              onTap: (index){
                Provide.value<CurrentIndexProvide>(context).changeIndex(index);
              },
            ),
             body: IndexedStack(
                    index: currentIndex,
                    children: tabBodies
                  ),
        ); 
      }
    );
  }
}