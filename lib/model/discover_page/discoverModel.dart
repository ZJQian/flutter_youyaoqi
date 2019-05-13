
class DiscoverModel {
  int stateCode;
  String message;
  ReturnData returnData;

  DiscoverModel({this.stateCode, this.message, this.returnData});

  DiscoverModel.fromJson(Map<String, dynamic> json) {
    stateCode = json['stateCode'];
    message = json['message'];
    returnData = json['returnData'] != null
        ? new ReturnData.fromJson(json['returnData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stateCode'] = this.stateCode;
    data['message'] = this.message;
    if (this.returnData != null) {
      data['returnData'] = this.returnData.toJson();
    }
    return data;
  }
}

class ReturnData {
  List<GalleryItemModel> galleryItems;
  List<Map> textItems;
  List<ModuleItemModel> modules;
  FloatItemModel floatItems;
  String editTime;
  String defaultSearch;

  ReturnData(
      {this.galleryItems,
      this.textItems,
      this.modules,
      this.floatItems,
      this.editTime,
      this.defaultSearch});

  ReturnData.fromJson(Map<String, dynamic> json) {
    if (json['galleryItems'] != null) {
      galleryItems = new List<GalleryItemModel>();
      json['galleryItems'].forEach((v) {
        galleryItems.add(new GalleryItemModel.fromJson(v));
      });
    }
    if (json['textItems'] != null) {
      textItems = new List<Map>();
      json['textItems'].forEach((v) {
        textItems.add(v);
      });
    }
    if (json['modules'] != null) {
      modules = new List<ModuleItemModel>();
      json['modules'].forEach((v) {
        modules.add(new ModuleItemModel.fromJson(v));
      });
    }
    floatItems = json['floatItems'] != null
        ? new FloatItemModel.fromJson(json['floatItems'])
        : null;
    editTime = json['editTime'];
    defaultSearch = json['defaultSearch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.galleryItems != null) {
      data['galleryItems'] = this.galleryItems.map((v) => v.toJson()).toList();
    }
    if (this.textItems != null) {
      data['textItems'] = this.textItems.map((v) => v).toList();
    }
    if (this.modules != null) {
      data['modules'] = this.modules.map((v) => v.toJson()).toList();
    }
    if (this.floatItems != null) {
      data['floatItems'] = this.floatItems.toJson();
    }
    data['editTime'] = this.editTime;
    data['defaultSearch'] = this.defaultSearch;
    return data;
  }
}

class GalleryItemModel {
  int linkType;
  String cover;
  int id;
  String title;
  String content;
  String topCover;
  List<Map> ext;

  GalleryItemModel(
      {this.linkType,
      this.cover,
      this.id,
      this.title,
      this.content,
      this.topCover,
      this.ext
      });

  GalleryItemModel.fromJson(Map<String, dynamic> json) {
    linkType = json['linkType'];
    cover = json['cover'];
    id = json['id'];
    title = json['title'];
    content = json['content'];
    topCover = json['topCover'];
    if (json['ext'] != null) {
      ext = new List<Map>();
      json['ext'].forEach((v) {
        ext.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['linkType'] = this.linkType;
    data['cover'] = this.cover;
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['topCover'] = this.topCover;
    if (this.ext != null) {
      data['ext'] = this.ext.map((v) => v).toList();
    }
    return data;
  }
}

class FloatItemModel {
  bool localInfoButton;

  FloatItemModel({this.localInfoButton});

  FloatItemModel.fromJson(Map<String, dynamic> json) {
    localInfoButton = json['localInfoButton'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['localInfoButton'] = this.localInfoButton;
    return data;
  }
}

class ModuleItemModel {
  int moduleType;
  int uiType;
  ModuleInfo moduleInfo;
  List items;

  ModuleItemModel({this.moduleType, this.uiType, this.moduleInfo, this.items});

  ModuleItemModel.fromJson(Map<String, dynamic> json) {
    moduleType = json['moduleType'];
    uiType = json['uiType'];
    moduleInfo = json['moduleInfo'] != null
        ? new ModuleInfo.fromJson(json['moduleInfo'])
        : null;
    if (json['items'] != null) {
      items = new List();
      json['items'].forEach((v) {
        items.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['moduleType'] = this.moduleType;
    data['uiType'] = this.uiType;
    if (this.moduleInfo != null) {
      data['moduleInfo'] = this.moduleInfo.toJson();
    }
    if (this.items != null) {
      data['items'] = this.items.map((v) => v).toList();
    }
    return data;
  }
}

class GridItemModel {
  int comicId;
  String title;
  String cover;
  String subTitle;
  
  GridItemModel({this.comicId, this.title, this.cover, this.subTitle});
  GridItemModel.fromJson(Map<String, dynamic> json) {
    comicId = json["comicId"];
    title = json["title"];
    cover = json["cover"];
    subTitle = json["subTitle"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comicId'] = this.comicId;
    data['title'] = this.title;
    data['cover'] = this.cover;
    data['subTitle'] = this.subTitle;
    return data;
  }
}

class ModuleInfo {
  String argName;
  int argValue;
  String title;
  String icon;
  String bgCover;

  ModuleInfo(
      {this.argName, this.argValue, this.title, this.icon, this.bgCover});

  ModuleInfo.fromJson(Map<String, dynamic> json) {
    argName = json['argName'];
    argValue = json['argValue'];
    title = json['title'];
    icon = json['icon'];
    bgCover = json['bgCover'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['argName'] = this.argName;
    data['argValue'] = this.argValue;
    data['title'] = this.title;
    data['icon'] = this.icon;
    data['bgCover'] = this.bgCover;
    return data;
  }
}

class AnLiItemModel {
  int commentId;
  String threadId;
  String comment;
  int comicId;
  String comicName;
  User user;
  String cover;
  String upperColor;
  String lowerColor;

  AnLiItemModel(
      {this.commentId,
      this.threadId,
      this.comment,
      this.comicId,
      this.comicName,
      this.user,
      this.cover,
      this.upperColor,
      this.lowerColor});

  AnLiItemModel.fromJson(Map<String, dynamic> json) {
    commentId = json['commentId'];
    threadId = json['threadId'];
    comment = json['comment'];
    comicId = json['comicId'];
    comicName = json['comicName'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    cover = json['cover'];
    upperColor = json['upperColor'];
    lowerColor = json['lowerColor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['commentId'] = this.commentId;
    data['threadId'] = this.threadId;
    data['comment'] = this.comment;
    data['comicId'] = this.comicId;
    data['comicName'] = this.comicName;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['cover'] = this.cover;
    data['upperColor'] = this.upperColor;
    data['lowerColor'] = this.lowerColor;
    return data;
  }
}

class User {
  int userId;
  String cover;
  String nickname;
  bool isVipUser;

  User({this.userId, this.cover, this.nickname, this.isVipUser});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    cover = json['cover'];
    nickname = json['nickname'];
    isVipUser = json['isVipUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['cover'] = this.cover;
    data['nickname'] = this.nickname;
    data['isVipUser'] = this.isVipUser;
    return data;
  }
}