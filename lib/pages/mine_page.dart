import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../provide/mine_provide.dart';
import 'package:provide/provide.dart';
import '../config/device_config.dart';
import '../config/colors_config.dart';
import '../routers/application.dart';
import 'package:fluro/fluro.dart';

class MinePage extends StatelessWidget {

  List categories = [
      {"icon": "images/mine/sep_register.png", "title": "签到"},
      {"icon": "images/mine/sep_mywallet.png", "title": "钱包"},
      {"icon": "images/mine/sep_subscription.png", "title": "订阅"},
      {"icon": "images/mine/sep_fengyintu.png", "title": "封印图"},
      {"icon": "images/mine/sep_theme.png", "title": "皮肤"},
      {"icon": "images/mine/sep_help.png", "title": "帮助反馈"},
      {"icon": "images/mine/sep_beijing.png", "title": "首都网警"},
      {"icon": "images/mine/sep_auther.png", "title": "作者中心"},
      {"icon": "images/mine/sep_setting.png", "title": "设置"},
    ];

  @override
  Widget build(BuildContext context) {
    
    return ListView(
      padding: EdgeInsets.only(top: 0),
      children: <Widget>[
        Stack(
          children: <Widget>[
            _header(),
            _info(),
          ],
        ),
        Container(
          color: Colors.white,
          width: ScreenUtil().setWidth(750),
          height: ScreenUtil().setWidth(750),
          child: GridView.count(
            padding: EdgeInsets.only(top: 0),
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            children: categories.map((item) {
              return _categoryItem(context, item);
            }).toList(),
          ),
        )
      ],
    );
  }

  Widget _header() {
    return Container(
      width: screen_width,
      height: screen_width * 310.0 / 621.0,
      child: Image.asset("images/mine/mine_sky_bg.png"),
    );
  }

  Widget _info() {
    return Container(
      width: screen_width,
      height: screen_width * 0.25,
      margin: EdgeInsets.only(
          left: 20,
          right: 20,
          top: screen_width * 310.0 / 621.0 - 20,
          bottom: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(5.0, 5.0),
              blurRadius: 5.0,
            )
          ]),
      child: Row(
        children: <Widget>[
          Container(
            width: (screen_width - 41) / 2.0,
            height: screen_width * 0.25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "未开通",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(30), color: hex_333333),
                ),
                Text(
                  "我的vip",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(25), color: hex_999999),
                )
              ],
            ),
          ),
          Container(
            width: 1,
            margin: EdgeInsets.only(top: 20, bottom: 20),
            color: Colors.black12,
          ),
          Container(
            width: (screen_width - 41) / 2.0,
            height: screen_width * 0.25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "余额 0",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(30), color: hex_333333),
                ),
                Text(
                  "我的妖气币",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(25), color: hex_999999),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _categoryItem(context, item) {

    int index = categories.indexOf(item);
    return InkWell(
      onTap: () {
        if (index == 6) {
          Application.router.navigateTo(context, "/web",transition: TransitionType.inFromRight);
        }else if (index == 4){
          Application.router.navigateTo(context, "/skin",transition: TransitionType.inFromRight);
        }else{
          Provide.value<MineProvide>(context).openPhotoLibrary();
        }
      },
      child: Container(
        width: ScreenUtil().setWidth(250),
        height: ScreenUtil().setWidth(250),
        color: Colors.transparent,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              item["icon"],
              width: ScreenUtil().setWidth(80),
              height: ScreenUtil().setWidth(80),
            ),
            Text(item["title"])
          ],
        ),
      ),
    );
  }
}
