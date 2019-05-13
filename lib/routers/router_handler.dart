import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/web_page.dart';
import '../pages/skin_page.dart';

Handler webHandler =Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    // String goodsId = params['id'].first;
    return WebPage();
  }
);

Handler skinHandler =Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    return SkinPage();
  }
);