// Vuruş titreşimi (HitFeedback.Haptic): 0 hafif, 1 orta, 2 güçlü
#import <UIKit/UIKit.h>

extern "C" void _StellarisHaptic(int style)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIImpactFeedbackStyle s = style >= 2 ? UIImpactFeedbackStyleHeavy
                                : style == 1 ? UIImpactFeedbackStyleMedium
                                : UIImpactFeedbackStyleLight;
        UIImpactFeedbackGenerator *g = [[UIImpactFeedbackGenerator alloc] initWithStyle:s];
        [g prepare];
        [g impactOccurred];
    });
}
