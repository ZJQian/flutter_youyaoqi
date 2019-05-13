class ComicModel {
  int stateCode;
  String message;
  ComicListModel returnData;

  ComicModel({this.stateCode, this.message, this.returnData});

  ComicModel.fromJson(Map<String, dynamic> json) {
    stateCode = json['stateCode'];
    message = json['message'];
    returnData = json['returnData'] != null
        ? new ComicListModel.fromJson(json['returnData'])
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

class ComicListModel {
  List<ComicInfoModel> comics;
  int page;
  bool hasMore;
  bool isNew;
  int curDay;

  ComicListModel({this.comics, this.page, this.hasMore, this.isNew, this.curDay});

  ComicListModel.fromJson(Map<String, dynamic> json) {
    if (json['comics'] != null) {
      comics = new List<ComicInfoModel>();
      json['comics'].forEach((v) {
        comics.add(new ComicInfoModel.fromJson(v));
      });
    }
    page = json['page'];
    hasMore = json['hasMore'];
    isNew = json['isNew'];
    curDay = json['curDay'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.comics != null) {
      data['comics'] = this.comics.map((v) => v.toJson()).toList();
    }
    data['page'] = this.page;
    data['hasMore'] = this.hasMore;
    data['isNew'] = this.isNew;
    data['curDay'] = this.curDay;
    return data;
  }
}

class ComicInfoModel {
  int todayId;
  int btnColor;
  String title;
  String isDynamicImg;
  int comicSort;
  String publishTime;
  String cover;
  int actionType;
  int uiType;
  int comicId;
  String comicName;
  String author;
  int chapterId;
  String description;
  int chapterIndex;
  List<ComicTagModel> tagList;

  ComicInfoModel(
      {this.todayId,
      this.btnColor,
      this.title,
      this.isDynamicImg,
      this.comicSort,
      this.publishTime,
      this.cover,
      this.actionType,
      this.uiType,
      this.comicId,
      this.comicName,
      this.author,
      this.chapterId,
      this.description,
      this.chapterIndex,
      this.tagList});

  ComicInfoModel.fromJson(Map<String, dynamic> json) {
    todayId = json['todayId'];
    btnColor = json['btnColor'];
    title = json['title'];
    isDynamicImg = json['is_dynamic_img'];
    comicSort = json['comic_sort'];
    publishTime = json['publish_time'];
    cover = json['cover'];
    actionType = json['actionType'];
    uiType = json['uiType'];
    comicId = json['comicId'];
    comicName = json['comicName'];
    author = json['author'];
    chapterId = json['chapterId'];
    description = json['description'];
    chapterIndex = json['chapterIndex'];
    if (json['tagList'] != null) {
      tagList = new List<ComicTagModel>();
      json['tagList'].forEach((v) {
        tagList.add(new ComicTagModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['todayId'] = this.todayId;
    data['btnColor'] = this.btnColor;
    data['title'] = this.title;
    data['is_dynamic_img'] = this.isDynamicImg;
    data['comic_sort'] = this.comicSort;
    data['publish_time'] = this.publishTime;
    data['cover'] = this.cover;
    data['actionType'] = this.actionType;
    data['uiType'] = this.uiType;
    data['comicId'] = this.comicId;
    data['comicName'] = this.comicName;
    data['author'] = this.author;
    data['chapterId'] = this.chapterId;
    data['description'] = this.description;
    data['chapterIndex'] = this.chapterIndex;
    if (this.tagList != null) {
      data['tagList'] = this.tagList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ComicTagModel {
  String tagStr;
  String tagColor;

  ComicTagModel({this.tagStr, this.tagColor});

  ComicTagModel.fromJson(Map<String, dynamic> json) {
    tagStr = json['tagStr'];
    tagColor = json['tagColor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tagStr'] = this.tagStr;
    data['tagColor'] = this.tagColor;
    return data;
  }
}