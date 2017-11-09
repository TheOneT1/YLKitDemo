//
//  YLocationManager.m
//  P014
//
//  Created by ffss on 2017/7/5.
//  Copyright © 2017年 __MyCompanyName__. All rights reserved.
//

#import "YLocationManager.h"
#import <CoreLocation/CoreLocation.h>
#import "Toolkit.h"
#import "NSString+RemoveString.h"
@interface YLocationManager()<CLLocationManagerDelegate>
@property (nonatomic,strong)CLLocationManager* locationManager;
@property (nonatomic,strong)CLGeocoder*        geocoder;
@end

@implementation YLocationManager

#pragma mark - 定位
-(void)startUpdatingLocation{
    
    if (!self.locationManager) {
        self.locationManager =[[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        self.locationManager.distanceFilter = 1000;
        [self.locationManager startUpdatingLocation];
    }
    
}
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    
    switch (status) {
            case kCLAuthorizationStatusNotDetermined:
            if([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
                [self.locationManager requestWhenInUseAuthorization];
            }
            break;
            
            case kCLAuthorizationStatusDenied:
            [self.locationManager stopUpdatingLocation];
            [Toolkit cleanUserLocation];
            break;
            
            case kCLAuthorizationStatusAuthorizedAlways:
            [self.locationManager startUpdatingLocation];
            break;
            
            case kCLAuthorizationStatusAuthorizedWhenInUse:
            [self.locationManager startUpdatingLocation];
            break;
            
        default:
            break;
    }
}

// 代理方法
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    
    if (!self.geocoder) {
        self.geocoder = [[CLGeocoder alloc] init];
    }
    [self.geocoder reverseGeocodeLocation:[locations objectAtIndex:0] completionHandler:^(NSArray *placemarks, NSError *error) {
        //停止定位（由于只需要定位一次）
        [self.locationManager stopUpdatingLocation];
        if (locations.count >0) {
            CLLocation *currLocation = [locations lastObject];
            [Toolkit saveUserLocation:currLocation.coordinate];
            CLPlacemark *placemark =[placemarks objectAtIndex:0];
            NSString *province = placemark.administrativeArea;
            NSString *transCity= placemark.locality;
            if (transCity.length > 0) {
                if ([transCity containString:@"北京"]|[transCity containString:@"天津"]|[transCity containString:@"上海"]|[transCity containString:@"重庆"]) {
                    [Toolkit saveUserAddress:[NSString removeString:@"市" fromString:transCity]];
                    
                }else{
                    [Toolkit saveUserAddress:[NSString stringWithFormat:@"%@-%@",[NSString removeString:@"省" fromString:province],[NSString removeString:@"市" fromString:transCity]]];
                }
            }else{
                [Toolkit saveUserAddress:[NSString removeString:@"市" fromString:province]];
                
            }
        }
    }];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    
    UIAlertController * alertVC = [UIAlertController alertControllerWithTitle:@"允许\"定位\"提示" message:@"请在设置中打开定位" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * ok = [UIAlertAction actionWithTitle:@"打开定位" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //打开定位设置
        NSURL *settingsURL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        [[UIApplication sharedApplication] openURL:settingsURL];
    }];
    UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    
    [alertVC addAction:cancel];
    [alertVC addAction:ok];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertVC animated:YES completion:nil];
  
}


@end
