//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"
#import <device_info/DeviceInfoPlugin.h>
#import <flutter_webview_plugin/FlutterWebviewPlugin.h>
#import <image_picker/ImagePickerPlugin.h>

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FLTDeviceInfoPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTDeviceInfoPlugin"]];
  [FlutterWebviewPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterWebviewPlugin"]];
  [FLTImagePickerPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTImagePickerPlugin"]];
}

@end
