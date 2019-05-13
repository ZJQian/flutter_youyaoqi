class SkinModel {
  int stateCode;
  String message;
  ReturnData returnData;

  SkinModel({this.stateCode, this.message, this.returnData});

  SkinModel.fromJson(Map<String, dynamic> json) {
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
  List<SkinItemModel> skinList;
  int sum;
  int page;
  int count;

  ReturnData({this.skinList, this.sum, this.page, this.count});

  ReturnData.fromJson(Map<String, dynamic> json) {
    if (json['skinList'] != null) {
      skinList = new List<SkinItemModel>();
      json['skinList'].forEach((v) {
        skinList.add(new SkinItemModel.fromJson(v));
      });
    }
    sum = json['sum'];
    page = json['page'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.skinList != null) {
      data['skinList'] = this.skinList.map((v) => v.toJson()).toList();
    }
    data['sum'] = this.sum;
    data['page'] = this.page;
    data['count'] = this.count;
    return data;
  }
}

class SkinItemModel {
  int id;
  String packageName;
  String description;
  int layoutVersion;
  String versionName;
  int versionCode;
  String skinApkMd5;
  String address;
  int size;
  String name;
  int skinState;
  int skinType;
  int skinTag;
  int skinOriginPrice;
  int skinRealPrice;
  int discountType;
  String skinName;
  String cover;
  int uniqueId;

  SkinItemModel(
      {this.id,
      this.packageName,
      this.description,
      this.layoutVersion,
      this.versionName,
      this.versionCode,
      this.skinApkMd5,
      this.address,
      this.size,
      this.name,
      this.skinState,
      this.skinType,
      this.skinTag,
      this.skinOriginPrice,
      this.skinRealPrice,
      this.discountType,
      this.skinName,
      this.cover,
      this.uniqueId});

  SkinItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    packageName = json['packageName'];
    description = json['description'];
    layoutVersion = json['layoutVersion'];
    versionName = json['versionName'];
    versionCode = json['versionCode'];
    skinApkMd5 = json['skinApkMd5'];
    address = json['address'];
    size = json['size'];
    name = json['name'];
    skinState = json['skinState'];
    skinType = json['skinType'];
    skinTag = json['skinTag'];
    skinOriginPrice = json['skinOriginPrice'];
    skinRealPrice = json['skinRealPrice'];
    discountType = json['discountType'];
    skinName = json['skinName'];
    cover = json['cover'];
    uniqueId = json['uniqueId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['packageName'] = this.packageName;
    data['description'] = this.description;
    data['layoutVersion'] = this.layoutVersion;
    data['versionName'] = this.versionName;
    data['versionCode'] = this.versionCode;
    data['skinApkMd5'] = this.skinApkMd5;
    data['address'] = this.address;
    data['size'] = this.size;
    data['name'] = this.name;
    data['skinState'] = this.skinState;
    data['skinType'] = this.skinType;
    data['skinTag'] = this.skinTag;
    data['skinOriginPrice'] = this.skinOriginPrice;
    data['skinRealPrice'] = this.skinRealPrice;
    data['discountType'] = this.discountType;
    data['skinName'] = this.skinName;
    data['cover'] = this.cover;
    data['uniqueId'] = this.uniqueId;
    return data;
  }
}