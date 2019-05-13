import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../provide/update_provide.dart';
import '../model/update_page/comicInfo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../config/colors_config.dart';
import '../config/service_url.dart';
import '../service/service_method.dart';

class UpdatePage extends StatefulWidget {
  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  List<ComicInfoModel> comicList = [];

  @override
  void initState() {
    super.initState();
    _getTodayRecommendList();
  }

  _getTodayRecommendList() async {
    await request(todayRecommendList, formData: {"page": 0, "day": 4})
        .then((val) {
      ComicModel comicModel = ComicModel.fromJson(val["data"]);
      setState(() {
        comicList = comicModel.returnData.comics;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("有妖气漫画"),
      ),
      body: ListView.builder(
        itemCount: comicList.length,
        itemBuilder: (context, index) {
          return _comicItem(comicList[index]);
        },
      ),
    );
  }

  Widget _comicItem(ComicInfoModel model) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: ScreenUtil().setWidth(750),
        height: ScreenUtil().setWidth(750) * 296.0 / 504.0 + 60,
        child: Column(
          children: <Widget>[
            Image.network(
              model.cover,
              width: ScreenUtil().setWidth(750),
              height: ScreenUtil().setWidth(750) * 296.0 / 504.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              margin: EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    model.comicName,
                    style: TextStyle(
                        color: hex_333333,
                        fontSize: ScreenUtil().setSp(26),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    model.author,
                    style: TextStyle(
                        color: hex_999999, fontSize: ScreenUtil().setSp(20)),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              margin: EdgeInsets.only(bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "更新至 ${model.description}",
                    style: TextStyle(
                        color: hex_999999, fontSize: ScreenUtil().setSp(20)),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "全集",
                        style: TextStyle(
                            color: hex_999999,
                            fontSize: ScreenUtil().setSp(20)),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        size: 20,
                        color: hex_999999,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
