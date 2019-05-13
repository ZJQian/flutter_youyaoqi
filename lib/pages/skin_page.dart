import 'package:flutter/material.dart';
import '../service/service_method.dart';
import '../model/mine_page/skinModel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../config/device_config.dart';
import '../config/service_url.dart';

class SkinPage extends StatefulWidget {
  @override
  _SkinPageState createState() => _SkinPageState();
}

class _SkinPageState extends State<SkinPage> {
  List<SkinItemModel> skinsList = [];

  @override
  void initState() {
    super.initState();
    _getSkinList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 1.0),
      appBar: AppBar(
        title: Text("皮肤"),
      ),
      body: ListView.builder(
        itemCount: skinsList.length,
        itemBuilder: (context, index) {
          return _skinItem(skinsList[index]);
        },
      ),
    );
  }

  Widget _skinItem(SkinItemModel skinItemModel) {
    return Container(
      width: screen_width,
      margin: EdgeInsets.only(top: 15, left: 15, right: 15),
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
          Image.network(
            skinItemModel.cover,
            width: (screen_width - 30) * 0.46,
            height: (screen_width - 30) * 0.46,
          ),
          Container(
            width: (screen_width - 30) * 0.54,
            height: (screen_width - 30) * 0.46,
            padding: EdgeInsets.all(
              20.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      skinItemModel.skinName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: (screen_width - 30) * 0.25,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text("下载使用"),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _getSkinList() async {
    await get(skinList, formData: {"skin_UI_version": "400002"}).then((val) {
      print(val);
      SkinModel skinModel = SkinModel.fromJson(val['data']);
      setState(() {
        skinsList = skinModel.returnData.skinList;
      });
    });
  }
}
