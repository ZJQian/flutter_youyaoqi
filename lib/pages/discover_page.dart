import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../provide/discover_provide.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../model/discover_page/discoverModel.dart';
import '../config/device_config.dart';
import '../config/colors_config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../config/service_url.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../service/service_method.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {

  List<GalleryItemModel> bannerList = [];
  List<ModuleItemModel> modules = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDetectList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _swiper(context),
          Column(
            children: _modules(context, modules),
          )
        ],
      ),
    );
  }

  getDetectList() async {
    await request(detectList).then((val){
      DiscoverModel model = DiscoverModel.fromJson(val["data"]);
      setState(() {
        bannerList = model.returnData.galleryItems;
        modules = model.returnData.modules;
      });
      

    }); 
  } 

  /// 轮播图
  Widget _swiper(BuildContext context) {
    // List<GalleryItemModel> bannerList = Provide.value<DiscoverProvide>(context).bannerList;
    return Container(
      color: Colors.white,
      height: screen_width * 400.0 / 414.0,
      width: screen_width,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {},
            child: Stack(
              children: <Widget>[
                Image.network("${bannerList[index].cover}", fit: BoxFit.fill),
                Image.network("${bannerList[index].topCover}", fit: BoxFit.fill)
              ],
            ),
          );
        },
        itemCount: bannerList.length,
        pagination: new SwiperPagination(),
        autoplay: true,
        autoplayDelay: 5000,
      ),
    );
  }

  List<Widget> _modules(BuildContext context, List<ModuleItemModel> modules) {
    List<Widget> widgets = [];
    if (modules.length > 0) {
      modules.forEach((module) {
        if (module.moduleType == 2 && module.uiType == 5) {
        } else if (module.moduleType == 2 && module.uiType == 1) {
          List items = module.items;
          List<GalleryItemModel> adItems = [];
          items.forEach((subItem) {
            adItems.add(GalleryItemModel.fromJson(subItem));
          });
          var colum = Column(
            children: <Widget>[
              Container(
                width: screen_width,
                height: screen_width * 138.0 / 414.0,
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                child: Image.network(adItems[0].cover),
              )
            ],
          );
          widgets.add(colum);
        } else if (module.moduleType == 1 && module.uiType == 1) {
          widgets.add(_equalGridItem(
              module, context, 2, 414.0 / 350.0, screen_width * 0.75));
        } else if (module.moduleType == 1 && module.uiType == 2) {
          widgets.add(_equalGridItem(
              module, context, 3, 414.0 / 680.0, screen_width * 0.5));
        } else if (module.moduleType == 1 && module.uiType == 3) {
          widgets.add(
              _equalGridItem(module, context, 3, 414.0 / 680.0, screen_width));
        } else if (module.moduleType == 1 && module.uiType == 4) {
          List items = module.items;
          List<GridItemModel> gridItems = [];
          items.forEach((subItems) {
            gridItems.add(GridItemModel.fromJson(subItems[0]));
          });
          double img_width = (screen_width - 34) / 3.0;
          double img_height = img_width * 546.0 / 414.0;
          var colum = Stack(
            children: <Widget>[
              _titleItem(module.moduleInfo),
              Container(
                width: screen_width,
                height: img_width * 3.3 + ScreenUtil().setHeight(70),
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                margin: EdgeInsets.only(top: ScreenUtil().setHeight(30)),
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 6,
                  itemCount: gridItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _gridViewItem(gridItems[index],
                        img_width: index == 0 ? img_width * 2 : img_width,
                        img_height: img_height);
                  },
                  staggeredTileBuilder: (int index) {
                    return StaggeredTile.count(index == 0 ? 4 : 2, 3.3);
                  },
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                  physics: NeverScrollableScrollPhysics(),
                ),
              )
            ],
          );
          widgets.add(colum);
        } else if (module.moduleType == 3 && module.uiType == 1) {
          List items = module.items;
          List<AnLiItemModel> anliItems = [];
          items.forEach((subItem) {
            anliItems.add(AnLiItemModel.fromJson(subItem));
          });
          var colum = Column(
            children: <Widget>[
              _titleItem(module.moduleInfo),
              _listView(context, anliItems, screen_width * 0.4, 414.0 / 234.0)
            ],
          );
          widgets.add(colum);
        } else if (module.moduleType == 2 && module.uiType == 4) {
          List items = module.items;
          List<GalleryItemModel> mengxinItems = [];
          items.forEach((subItem) {
            mengxinItems.add(GalleryItemModel.fromJson(subItem));
          });
          var colum = Column(
            children: <Widget>[
              _titleItem(module.moduleInfo),
              _listView(
                  context, mengxinItems, screen_width * 0.52, 414.0 / 307.0)
            ],
          );
          widgets.add(colum);
        } else {
          var colum = Column(
            children: <Widget>[
              _titleItem(module.moduleInfo),
            ],
          );
          widgets.add(colum);
        }
      });
    }
    return widgets;
  }

  Widget _equalGridItem(module, context, int crossAxisCount,
      double childAspectRatio, double height) {
    List items = module.items;
    List<GridItemModel> gridItems = [];
    items.forEach((subItems) {
      gridItems.add(GridItemModel.fromJson(subItems[0]));
    });
    var colum = Column(
      children: <Widget>[
        _titleItem(module.moduleInfo),
        _gridView(context, gridItems, crossAxisCount, childAspectRatio, height)
      ],
    );

    return colum;
  }

  Widget _titleItem(ModuleInfo moduleInfo) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      width: screen_width,
      height: 35,
      child: Row(
        children: <Widget>[
          moduleInfo.icon == baseImgURL
              ? Text("")
              : Image.network(
                  moduleInfo.icon,
                  width: ScreenUtil().setWidth(35),
                ),
          Text(
            " " + moduleInfo.title,
            style: TextStyle(
                fontSize: ScreenUtil().setSp(30), fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _listView(context, List items, listViewHeight, childAspectRatio) {
    return Container(
      width: screen_width,
      height: listViewHeight,
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      child: ListView.builder(
        itemCount: items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return _listViewItem(items[index], listViewHeight, childAspectRatio);
        },
      ),
    );
  }

  Widget _listViewItem(item, listViewHeight, childAspectRatio) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: listViewHeight * childAspectRatio,
        height: listViewHeight,
        padding: EdgeInsets.only(right: 6.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(item.cover),
        ),
      ),
    );
  }

  Widget _gridView(BuildContext context, List<GridItemModel> gridItems,
      int crossAxisCount, double childAspectRatio, double height) {
    return Container(
      width: screen_width,
      height: height,
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 5.0,
        childAspectRatio: childAspectRatio,
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
        children: gridItems.map((gridItem) {
          return _gridViewItem(gridItem);
        }).toList(),
      ),
    );
  }

  Widget _gridViewItem(GridItemModel gridItemModel,
      {double img_width, double img_height}) {
    return InkWell(
      onTap: () {},
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: img_width == null
                  ? Image.network(gridItemModel.cover)
                  : Image.network(
                      gridItemModel.cover,
                      width: img_width,
                      height: img_height,
                      fit: BoxFit.fitHeight,
                    ),
            ),
            Text(
              gridItemModel.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(26),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              gridItemModel.subTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(20), color: hex_999999),
            )
          ],
        ),
      ),
    );
  }
}
