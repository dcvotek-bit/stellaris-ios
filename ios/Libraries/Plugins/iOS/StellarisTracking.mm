// Stellaris: Apple'ın izleme izni (App Tracking Transparency) penceresi.
// Durum: 0 = sorulmadı, 1 = kısıtlı, 2 = reddedildi, 3 = izin verildi (iOS 14 öncesinde her zaman 3).
#import <Foundation/Foundation.h>
#import <AppTrackingTransparency/AppTrackingTransparency.h>

extern "C" int _StellarisAttStatus()
{
    if (@available(iOS 14, *)) return (int)[ATTrackingManager trackingAuthorizationStatus];
    return 3;
}

extern "C" void _StellarisAttRequest()
{
    if (@available(iOS 14, *)) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {}];
        });
    }
}
