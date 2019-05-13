import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import './provide/currentIndex_provide.dart';
import './provide/update_provide.dart';
import './provide/discover_provide.dart';
import './provide/mine_provide.dart';
import './pages/index_page.dart';
import 'package:fluro/fluro.dart';
import './routers/routers.dart';
import './routers/application.dart';


void main(){

  var currentIndex = CurrentIndexProvide();
  var updateProvide = UpdateProvide();
  var discoverProvide = DiscoverProvide();
  var mineProvide = MineProvide();
  var provides = Providers();

  provides
  ..provide(Provider<CurrentIndexProvide>.value(currentIndex))
  ..provide(Provider<UpdateProvide>.value(updateProvide))
  ..provide(Provider<DiscoverProvide>.value(discoverProvide))
  ..provide(Provider<MineProvide>.value(mineProvide));

  runApp(ProviderNode(child: MyApp(),providers: provides,));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    final router = Router();
    Routes.configureRoutes(router);
    Application.router=router;

    return MaterialApp(
      title: '有妖气漫画',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Application.router.generator,
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: IndexPage(),
    );
  }
}

