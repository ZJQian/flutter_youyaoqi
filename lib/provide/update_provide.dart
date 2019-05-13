import 'package:provide/provide.dart';
import 'package:flutter/material.dart';
import '../config/service_url.dart';
import '../service/service_method.dart';
import '../model/update_page/comicInfo.dart';
import 'dart:convert';

class UpdateProvide with ChangeNotifier {

  List<ComicInfoModel> comicList = [];

  getTodayRecommendList() async {
    await request(todayRecommendList, formData: {"page":0,"day":4}).then((val) {
        // var responseData= json.decode(val.toString());
        ComicModel comicModel = ComicModel.fromJson(val["data"]);
        comicList = comicModel.returnData.comics;
        print(comicList.length);
        notifyListeners();
    });
  }
}