import "package:dio/dio.dart";
import 'dart:async';
import 'dart:io';
import '../config/service_url.dart';
import 'package:device_info/device_info.dart';


Future request(url,{Map formData}) async{
    try{
      //print('开始获取数据...............');
      Response response;
      Dio dio = new Dio();
      dio.options.contentType=ContentType.parse("application/x-www-form-urlencoded");
      var params = await RequestConfig()._defaultParams();
      print(params);
      if(formData==null){
        
          response = await dio.get(url,queryParameters: params);
      }else{
          
          formData.forEach((k,v) {
            params[k] = v;
          });
          response = await dio.post(url,data:params);
      }
      if(response.statusCode==200){
        print("返回数据 ========= > ${response.data}");
        return response.data;
      }else{
          
        throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
      }
    }catch(e){
        return print('ERROR:======>${e}');
    }    
}

class RequestConfig {

  Future<Map> _defaultParams() async {

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    Map<String,dynamic> params = {};
    params["device_id"] = "FFF9922C-473A-4AF7-9784-A81022401647";
    params["target"] = "U17_3.0";
    params["android_id"] = "iphone";
    params["model"] = iosInfo.model;
    params["systemVersion"] = iosInfo.systemVersion;
    params["version"] = "4.5.0";
    params["time"] = currentTimeMillis();
    
    return params;
  }

  static int currentTimeMillis() {
    return new DateTime.now().millisecondsSinceEpoch;
  }
}