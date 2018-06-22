
#import "Helper.h"
#import <CommonCrypto/CommonDigest.h>
#define APP_NAME @"App"
#import "Defines.h"
//#import "BaseSetting.h"
//#import "DNUserInfo.h"


@implementation Helper



+ (BOOL)pointInRect:(CGRect)r point:(CGPoint)p{
    return CGRectContainsPoint(r, p);
    //    return (p.x > r.origin.x && p.x < r.origin.x + r.size.width && p.y > r.origin.y && p.y < r.origin.y + r.size.height);
}

+ (NSString *)intToh:(int)temp{
    NSArray *array = [NSArray arrayWithObjects:@"",@"一",@"二",@"三",@"四",@"五",@"六",@"七",@"八",@"九",nil];
    if (temp >= array.count) {
        return @"零";
    }
    
    return [array objectAtIndex:temp];
}

+ (NSString *)intToLetter:(int)temp{
    NSArray *array = [NSArray arrayWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z", nil];
    if (temp>=array.count) {
        return @"";
    }
    NSString *str = [array objectAtIndex:temp];
    
    return str;
}

+ (NSString *)intToHex:(int)tmpid{
    NSString *endtmp=@"";
    NSString *nLetterValue = nil;
    NSString *nStrat = nil;
    int ttmpig=tmpid%16;
    int tmp=tmpid/16;
    switch (ttmpig)
    {
        case 10:
            nLetterValue =@"A";break;
        case 11:
            nLetterValue =@"B";break;
        case 12:
            nLetterValue =@"C";break;
        case 13:
            nLetterValue =@"D";break;
        case 14:
            nLetterValue =@"E";break;
        case 15:
            nLetterValue =@"F";break;
        default:nLetterValue=[NSString stringWithFormat:@"%i",ttmpig];
            
    }
    switch (tmp)
    {
        case 10:
            nStrat =@"A";break;
        case 11:
            nStrat =@"B";break;
        case 12:
            nStrat =@"C";break;
        case 13:
            nStrat =@"D";break;
        case 14:
            nStrat =@"E";break;
        case 15:
            nStrat =@"F";break;
        default:nStrat=[NSString stringWithFormat:@"%i",tmp];
            
    }
    endtmp=[NSString stringWithFormat:@"%@%@",nStrat,nLetterValue];
    return endtmp;
}

+ (NSString *)monthToEnglish:(int)index{
    NSArray *array = [NSArray arrayWithObjects:@"Jan",@"Feb",@"Mar",@"Apr",@"May",@"Jun",@"Jul",@"Aug",@"Sep",@"Oct",@"Nov",@"Dec", nil];
    return [array objectAtIndex:index-1];
}

+ (UIViewController *)currentViewController{
    //获得当前活动窗口的根视图
    UIViewController* vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    while (1)
    {
        //根据不同的页面切换方式，逐步取得最上层的viewController
        if ([vc isKindOfClass:[UITabBarController class]]) {
            vc = ((UITabBarController*)vc).selectedViewController;
        }
        if ([vc isKindOfClass:[UINavigationController class]]) {
            vc = ((UINavigationController*)vc).visibleViewController;
        }
        if (vc.presentedViewController) {
            vc = vc.presentedViewController;
        }else{
            break;
        }
    }
    return vc;
}

@end


#pragma mark UIColor
@implementation UIColor(Additions)

+ (UIColor *)colorWithWholeRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:red/255.f green:green/255.f blue:blue/255.f alpha:alpha];
}

+ (UIColor*)colorWith0xRGB:(NSString *)Oxrgb{
    NSString * rF = [Oxrgb substringWithRange:NSMakeRange(0, 2)];
    NSString * gF = [Oxrgb substringWithRange:NSMakeRange(2, 2)];
    NSString * bF = [Oxrgb substringWithRange:NSMakeRange(4, 2)];
    unsigned int r,g,b;
    [[NSScanner scannerWithString:rF] scanHexInt:&r];
    [[NSScanner scannerWithString:gF] scanHexInt:&g];
    [[NSScanner scannerWithString:bF] scanHexInt:&b];
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1];
}

+ (UIColor*)colorWith0xRGB:(NSString *)Oxrgb alpha:(CGFloat)alpha{
    NSString * rF = [Oxrgb substringWithRange:NSMakeRange(0, 2)];
    NSString * gF = [Oxrgb substringWithRange:NSMakeRange(2, 2)];
    NSString * bF = [Oxrgb substringWithRange:NSMakeRange(4, 2)];
    unsigned int r,g,b;
    [[NSScanner scannerWithString:rF] scanHexInt:&r];
    [[NSScanner scannerWithString:gF] scanHexInt:&g];
    [[NSScanner scannerWithString:bF] scanHexInt:&b];
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:alpha];
}


+(UIColor *)randomColor{
    int ir = arc4random()%255;
    int ig = arc4random()%255;
    int ib = arc4random()%255;
    
    UIColor *color = [UIColor colorWithRed:ir/255.0 green:ig/255.0 blue:ib/255.0 alpha:1];
    
    return color;
    
}

+(UIColor *)randomColor:(CGFloat)alpha{
    int ir = arc4random()%255;
    int ig = arc4random()%255;
    int ib = arc4random()%255;
    
    UIColor *color = [UIColor colorWithRed:ir/255.0 green:ig/255.0 blue:ib/255.0 alpha:alpha];
    
    return color;
}

+(UIColor*)colorWithR:(CGFloat)red g:(CGFloat)green b:(CGFloat)blue a:(CGFloat)alpha{
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
}
@end

#pragma mark - UIAlertView
static NSString *UIAlertViewKey = @"UIAlertViewKey";

@implementation UIAlertView (DN)

+ (void)alertWithCallBackBlock:(UIAlertViewCallBackBlock)alertViewCallBackBlock title:(NSString *)title message:(NSString *)message  cancelButtonName:(NSString *)cancelButtonName otherButtonTitles:(NSString *)otherButtonTitles, ...NS_REQUIRES_NIL_TERMINATION {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:cancelButtonName otherButtonTitles: otherButtonTitles, nil];
    NSString *other = nil;
    va_list args;
    if (otherButtonTitles) {
        va_start(args, otherButtonTitles);
        while ((other = va_arg(args, NSString*))) {
            [alert addButtonWithTitle:other];
        }
        va_end(args);
    }
    alert.delegate = alert;
    [alert show];
    alert.alertViewCallBackBlock = alertViewCallBackBlock;
}


- (void)setAlertViewCallBackBlock:(UIAlertViewCallBackBlock)alertViewCallBackBlock {
    
    [self willChangeValueForKey:@"callbackBlock"];
    objc_setAssociatedObject(self, &UIAlertViewKey, alertViewCallBackBlock, OBJC_ASSOCIATION_COPY);
    [self didChangeValueForKey:@"callbackBlock"];
}

- (UIAlertViewCallBackBlock)alertViewCallBackBlock {
    
    return objc_getAssociatedObject(self, &UIAlertViewKey);
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (self.alertViewCallBackBlock) {
        self.alertViewCallBackBlock(buttonIndex);
    }
}
@end

#pragma mark UIView

static char kActionHandlerTapBlockKey;
static char kActionHandlerTapGestureKey;

@implementation UIView(Additions)

- (void)addTapActionWithBlock:(GestureActionBlock)block {
    UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, &kActionHandlerTapGestureKey);
    if (!gesture) {
        gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleActionForTapGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &kActionHandlerTapGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &kActionHandlerTapBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)handleActionForTapGesture:(UITapGestureRecognizer*)gesture {
    if (gesture.state == UIGestureRecognizerStateRecognized) {
        GestureActionBlock block = objc_getAssociatedObject(self, &kActionHandlerTapBlockKey);
        if (block) {
            block(gesture);
        }
    }
}

-(void)viewWillAppear:(BOOL)animated{}

-(void)viewDidAppear:(BOOL)animated{}

-(void)viewWillDisappear:(BOOL)animated{}

-(void)viewDidDisappear:(BOOL)animated{}

-(CGSize)size{
    return self.frame.size;
}

-(void)setSize:(CGSize)size{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

-(void)setSize:(CGSize)size animated:(BOOL)animated{
    CGRect frame = self.frame;
    frame.size = size;
    if (animated) {
        [UIView animateWithDuration:0.2 animations:^{
            self.frame = frame;
        }];
    }else{
        self.frame = frame;
    }
}

-(void)setSize:(CGSize)size animated:(BOOL)animated completion:(void (^)(BOOL finished))completion{
    CGRect frame = self.frame;
    frame.size = size;
    if (animated) {
        [UIView animateWithDuration:0.2 animations:^{
            self.frame = frame;
        }completion:^(BOOL finished) {
            completion(finished);
        }];
    }else{
        self.frame = frame;
    }
}

-(void)setSize:(CGSize)size animated:(BOOL)animated duration:(NSTimeInterval)duration completion:(void (^)(BOOL finished))completion{
    CGRect frame = self.frame;
    frame.size = size;
    if (animated) {
        [UIView animateWithDuration:duration animations:^{
            self.frame = frame;
        }completion:^(BOOL finished) {
            completion(finished);
        }];
    }else{
        self.frame = frame;
    }
}


-(CGPoint)origin{
    return self.frame.origin;
}

-(void)setOrigin:(CGPoint)origin{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

-(void)setOrigin:(CGPoint)origin animated:(BOOL)animated{
    CGRect frame = self.frame;
    frame.origin = origin;
    if (animated) {
        [UIView animateWithDuration:0.2 animations:^{
            self.frame = frame;
        }];
    }else{
        self.frame = frame;
    }
}
-(void)setOrigin:(CGPoint)origin animated:(BOOL)animated completion:(void (^)(BOOL finished))completion{
    CGRect frame = self.frame;
    frame.origin = origin;
    if (animated) {
        [UIView animateWithDuration:0.2 animations:^{
            self.frame = frame;
        }completion:^(BOOL finished) {
            completion(finished);
        }];
    }else{
        self.frame = frame;
    }
}

-(void)setOrigin:(CGPoint)origin animated:(BOOL)animated duration:(NSTimeInterval)duration completion:(void (^)(BOOL finished))completion{
    CGRect frame = self.frame;
    frame.origin = origin;
    if (animated) {
        [UIView animateWithDuration:duration animations:^{
            self.frame = frame;
        }completion:^(BOOL finished) {
            completion(finished);
        }];
    }else{
        self.frame = frame;
    }
}

-(CGFloat)x{
    return self.frame.origin.x;
}
-(void)setX:(CGFloat)x{
    self.frame = CGRectMake(x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}

-(void)setX:(CGFloat)x animated:(BOOL)animated{
    if (animated) {
        [UIView animateWithDuration:0.2 animations:^{
            self.frame = CGRectMake(x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
        }];
    }else{
        self.frame = CGRectMake(x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
    }
    
}

-(void)setX:(CGFloat)x animated:(BOOL)animated completion:(void (^)(BOOL finished))completion{
    CGRect frame = self.frame;
    frame.origin.x = x;
    if (animated) {
        [UIView animateWithDuration:0.2 animations:^{
            self.frame = frame;
        }completion:^(BOOL finished) {
            completion(finished);
        }];
    }else{
        self.frame = frame;
    }
}

-(void)setX:(CGFloat)x animated:(BOOL)animated duration:(NSTimeInterval)duration completion:(void (^)(BOOL finished))completion{
    CGRect frame = self.frame;
    frame.origin.x = x;
    if (animated) {
        [UIView animateWithDuration:duration animations:^{
            self.frame = frame;
        }completion:^(BOOL finished) {
            completion(finished);
        }];
    }else{
        self.frame = frame;
    }
}


-(CGFloat)y{
    return self.frame.origin.y;
}
-(void)setY:(CGFloat)y{
    self.frame = CGRectMake(self.frame.origin.x, y, self.frame.size.width, self.frame.size.height);
}

-(void)setY:(CGFloat)y animated:(BOOL)animated{
    if (animated) {
        [UIView animateWithDuration:0.2 animations:^{
            self.frame = CGRectMake(self.frame.origin.x, y, self.frame.size.width, self.frame.size.height);
        }];
    }else{
        self.frame = CGRectMake(self.frame.origin.x, y, self.frame.size.width, self.frame.size.height);
    }
}

-(void)setY:(CGFloat)y animated:(BOOL)animated completion:(void (^)(BOOL finished))completion{
    CGRect frame = self.frame;
    frame.origin.y= y;
    if (animated) {
        [UIView animateWithDuration:0.2 animations:^{
            self.frame = frame;
        }completion:^(BOOL finished) {
            completion(finished);
        }];
    }else{
        self.frame = frame;
    }
}

-(void)setY:(CGFloat)y animated:(BOOL)animated duration:(NSTimeInterval)duration completion:(void (^)(BOOL finished))completion{
    CGRect frame = self.frame;
    frame.origin.y = y;
    if (animated) {
        [UIView animateWithDuration:duration animations:^{
            self.frame = frame;
        }completion:^(BOOL finished) {
            completion(finished);
        }];
    }else{
        self.frame = frame;
    }
}


-(CGFloat)width{
    return self.frame.size.width;
}
-(void)setWidth:(CGFloat)width{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width, self.frame.size.height);
}

-(void)setWidth:(CGFloat)width animated:(BOOL)animated{
    if (animated) {
        [UIView animateWithDuration:0.2 animations:^{
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width, self.frame.size.height);
        }];
    }else{
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width, self.frame.size.height);
    }
}

-(void)setWidth:(CGFloat)width animated:(BOOL)animated completion:(void (^)(BOOL finished))completion{
    CGRect frame = self.frame;
    frame.size.width = width;
    if (animated) {
        [UIView animateWithDuration:0.2 animations:^{
            self.frame = frame;
        }completion:^(BOOL finished) {
            completion(finished);
        }];
    }else{
        self.frame = frame;
    }
}

-(void)setWidth:(CGFloat)width animated:(BOOL)animated duration:(NSTimeInterval)duration completion:(void (^)(BOOL finished))completion{
    CGRect frame = self.frame;
    frame.size.width = width;
    if (animated) {
        [UIView animateWithDuration:duration animations:^{
            self.frame = frame;
        }completion:^(BOOL finished) {
            completion(finished);
        }];
    }else{
        self.frame = frame;
    }
}


-(CGFloat)height{
    return self.frame.size.height;
}
-(void)setHeight:(CGFloat)height{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height);
}

-(void)setHeight:(CGFloat)height animated:(BOOL)animated{
    if (animated) {
        [UIView animateWithDuration:0.2 animations:^{
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height);
        }];
    }else{
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height);
    }
}

-(void)setHeight:(CGFloat)height animated:(BOOL)animated completion:(void (^)(BOOL finished))completion{
    CGRect frame = self.frame;
    frame.size.height = height;
    if (animated) {
        [UIView animateWithDuration:0.2 animations:^{
            self.frame = frame;
        }completion:^(BOOL finished) {
            completion(finished);
        }];
    }else{
        self.frame = frame;
    }
}

-(void)setHeight:(CGFloat)height animated:(BOOL)animated duration:(NSTimeInterval)duration completion:(void (^)(BOOL finished))completion{
    CGRect frame = self.frame;
    frame.size.height = height;
    if (animated) {
        [UIView animateWithDuration:duration animations:^{
            self.frame = frame;
        }completion:^(BOOL finished) {
            completion(finished);
        }];
    }else{
        self.frame = frame;
    }
}


-(UIViewController *)getSuperViewController{
    UIViewController *superVC = nil;
    id temp = nil;
    UIView *tempView = self;
    do {
        tempView = tempView.superview;
        temp = tempView.nextResponder;
        superVC = temp;
    } while (![temp isKindOfClass:[UIViewController class]]);
    
    return superVC;
}


-(UIView *)getViewWithXibName:(NSString *)name withIndex:(NSInteger)index{
    NSArray *nib = [[NSBundle mainBundle]loadNibNamed:name owner:self options:nil];
    UIView *tmpCustomView = [nib objectAtIndex:index];
    return tmpCustomView;
}

- (void)addGradientLayerWithColors:(NSArray *)cgColorArray locations:(NSArray *)floatNumArray startPoint:(CGPoint )startPoint endPoint:(CGPoint)endPoint{
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.frame = self.bounds;
    if (cgColorArray && [cgColorArray count] > 0) {
        layer.colors = cgColorArray;
    }else{
        return;
    }
    if (floatNumArray && [floatNumArray count] == [cgColorArray count]) {
        layer.locations = floatNumArray;
    }
    layer.startPoint = startPoint;
    layer.endPoint = endPoint;
    [self.layer addSublayer:layer];
}

/**
 *  移动
 *
 *  @param p 目标点（左上顶点）
 */
-(void)moveToOrigin:(CGPoint)p{
    
    CGRect frame = self.frame;
    frame.origin = p;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.2];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    self.frame = frame;
    [UIView commitAnimations];
    
}


-(void)moveToOrigin:(CGPoint)p duration:(NSTimeInterval)duration{
    
    CGRect frame = self.frame;
    frame.origin = p;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDuration:duration];
    self.frame = frame;
    [UIView commitAnimations];
    
}

-(void)moveToOrigin:(CGPoint)p duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay{
    
    CGRect frame = self.frame;
    frame.origin = p;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDelay:delay];
    [UIView setAnimationDuration:duration];
    self.frame = frame;
    [UIView commitAnimations];
    
}

/**
 *  隐藏视图
 *
 *  @param ann 是否有动画执行
 */
-(void)hideWithAnimation:(BOOL)ann{
    if (ann) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.2];
        self.alpha = 0;
        [UIView commitAnimations];
    }else{
        self.alpha = 0;
    }
}
/**
 *  显示视图
 *
 *  @param ann 师傅有动画执行
 */
-(void)showWithAnimation:(BOOL)ann{
    if (ann) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.2];
        self.alpha = 1;
        [UIView commitAnimations];
    }else{
        self.alpha = 1;
    }
}


/**
 *  给view加清扫手势
 *
 *  @param view      目标视图
 *  @param target    目标
 *  @param action    动作
 *  @param direction 手势方向
 *
 *  @return 手势指针
 */
-(UISwipeGestureRecognizer *)addSwipeWithTarget:(id)target action:(SEL)action direction:(UISwipeGestureRecognizerDirection)direction{
    UISwipeGestureRecognizer * tap = [[UISwipeGestureRecognizer alloc]initWithTarget:target action:action];
    tap.direction = direction;
    [self addGestureRecognizer:tap];
#if !__has_feature(objc_arc)
    return [tap autorelease];
#else
    return tap;
#endif
}

/**
 *  给view添加单击手势
 *
 *  @param view   目标视图
 *  @param target 目标
 *  @param action 动作
 *
 *  @return 手势指针
 */
-(UITapGestureRecognizer *)addTapWithTarget:(id)target action:(SEL)action{
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:target action:action];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:tap];
#if !__has_feature(objc_arc)
    return [tap autorelease];
#else
    return tap;
#endif
}

/**
 *  给view添加长按手势
 *
 *  @param view   目标视图
 *  @param target 目标
 *  @param action 动作
 *
 *  @return 手势指针
 */
-(UILongPressGestureRecognizer *)addLongTapWithTarget:(id)target action:(SEL)action{
    UILongPressGestureRecognizer * tap = [[UILongPressGestureRecognizer alloc]initWithTarget:target action:action];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:tap];
#if !__has_feature(objc_arc)
    return [tap autorelease];
#else
    return tap;
#endif
}


/**
 *  删除视图手势
 *
 *  @param view 目标视图
 */
-(void)removeGestureRecognizers{
    if (self.gestureRecognizers.count == 0)return;
    
    while (self.gestureRecognizers.count != 0) {
        UITapGestureRecognizer * tap = [self.gestureRecognizers objectAtIndex:0];
        [self removeGestureRecognizer:tap];
    }
}

/**
 *  添加描边
 *
 *  @param borderColor 颜色
 *  @param borderWidth 宽度
 */
-(void)addEffectWithBorderColor:(UIColor*)borderColor borderWidth:(float)borderWidth{
    self.layer.borderColor = [borderColor CGColor];
    self.layer.borderWidth = borderWidth;
}

/**
 *  添加阴影
 *
 *  @param radius      阴影半径
 *  @param offset      位置
 *  @param opacity     不透明度
 *  @param shadowColor 颜色
 */
-(void)addEffectWithShadowRadius:(float)radius shadowOffset:(CGSize)offset shadowOpacity:(float)opacity shadowColor:(UIColor*)shadowColor{
    if (self.clipsToBounds)self.clipsToBounds = NO;
    self.layer.shadowColor = shadowColor.CGColor;
    self.layer.shadowRadius = radius;
    self.layer.shadowOffset = offset;
    self.layer.shadowOpacity = opacity;
    self.layer.shadowPath =[UIBezierPath bezierPathWithRect:self.bounds].CGPath;//防止卡顿
}
@end


@implementation UINavigationItem (DN)

- (void)lockLeftItem:(BOOL)lock {
    NSArray *leftBarItems = self.leftBarButtonItems;
    if (leftBarItems  && [leftBarItems count]>0) {
        [leftBarItems enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            if ([obj isKindOfClass:[UIBarButtonItem class]] ||
                [obj isMemberOfClass:[UIBarButtonItem class]])
            {
                UIBarButtonItem *barButtonItem = (UIBarButtonItem *)obj;
                barButtonItem.enabled = !lock;
            }
        }];
    }
}

- (void)lockRightItem:(BOOL)lock {
    NSArray *rightBarItems = self.rightBarButtonItems;
    if (rightBarItems  && [rightBarItems count]>0) {
        [rightBarItems enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            if ([obj isKindOfClass:[UIBarButtonItem class]] ||
                [obj isMemberOfClass:[UIBarButtonItem class]])
            {
                UIBarButtonItem *barButtonItem = (UIBarButtonItem *)obj;
                barButtonItem.enabled = !lock;
            }
        }];
    }
}

@end

#pragma mark UINavigationController
//static char const * const ObjectTagKey = "ObjectTag";

//@interface UINavigationController ()<UINavigationControllerDelegate>
//@property (readwrite,getter = isViewTransitionInProgress) BOOL viewTransitionInProgress;
//
//@end

@implementation UINavigationController(Additions) 
//- (void)setViewTransitionInProgress:(BOOL)property {
//    NSNumber *number = [NSNumber numberWithBool:property];
//    objc_setAssociatedObject(self, ObjectTagKey, number , OBJC_ASSOCIATION_RETAIN);
//}
//
//
//- (BOOL)isViewTransitionInProgress {
//    NSNumber *number = objc_getAssociatedObject(self, ObjectTagKey);
//    
//    return [number boolValue];
//}
//
//
//#pragma mark - Intercept Pop, Push, PopToRootVC
///// @name Intercept Pop, Push, PopToRootVC
//
//- (NSArray *)safePopToRootViewControllerAnimated:(BOOL)animated {
//    if (self.viewTransitionInProgress) return nil;
//    if (animated) {
//        self.viewTransitionInProgress = YES;
//    }
//    //-- This is not a recursion, due to method swizzling the call below calls the original  method.
//    return [self safePopToRootViewControllerAnimated:animated];
//    
//}
//
//
//- (NSArray *)safePopToViewController:(UIViewController *)viewController animated:(BOOL)animated {
//    if (self.viewTransitionInProgress) return nil;
//    if (animated) {
//        self.viewTransitionInProgress = YES;
//    }
//    //-- This is not a recursion, due to method swizzling the call below calls the original  method.
//    return [self safePopToViewController:viewController animated:animated];
//}
//
//
//- (UIViewController *)safePopViewControllerAnimated:(BOOL)animated {
//    if (self.viewTransitionInProgress) return nil;
//    if (animated) {
//        self.viewTransitionInProgress = YES;
//    }
//    //-- This is not a recursion, due to method swizzling the call below calls the original  method.
//    return [self safePopViewControllerAnimated:animated];
//}
//
//
//
//- (void)safePushViewController:(UIViewController *)viewController animated:(BOOL)animated {
//    self.delegate = self;
//    //-- If we are already pushing a view controller, we dont push another one.
//    if (self.isViewTransitionInProgress == NO) {
//        //-- This is not a recursion, due to method swizzling the call below calls the original  method.
//        [self safePushViewController:viewController animated:animated];
//        if (animated) {
//            self.viewTransitionInProgress = YES;
//        }
//    }
//}
//
//
//// This is confirmed to be App Store safe.
//// If you feel uncomfortable to use Private API, you could also use the delegate method navigationController:didShowViewController:animated:.
//- (void)safeDidShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
//    //-- This is not a recursion. Due to method swizzling this is calling the original method.
//    [self safeDidShowViewController:viewController animated:animated];
//    self.viewTransitionInProgress = NO;
//}
//
//
//// If the user doesnt complete the swipe-to-go-back gesture, we need to intercept it and set the flag to NO again.
//- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
//    id<UIViewControllerTransitionCoordinator> tc = navigationController.topViewController.transitionCoordinator;
//    [tc notifyWhenInteractionEndsUsingBlock:^(id<UIViewControllerTransitionCoordinatorContext> context) {
//        self.viewTransitionInProgress = NO;
//        //--Reenable swipe back gesture.
//        self.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)viewController;
//        [self.interactivePopGestureRecognizer setEnabled:YES];
//    }];
//    //-- Method swizzling wont work in the case of a delegate so:
//    //-- forward this method to the original delegate if there is one different than ourselves.
//    if (navigationController.delegate != self) {
//        [navigationController.delegate navigationController:navigationController
//                                     willShowViewController:viewController
//                                                   animated:animated];
//    }
//    
//}
//
//
//+ (void)load {
//    //-- Exchange the original implementation with our custom one.
//    method_exchangeImplementations(class_getInstanceMethod(self, @selector(pushViewController:animated:)), class_getInstanceMethod(self, @selector(safePushViewController:animated:)));
//    method_exchangeImplementations(class_getInstanceMethod(self, @selector(didShowViewController:animated:)), class_getInstanceMethod(self, @selector(safeDidShowViewController:animated:)));
//    method_exchangeImplementations(class_getInstanceMethod(self, @selector(popViewControllerAnimated:)), class_getInstanceMethod(self, @selector(safePopViewControllerAnimated:)));
//    method_exchangeImplementations(class_getInstanceMethod(self, @selector(popToRootViewControllerAnimated:)), class_getInstanceMethod(self, @selector(safePopToRootViewControllerAnimated:)));
//    method_exchangeImplementations(class_getInstanceMethod(self, @selector(popToViewController:animated:)), class_getInstanceMethod(self, @selector(safePopToViewController:animated:)));
//}


-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated orientation:(UINavigationControllerPushOrientation)orientation{
    
    if (animated) {
        CATransition *transition = [CATransition animation];
        transition.duration = .5;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        transition.type = kCATransitionFade;
        NSString *sub = kCATransitionFromLeft;
        switch (orientation) {
            case 0:sub = kCATransitionFromLeft;break;
            case 1:sub = kCATransitionFromRight;break;
            case 2:sub = kCATransitionFromTop;break;
            case 3:sub = kCATransitionFromBottom;break;
        }
        transition.subtype = sub;
        [self.view.layer addAnimation:transition forKey:nil];
    }
    
    [self pushViewController:viewController animated:NO];
}

-(UIViewController *)popViewControllerAnimated:(BOOL)animated orientation:(UINavigationControllerPushOrientation)orientation{
    
    if (animated) {
        CATransition *transition = [CATransition animation];
        transition.duration = 0.3;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        transition.type = kCATransitionPush;
        
        NSString *sub = @"kCATransitionFromLeft";
        switch (orientation) {
            case 0:sub = kCATransitionFromLeft;break;
            case 1:sub = kCATransitionFromRight;break;
            case 2:sub = kCATransitionFromTop;break;
            case 3:sub = kCATransitionFromBottom;break;
        }
        transition.subtype = sub;
        [self.view.layer addAnimation:transition forKey:nil];
    }
    
    return [self popViewControllerAnimated:NO];
}

-(NSArray *)popToRootViewControllerAnimated:(BOOL)animated orientation:(UINavigationControllerPushOrientation)orientation{
    if (animated) {
        CATransition *transition = [CATransition animation];
        transition.duration = 0.3;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        transition.type = kCATransitionPush;
        
        NSString *sub = @"kCATransitionFromLeft";
        switch (orientation) {
            case 0:sub = kCATransitionFromLeft;break;
            case 1:sub = kCATransitionFromRight;break;
            case 2:sub = kCATransitionFromTop;break;
            case 3:sub = kCATransitionFromBottom;break;
        }
        transition.subtype = sub;
        [self.view.layer addAnimation:transition forKey:nil];
    }
    
    return [self popToRootViewControllerAnimated:NO];
}

-(NSArray *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated orientation:(UINavigationControllerPushOrientation)orientation{
    
    if (animated) {
        CATransition *transition = [CATransition animation];
        transition.duration = 0.3;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        transition.type = kCATransitionPush;
        
        NSString *sub = @"kCATransitionFromLeft";
        switch (orientation) {
            case 0:sub = kCATransitionFromLeft;break;
            case 1:sub = kCATransitionFromRight;break;
            case 2:sub = kCATransitionFromTop;break;
            case 3:sub = kCATransitionFromBottom;break;
        }
        transition.subtype = sub;
        [self.view.layer addAnimation:transition forKey:nil];
    }
    return [self popToViewController:viewController animated:NO];
}

@end


#pragma mark UIScrollView

@implementation UIScrollView(Additions)



-(BOOL)showsScrollIndicator{
    return self.showsHorizontalScrollIndicator;
}

-(void)setShowsScrollIndicator:(BOOL)indicator{
    self.showsHorizontalScrollIndicator = self.showsVerticalScrollIndicator = indicator;
}

-(CGFloat)top{
    return self.contentInset.top;
}
-(void)setTop:(CGFloat)top{
    self.contentInset = UIEdgeInsetsMake(top, self.contentInset.left, self.contentInset.bottom, self.contentInset.right);
}

-(CGFloat)left{
    return self.contentInset.left;
}
-(void)setLeft:(CGFloat)left{
    self.contentInset = UIEdgeInsetsMake(self.contentInset.top, left, self.contentInset.bottom, self.contentInset.right);
}

-(CGFloat)bottom{
    return self.contentInset.bottom;
}
-(void)setBottom:(CGFloat)bottom{
    self.contentInset = UIEdgeInsetsMake(self.contentInset.top, self.contentInset.left, bottom, self.contentInset.right);
}

-(CGFloat)right{
    return self.contentInset.right;
}
-(void)setRight:(CGFloat)right{
    self.contentInset = UIEdgeInsetsMake(self.contentInset.top, self.contentInset.left, self.contentInset.bottom, self.contentInset.right);
}

@end

#pragma mark UIViewController
@implementation UIViewController(Additions)

- (NSString *)toString{
    return NSStringFromClass([self class]);
}

- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag orientation:(UIViewControllerPresentOrientation)orientation completion:(void (^)(void))completion{
    
    if (flag) {
    }
    
    [self presentViewController:viewControllerToPresent animated:flag completion:completion];
    
}

- (void)dismissViewControllerAnimated:(BOOL)flag  orientation:(UIViewControllerPresentOrientation)orientation completion:(void (^)(void))completion{
    if (flag) {
        
    }
    
    [self dismissViewControllerAnimated:flag completion:completion];
}

- (void)dismissAllModalController{
    UIViewController *presentViewController = [self presentingViewController];
    UIViewController *lastViewController = self;
    while (presentViewController) {
        id temp = presentViewController;
        presentViewController = [presentViewController presentingViewController];
        lastViewController = temp;
    }
    [lastViewController dismissViewControllerAnimated:YES completion:^{
    }];
}

@end

#pragma mark NSObject

@implementation NSObject(JSON)

- (id)JSONValue{
    NSError *error = nil;
    if ([self isKindOfClass:[NSString class]]) {
        
        id res = [NSJSONSerialization JSONObjectWithData:[(NSString *)self dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingAllowFragments error:&error];
        
        if (error)
            NSLog(@"-JSONValue failed. Error trace is: %@",error);
        
        return res;
        
    }else if([self isKindOfClass:[NSData class]]){
        
        id res = [NSJSONSerialization JSONObjectWithData:(NSData *)self options:NSJSONReadingAllowFragments error:&error];
        
        if (error)
            NSLog(@"-JSONValue failed. Error trace is: %@",error);
        
        return res;
        
    }else{
        NSLog(@"-JSONValue failed.Not a string or data value.");
        return nil;
    }
    
}

- (NSString*)JSONString
{
    NSError* error = nil;
    if ([self isKindOfClass:[NSDictionary class]]) {
        id result = [NSJSONSerialization dataWithJSONObject:self options:kNilOptions error:&error];
        if (error)
            NSLog(@"-JSONString failed. Error trace is: %@",error);
        return [[NSString alloc]initWithData:result encoding:NSUTF8StringEncoding];
        
    }else if([self isKindOfClass:[NSArray class]]){
        id result = [NSJSONSerialization dataWithJSONObject:self options:kNilOptions error:&error];
        if (error)
            NSLog(@"-JSONString failed. Error trace is: %@",error);
        return [[NSString alloc]initWithData:result encoding:NSUTF8StringEncoding];
    }else{
        NSLog(@"-JSONString failed.Not a array or dictionary value.");
        return nil;
    }
}

@end

#pragma mark UITableView
@implementation UITableView(Additions)

@end

@implementation UIImage (MiddleAligning)
- (UIImage *)MiddleAlignedButtonImageScaleToSize:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0.0, size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextDrawImage(context, CGRectMake(0.0f, 0.0f, size.width, size.height), self.CGImage);
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

@end

#pragma mark UIButton
@implementation UIButton(Additions)

- (UIEdgeInsets)touchAreaInsets {
    return [objc_getAssociatedObject(self, @selector(touchAreaInsets)) UIEdgeInsetsValue];
}

- (void)setTouchAreaInsets:(UIEdgeInsets)touchAreaInsets {
    NSValue *value = [NSValue valueWithUIEdgeInsets:touchAreaInsets];
    objc_setAssociatedObject(self, @selector(touchAreaInsets), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (void)middleAlignButtonWithSpacing:(CGFloat)spacing {
    NSString *titleString = [self titleForState:UIControlStateNormal]?:@"";
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:titleString attributes:@{NSFontAttributeName : self.titleLabel.font}];
    CGSize titleSize = [attributedString boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;
    CGSize imageSize = [self imageForState:UIControlStateNormal].size;
    CGFloat maxImageHeight = CGRectGetHeight(self.frame) - titleSize.height - spacing * 2;
    CGFloat maxImageWidth = CGRectGetWidth(self.frame) ;
    
    
    if (iphone4x_3_5 || iphone5x_4_0) {
        maxImageHeight = CGRectGetHeight(self.frame) - titleSize.height - spacing * 2 -10;
        maxImageWidth = CGRectGetWidth(self.frame) - 10;
    }
    
    UIImage *newImage = nil;
    if (imageSize.width > ceilf(maxImageWidth)) {
        CGFloat ratio = maxImageWidth / imageSize.width;
        newImage = [self.imageView.image MiddleAlignedButtonImageScaleToSize:CGSizeMake(maxImageWidth, imageSize.height * ratio)];
        imageSize = newImage.size;
    }
    if (imageSize.height > ceilf(maxImageHeight)) {
        CGFloat ratio = maxImageHeight / imageSize.height;
        newImage = [self.imageView.image MiddleAlignedButtonImageScaleToSize:CGSizeMake(imageSize.width * ratio, maxImageHeight)];
        imageSize = newImage.size;
    }
    if (newImage) {
        if ([newImage respondsToSelector:@selector(imageWithRenderingMode:)]) {
            newImage = [newImage imageWithRenderingMode:self.imageView.image.renderingMode];
        }
        [self setImage:newImage forState:UIControlStateNormal];
    }
    
    CGFloat imageVerticalDiff = titleSize.height + spacing;
    CGFloat imageHorizontalDiff = titleSize.width;
    
    self.imageEdgeInsets = UIEdgeInsetsMake(-imageVerticalDiff, 0, 0, -imageHorizontalDiff);
    
    CGFloat titleVerticalDiff = imageSize.height + spacing;
    CGFloat titleHorizontalDiff = imageSize.width;
    
    self.titleEdgeInsets = UIEdgeInsetsMake(0, -titleHorizontalDiff, -titleVerticalDiff, 0);
}


- (void)setTitleFont:(UIFont *)font{
    self.titleLabel.font = font;
}
- (UIFont *)titleFont{
    return self.titleLabel.font;
}

+ (UIButton *)buttonWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titlecolor target:(id)target action:(SEL)action
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = frame;
    button.backgroundColor = [UIColor clearColor];
    button.alpha = 1;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titlecolor forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}
+ (UIButton *)buttonWithType:(UIButtonType)buttonType frame:(CGRect)frame title:(NSString *)title backgroundImage:(UIImage *)backgroundImage target:(id)target action:(SEL)action
{
    
    UIButton * button = [UIButton buttonWithType:buttonType];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];//设置名字居左对齐
    [button setContentEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];//设置位置缩进10
    [button setTintColor:[UIColor blueColor]];
    [button setBackgroundImage:backgroundImage forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}
+ (UIButton *)buttonWithType:(UIButtonType)buttonType frame:(CGRect)frame title:(NSString *)title backgroundImage:(UIImage *)backgroundImage target:(id)target action:(SEL)action withAlignment:(UIControlContentHorizontalAlignment)alignment
{
    
    UIButton * button = [UIButton buttonWithType:buttonType];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button setContentHorizontalAlignment:alignment];//设置名字居左对齐
    [button setContentEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];//设置位置缩进10
    [button setTintColor:[UIColor blueColor]];
    [button setBackgroundImage:backgroundImage forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}
+ (UIButton *)buttonWithFrame:(CGRect)frame backgroundImage:(UIImage *)backgroundImage backgroundImageToSelected:(UIImage*)img target:(id)target action:(SEL)action
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTintColor:[UIColor clearColor]];
    [button setBackgroundImage:backgroundImage forState:UIControlStateNormal];
    if (img) {
        [button setBackgroundImage:img forState:UIControlStateSelected];
    }
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void)startWithTime:(NSInteger)timeLine title:(NSString *)title countDownTitle:(NSString *)subTitle mainColor:(UIColor *)mColor countColor:(UIColor *)color {
    
    //倒计时时间
    __block NSInteger timeOut = timeLine;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    //每秒执行一次
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{
        
        //倒计时结束，关闭
        if (timeOut <= 0) {
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                self.backgroundColor = mColor;
                [self setTitle:title forState:UIControlStateNormal];
                self.userInteractionEnabled = YES;
            });
        } else {
            int seconds = timeOut % 61;
            NSString *timeStr = [NSString stringWithFormat:@"%d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.backgroundColor = color;
                [self setTitle:[NSString stringWithFormat:@"%@%@后重新发送",timeStr,subTitle] forState:UIControlStateNormal];
                self.userInteractionEnabled = NO;
            });
            timeOut--;
        }
    });
    dispatch_resume(_timer);
}



@end

#pragma mark UILabel
@implementation UILabel(Additions)
+ (UILabel *)labelWithFrame:(CGRect)frame text:(NSString *)text font:(UIFont *)font textColor:(UIColor*)color backGroundColor:(UIColor*)backGroundColor{
    UILabel * label = [[UILabel alloc]initWithFrame:frame];
    label.text = text;
    [label setFont:font];
    [label setTextAlignment:NSTextAlignmentLeft];
    label.textColor = color;
    label.backgroundColor = backGroundColor;
#if !__has_feature(objc_arc)
    return [label autorelease];
#else
    return label;
#endif
}

+ (UILabel *)labelWithFrame:(CGRect)frame text:(NSString *)text font:(UIFont *)font textColor:(UIColor*)color backGroundColor:(UIColor*)backGroundColor textAlignment:(NSTextAlignment)align{
    UILabel * label = [[UILabel alloc]initWithFrame:frame];
    label.text = text;
    [label setFont:font];
    [label setTextAlignment:align];
    label.textColor = color;
    label.backgroundColor = backGroundColor;
#if !__has_feature(objc_arc)
    return [label autorelease];
#else
    return label;
#endif
}
@end

#pragma mark NSString


@implementation NSString(Additions)

- (NSString *)makeUnicodeToString {
    NSString *tempStr1 = [self stringByReplacingOccurrencesOfString:@"\\u"withString:@"\\U"];
    NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"\""withString:@"\\\""];
    NSString *tempStr3 = [[@"\""stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    NSString *returnStr = [NSPropertyListSerialization propertyListWithData:tempData options:NSPropertyListMutableContainersAndLeaves format:NULL error:NULL];
    
    return [returnStr stringByReplacingOccurrencesOfString:@"\\r\\n"withString:@"\n"];
}

+ (NSString *)URLString:(NSString *)urlString appendParameters:(NSDictionary *)parameters {
    if ([urlString hasSuffix:@"/"]&&urlString.length > 1) {
        urlString = [urlString substringToIndex:urlString.length-1];
    }
    if ([urlString rangeOfString:@"?"].location == NSNotFound) {
        urlString = [urlString stringByAppendingString:@"?"];
    }else{
        urlString = [urlString stringByAppendingString:@"&"];
    }
    
    for (NSString *key in parameters) {
        NSString *value = [parameters valueForKey:key];
        urlString = [urlString stringByAppendingFormat:@"%@=%@&",key,value];
    }
    urlString = [urlString substringToIndex:urlString.length - 1];
    return urlString;
}

- (BOOL)hasString:(NSString *)substring
{
    return !([self rangeOfString:substring].location == NSNotFound);
}

-(NSString *)MD5String{
//    if(self==nil || self.length==0){
//        return nil;
//    }
//    const char *cStr = [self UTF8String];
//    unsigned char result[16];
//    CC_MD5( cStr, (uint32_t)strlen(cStr), result );
//    return [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
//            result[0], result[1], result[2], result[3],
//            result[4], result[5], result[6], result[7],
//            result[8], result[9], result[10], result[11],
//            result[12], result[13], result[14], result[15]
//            ] lowercaseString];
    
    return self;
}

-(CGFloat)getTextHeightWithFont:(UIFont *)font textWidth:(CGFloat)width{
    
    //    CGFloat h = [self sizeWithFont:font constrainedToSize:CGSizeMake(width, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping].height;
    
    CGFloat h = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine attributes:[NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName] context:nil].size.height;
    
    return h;
}

-(NSString *)utf8String{
    //stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]
    return [self stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

-(NSString *)gbkString{
    return [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

-(BOOL)validateMobile
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[2378])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:self] == YES)
        || ([regextestcm evaluateWithObject:self] == YES)
        || ([regextestct evaluateWithObject:self] == YES)
        || ([regextestcu evaluateWithObject:self] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

- (BOOL)validatePassWord{
    BOOL result = false;
    if ([self length] >= 6){
        NSString * regex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$";
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        result = [pred evaluateWithObject:self];
    }
    return result;
}


/**
 *  正则表达式验证邮箱
 *
 *  @param email 需验证邮箱字符串
 *
 *  @return 验证结果
 */
-(BOOL)isValidateEmail{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

#pragma mark - a-z
- (NSString *)a { return [self stringByAppendingString:@"a"]; }
- (NSString *)b { return [self stringByAppendingString:@"b"]; }
- (NSString *)c { return [self stringByAppendingString:@"c"]; }
- (NSString *)d { return [self stringByAppendingString:@"d"]; }
- (NSString *)e { return [self stringByAppendingString:@"e"]; }
- (NSString *)f { return [self stringByAppendingString:@"f"]; }
- (NSString *)g { return [self stringByAppendingString:@"g"]; }
- (NSString *)h { return [self stringByAppendingString:@"h"]; }
- (NSString *)i { return [self stringByAppendingString:@"i"]; }
- (NSString *)j { return [self stringByAppendingString:@"j"]; }
- (NSString *)k { return [self stringByAppendingString:@"k"]; }
- (NSString *)l { return [self stringByAppendingString:@"l"]; }
- (NSString *)m { return [self stringByAppendingString:@"m"]; }
- (NSString *)n { return [self stringByAppendingString:@"n"]; }
- (NSString *)o { return [self stringByAppendingString:@"o"]; }
- (NSString *)p { return [self stringByAppendingString:@"p"]; }
- (NSString *)q { return [self stringByAppendingString:@"q"]; }
- (NSString *)r { return [self stringByAppendingString:@"r"]; }
- (NSString *)s { return [self stringByAppendingString:@"s"]; }
- (NSString *)t { return [self stringByAppendingString:@"t"]; }
- (NSString *)u { return [self stringByAppendingString:@"u"]; }
- (NSString *)v { return [self stringByAppendingString:@"v"]; }
- (NSString *)w { return [self stringByAppendingString:@"w"]; }
- (NSString *)x { return [self stringByAppendingString:@"x"]; }
- (NSString *)y { return [self stringByAppendingString:@"y"]; }
- (NSString *)z { return [self stringByAppendingString:@"z"]; }

#pragma mark - A-Z
- (NSString *)A { return [self stringByAppendingString:@"A"]; }
- (NSString *)B { return [self stringByAppendingString:@"B"]; }
- (NSString *)C { return [self stringByAppendingString:@"C"]; }
- (NSString *)D { return [self stringByAppendingString:@"D"]; }
- (NSString *)E { return [self stringByAppendingString:@"E"]; }
- (NSString *)F { return [self stringByAppendingString:@"F"]; }
- (NSString *)G { return [self stringByAppendingString:@"G"]; }
- (NSString *)H { return [self stringByAppendingString:@"H"]; }
- (NSString *)I { return [self stringByAppendingString:@"I"]; }
- (NSString *)J { return [self stringByAppendingString:@"J"]; }
- (NSString *)K { return [self stringByAppendingString:@"K"]; }
- (NSString *)L { return [self stringByAppendingString:@"L"]; }
- (NSString *)M { return [self stringByAppendingString:@"M"]; }
- (NSString *)N { return [self stringByAppendingString:@"N"]; }
- (NSString *)O { return [self stringByAppendingString:@"O"]; }
- (NSString *)P { return [self stringByAppendingString:@"P"]; }
- (NSString *)Q { return [self stringByAppendingString:@"Q"]; }
- (NSString *)R { return [self stringByAppendingString:@"R"]; }
- (NSString *)S { return [self stringByAppendingString:@"S"]; }
- (NSString *)T { return [self stringByAppendingString:@"T"]; }
- (NSString *)U { return [self stringByAppendingString:@"U"]; }
- (NSString *)V { return [self stringByAppendingString:@"V"]; }
- (NSString *)W { return [self stringByAppendingString:@"W"]; }
- (NSString *)X { return [self stringByAppendingString:@"X"]; }
- (NSString *)Y { return [self stringByAppendingString:@"Y"]; }
- (NSString *)Z { return [self stringByAppendingString:@"Z"]; }

#pragma mark - Numbers
- (NSString *)_1 { return [self stringByAppendingString:@"1"]; }
- (NSString *)_2 { return [self stringByAppendingString:@"2"]; }
- (NSString *)_3 { return [self stringByAppendingString:@"3"]; }
- (NSString *)_4 { return [self stringByAppendingString:@"4"]; }
- (NSString *)_5 { return [self stringByAppendingString:@"5"]; }
- (NSString *)_6 { return [self stringByAppendingString:@"6"]; }
- (NSString *)_7 { return [self stringByAppendingString:@"7"]; }
- (NSString *)_8 { return [self stringByAppendingString:@"8"]; }
- (NSString *)_9 { return [self stringByAppendingString:@"9"]; }
- (NSString *)_0 { return [self stringByAppendingString:@"0"]; }

#pragma mark - Punctuation
- (NSString *)space { return [self stringByAppendingString:@" "]; }
- (NSString *)point { return [self stringByAppendingString:@"."]; }
- (NSString *)dash { return [self stringByAppendingString:@"-"]; }
- (NSString *)comma { return [self stringByAppendingString:@","]; }
- (NSString *)semicolon { return [self stringByAppendingString:@";"]; }
- (NSString *)colon { return [self stringByAppendingString:@":"]; }
- (NSString *)apostrophe { return [self stringByAppendingString:@"'"]; }
- (NSString *)quotation { return [self stringByAppendingString:@"\""]; }
- (NSString *)plus { return [self stringByAppendingString:@"+"]; }
- (NSString *)equals { return [self stringByAppendingString:@"="]; }
- (NSString *)paren_left { return [self stringByAppendingString:@"("]; }
- (NSString *)paren_right { return [self stringByAppendingString:@")"]; }
- (NSString *)asterisk { return [self stringByAppendingString:@"*"]; }
- (NSString *)ampersand { return [self stringByAppendingString:@"&"]; }
- (NSString *)caret { return [self stringByAppendingString:@"^"]; }
- (NSString *)percent { return [self stringByAppendingString:@"%"]; }
- (NSString *)$ { return [self stringByAppendingString:@"$"]; }
- (NSString *)pound { return [self stringByAppendingString:@"#"]; }
- (NSString *)at { return [self stringByAppendingString:@"@"]; }
- (NSString *)exclamation { return [self stringByAppendingString:@"!"]; }
- (NSString *)back_slash { return [self stringByAppendingString:@"\\"]; }
- (NSString *)forward_slash { return [self stringByAppendingString:@"/"]; }
- (NSString *)curly_left { return [self stringByAppendingString:@"{"]; }
- (NSString *)curly_right { return [self stringByAppendingString:@"}"]; }
- (NSString *)bracket_left { return [self stringByAppendingString:@"["]; }
- (NSString *)bracket_right { return [self stringByAppendingString:@"]"]; }
- (NSString *)bar { return [self stringByAppendingString:@"|"]; }
- (NSString *)less_than { return [self stringByAppendingString:@"<"]; }
- (NSString *)greater_than { return [self stringByAppendingString:@">"]; }
- (NSString *)underscore { return [self stringByAppendingString:@"_"]; }

#pragma mark - Aliases
- (NSString *)_ { return [self space]; }
- (NSString *)dot { return [self point]; }


@end

#pragma mark UIImage
@implementation UIImage (Color)

+ (UIImage *)composeWithHeader:(UIImage *)header content:(UIImage *)content footer:(UIImage *)footer {
    CGSize size = CGSizeMake(content.size.width, header.size.height +content.size.height +footer.size.height);
    UIGraphicsBeginImageContext(size);
    [header drawInRect:CGRectMake(0,
                                  0,
                                  header.size.width,
                                  header.size.height)];
    [content drawInRect:CGRectMake(0,
                                   header.size.height,
                                   content.size.width,
                                   content.size.height)];
    [footer drawInRect:CGRectMake(0,
                                  header.size.height+content.size.height,
                                  footer.size.width,
                                  footer.size.height)];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)captureScrollView:(UIScrollView *)scrollView {
    UIImage* image = nil;
    UIGraphicsBeginImageContext(scrollView.contentSize);
    {
        CGPoint savedContentOffset = scrollView.contentOffset;
        CGRect savedFrame = scrollView.frame;
        scrollView.contentOffset = CGPointZero;
        scrollView.frame = CGRectMake(0, 0, scrollView.contentSize.width, scrollView.contentSize.height);
        
        [scrollView.layer renderInContext: UIGraphicsGetCurrentContext()];
        image = UIGraphicsGetImageFromCurrentImageContext();
        
        scrollView.contentOffset = savedContentOffset;
        scrollView.frame = savedFrame;
    }
    UIGraphicsEndImageContext();
    
    if (image != nil) {
        return image;
    }
    return nil;
}

+ (void) imageForAssetUrl: (NSString *) assetUrl
                  success: (void(^)(UIImage *aImg)) successBlock
                     fail: (void(^)()) failBlock{
    __block UIImage * image;
    ALAssetsLibrary   *lib = [[ALAssetsLibrary alloc] init];
    [lib assetForURL:[NSURL URLWithString:assetUrl] resultBlock:^(ALAsset *asset)
     {
         // 使用asset来获取本地图片
         ALAssetRepresentation *assetRep = [asset defaultRepresentation];
         CGImageRef imgRef = [assetRep fullResolutionImage];
         image = [UIImage imageWithCGImage:imgRef
                                     scale:assetRep.scale
                               orientation:(UIImageOrientation)assetRep.orientation];
         if (nil == image) { // 获取图片失败
             failBlock();
             return;
         }
         
         successBlock(image);
     }
        failureBlock:^(NSError *error) { // 说明获取图片失败.
            failBlock();
        }];
}


-(UIImage *)upOrientationImage{
    
    // No-op if the orientation is already correct
    if (self.imageOrientation == UIImageOrientationUp)
        return self;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (self.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, self.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, self.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }
    
    switch (self.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        default:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, self.size.width, self.size.height,
                                             CGImageGetBitsPerComponent(self.CGImage), 0,
                                             CGImageGetColorSpace(self.CGImage),
                                             CGImageGetBitmapInfo(self.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (self.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,self.size.height,self.size.width), self.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,self.size.width,self.size.height), self.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}

+ (UIImage *)createImageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

+(UIImage*)createJPGImage:(NSString*)imageName{
    return [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:imageName ofType:@"jpg"]];
}

+(UIImage*)createPNGImage:(NSString*)imageName{
    return [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:imageName ofType:@"png"]];
}

//XHImage
+ (UIImage *)fastImageWithData:(NSData *)data {
    UIImage *image = [UIImage imageWithData:data];
    return [self decode:image];
}
+ (UIImage *)decode:(UIImage *)image {
    if(image == nil) {
        return nil;
    }
    
    UIGraphicsBeginImageContext(image.size);
    
    {
        [image drawAtPoint:CGPointMake(0, 0)];
        image = UIGraphicsGetImageFromCurrentImageContext();
    }
    UIGraphicsEndImageContext();
    
    return image;
}


//UIImage 图片处理 灰度 反色 深棕色

-(UIImage *)grayscaleWithType:(int)type{
    CGImageRef  imageRef;
    imageRef = self.CGImage;
    
    size_t width  = CGImageGetWidth(imageRef);
    size_t height = CGImageGetHeight(imageRef);
    
    size_t                  bitsPerComponent;
    bitsPerComponent = CGImageGetBitsPerComponent(imageRef);
    
    size_t                  bitsPerPixel;
    bitsPerPixel = CGImageGetBitsPerPixel(imageRef);
    
    size_t                  bytesPerRow;
    bytesPerRow = CGImageGetBytesPerRow(imageRef);
    
    CGColorSpaceRef         colorSpace;
    colorSpace = CGImageGetColorSpace(imageRef);
    
    CGBitmapInfo            bitmapInfo;
    bitmapInfo = CGImageGetBitmapInfo(imageRef);
    
    bool                    shouldInterpolate;
    shouldInterpolate = CGImageGetShouldInterpolate(imageRef);
    
    CGColorRenderingIntent  intent;
    intent = CGImageGetRenderingIntent(imageRef);
    
    CGDataProviderRef   dataProvider;
    dataProvider = CGImageGetDataProvider(imageRef);
    
    CFDataRef   data;
    UInt8*      buffer;
    data = CGDataProviderCopyData(dataProvider);
    buffer = (UInt8*)CFDataGetBytePtr(data);
    
    NSUInteger  x, y;
    for (y = 0; y < height; y++) {
        for (x = 0; x < width; x++) {
            UInt8*  tmp;
            tmp = buffer + y * bytesPerRow + x * 4;
            UInt8 red,green,blue;
            red = *(tmp + 0);
            green = *(tmp + 1);
            blue = *(tmp + 2);
            
            UInt8 brightness;
            
            switch (type) {
                case 1://灰度
                    brightness = (77 * red + 28 * green + 151 * blue) / 256;
                    
                    *(tmp + 0) = brightness;
                    *(tmp + 1) = brightness;
                    *(tmp + 2) = brightness;
                    break;
                    
                case 2://深棕色
                    *(tmp + 0) = red;
                    *(tmp + 1) = green * 0.7;
                    *(tmp + 2) = blue * 0.4;
                    break;
                    
                case 3://反色
                    *(tmp + 0) = 255 - red;
                    *(tmp + 1) = 255 - green;
                    *(tmp + 2) = 255 - blue;
                    break;
                    
                default:
                    *(tmp + 0) = red;
                    *(tmp + 1) = green;
                    *(tmp + 2) = blue;
                    break;
            }
            
        }
    }
    
    CFDataRef   effectedData;
    effectedData = CFDataCreate(NULL, buffer, CFDataGetLength(data));
    
    CGDataProviderRef   effectedDataProvider;
    effectedDataProvider = CGDataProviderCreateWithCFData(effectedData);
    
    CGImageRef  effectedCgImage;
    UIImage*    effectedImage;
    effectedCgImage = CGImageCreate(
                                    width, height,
                                    bitsPerComponent, bitsPerPixel, bytesPerRow,
                                    colorSpace, bitmapInfo, effectedDataProvider,
                                    NULL, shouldInterpolate, intent);
    effectedImage = [UIImage imageWithCGImage:effectedCgImage];
    
    
    CGImageRelease(effectedCgImage);
    CFRelease(effectedDataProvider);
    CFRelease(effectedData);
    CFRelease(data);
    
    return effectedImage;
}


+ (NSDictionary *)separateImage:(UIImage *)image ByX:(int)x andY:(int)y cacheQuality:(float)quality {
    if (x < 1) {
        return nil;
    } else if (y < 1) {
        return nil;
    }
    if (![image isKindOfClass:[UIImage class]]) {
        return nil;
    }
    
    float _xstep = image.size.width * 1.0 / ( y + 1);
    float _ystep = image.size.height * 1.0 / (x + 1);
    NSMutableDictionary *_mutableDictionary = [[NSMutableDictionary alloc] initWithCapacity:1];
    NSString *prefixName = @"win";
    
    for (int i = 0; i < x; i++) {
        for (int j = 0; j < y; j++) {
            CGRect rect = CGRectMake(_xstep * j, _ystep * i, _xstep, _ystep);
            CGImageRef imageRef = CGImageCreateWithImageInRect([image CGImage], rect);
            UIImage *elementImage = [UIImage imageWithCGImage:imageRef];
            CGImageRelease(imageRef);
            UIImageView *_imageView = [[UIImageView alloc] initWithImage:elementImage];
            _imageView.frame = rect;
            NSString *_imageString = [NSString stringWithFormat:@"%@_%d_%d.jpg", prefixName, i, j];
            [_mutableDictionary setObject:_imageView forKey:_imageString];
            if (quality <= 0)
                continue;
            quality = (quality > 1) ? 1 : quality;
            NSString *_imagePath = [NSHomeDirectory() stringByAppendingPathComponent:_imageString];
            NSData * _imageData = UIImageJPEGRepresentation(elementImage, quality);
            [_imageData writeToFile:_imagePath atomically:NO];
            
        }
    }
    
    NSDictionary *_dictionary = _mutableDictionary;
    return _dictionary;
}

-(UIImage*)imageScaledToSize:(CGSize)newSize
{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    
    // Tell the old image to draw in this new context, with the desired
    // new size
    [self drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the context
    UIGraphicsEndImageContext();
    
    // Return the new image.
    return newImage;
}

-(UIImage *)thumbnailWithSize:(CGSize)asize//非等比按size(横着要中间,竖着要上边)
{
    UIImage *newimage = nil;
    if (self){
        CGSize imageSize = self.size;
        CGRect rect = CGRectZero;
        if (asize.width > asize.height) {//终横
            if(imageSize.width > imageSize.height){//图横
                rect.size.height = asize.height;
                rect.size.width = (asize.height/imageSize.height)*imageSize.width;
                rect.origin.x = -(rect.size.width-asize.width)/2;
                if (rect.size.width < asize.width) {
                    rect.size.width = asize.width;
                    rect.size.height = imageSize.height*(asize.width/imageSize.width);
                    rect.origin.x = 0;
                    rect.origin.y = -(rect.size.height-asize.height)/3;
                }
            }else{//图竖
                rect.size.width = asize.width;
                rect.size.height = imageSize.height*(asize.width/imageSize.width);
                rect.origin.y = -(rect.size.height-asize.width)/3;
            }
        }else{//终竖
            if(imageSize.width>imageSize.height){//图横
                rect.size.height = asize.height;
                rect.size.width = imageSize.width*(asize.height/imageSize.height);
                rect.origin.x = -(rect.size.width-asize.width)/3;
            }else{//图竖
                rect.size.width = asize.width;
                rect.size.height = (asize.width/imageSize.width)*imageSize.height;
                rect.origin.y = -(rect.size.height-asize.height)/3;
                if (rect.size.height < asize.height) {
                    rect.size.height = asize.height;
                    rect.size.width = imageSize.width*(asize.height/imageSize.height);
                    rect.origin.y = 0;
                    rect.origin.x = -(rect.size.width-asize.width)/2;
                }
            }
        }
        UIGraphicsBeginImageContext(asize);
        [self drawInRect:rect];
        newimage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    return newimage;
}


-(UIImage *)thumbnailByScaleWithSize:(CGSize)asize//等比例全图(差为空)
{
    UIImage *newimage = nil;
    if (self){
        CGSize oldsize = self.size;
        CGRect rect;
        if (asize.width/asize.height > oldsize.width/oldsize.height) {
            rect.size.width = asize.height*oldsize.width/oldsize.height;
            rect.size.height = asize.height;
            rect.origin.x = (asize.width - rect.size.width)/2;
            rect.origin.y = 0;
        }
        else{
            rect.size.width = asize.width;
            rect.size.height = asize.width*oldsize.height/oldsize.width;
            rect.origin.x = 0;
            rect.origin.y = (asize.height - rect.size.height)/2;
        }
        UIGraphicsBeginImageContext(asize);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
        UIRectFill(CGRectMake(0, 0, asize.width, asize.height));//clear background
        [self drawInRect:rect];
        newimage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    return newimage;
}

-(UIImage *)waterWithText:(NSString *)text direction:(ImageWaterDirect)direction fontColor:(UIColor *)fontColor fontPoint:(CGFloat)fontPoint marginXY:(CGPoint)marginXY{
    
    CGSize size = self.size;
    
    CGRect rect = (CGRect){CGPointZero,size};
    
    //新建图片图形上下文
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0f);
    
    //绘制图片
    [self drawInRect:rect];
    
    //绘制文本
    NSDictionary *attr =@{NSFontAttributeName : [UIFont systemFontOfSize:fontPoint],NSForegroundColorAttributeName:fontColor};
    
    CGRect strRect = [self calWidth:text attr:attr direction:direction rect:rect marginXY:marginXY];
    
    [text drawInRect:strRect withAttributes:attr];
    
    //获取图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //结束图片图形上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}

+(UIImage *)stretchedImageWithName:(NSString *)name{
    
    UIImage *image = [UIImage imageNamed:name];
    int leftCap = image.size.width * 0.5;
    int topCap = image.size.height * 0.5;
    return [image stretchableImageWithLeftCapWidth:leftCap topCapHeight:topCap];
}

-(CGRect)calWidth:(NSString *)str attr:(NSDictionary *)attr direction:(ImageWaterDirect)direction rect:(CGRect)rect marginXY:(CGPoint)marginXY{
    
    CGSize size =  [str sizeWithAttributes:attr];
    
    CGRect calRect = [self rectWithRect:rect size:size direction:direction marginXY:marginXY];
    
    return calRect;
}


-(CGRect)rectWithRect:(CGRect)rect size:(CGSize)size direction:(ImageWaterDirect)direction marginXY:(CGPoint)marginXY{
    
    CGPoint point = CGPointZero;
    
    //右上
    if(ImageWaterDirectTopRight == direction) point = CGPointMake(rect.size.width - size.width, 0);
    
    //左下
    if(ImageWaterDirectBottomLeft == direction) point = CGPointMake(0, rect.size.height - size.height);
    
    //右下
    if(ImageWaterDirectBottomRight == direction) point = CGPointMake(rect.size.width - size.width, rect.size.height - size.height);
    
    //正中
    if(ImageWaterDirectCenter == direction) point = CGPointMake((rect.size.width - size.width)*.5f, (rect.size.height - size.height)*.5f);
    
    point.x+=marginXY.x;
    point.y+=marginXY.y;
    
    CGRect calRect = (CGRect){point,size};
    
    return calRect;
}




-(UIImage *)waterWithWaterImage:(UIImage *)waterImage direction:(ImageWaterDirect)direction waterSize:(CGSize)waterSize  marginXY:(CGPoint)marginXY{
    
    CGSize size = self.size;
    
    CGRect rect = (CGRect){CGPointZero,size};
    
    //新建图片图形上下文
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0f);
    
    //绘制图片
    [self drawInRect:rect];
    
    //计算水印的rect
    CGSize waterImageSize = CGSizeEqualToSize(waterSize, CGSizeZero)?waterImage.size:waterSize;
    CGRect calRect = [self rectWithRect:rect size:waterImageSize direction:direction marginXY:marginXY];
    
    //绘制水印图片
    [waterImage drawInRect:calRect];
    
    //获取图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //结束图片图形上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}



+(UIImage *)cutFromView:(UIView *)view{
    
    //开启图形上下文
    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, 0.0f);
    
    //获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //在新建的图形上下文中渲染view的layer
    [view.layer renderInContext:context];
    
    [[UIColor clearColor] setFill];
    
    //获取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭图形上下文
    UIGraphicsEndImageContext();
    
    return image;
    
}


//给我一种颜色，一个尺寸，我给你返回一个UIImage
+(UIImage *)imageFromContextWithColor:(UIColor *)color size:(CGSize)size{
    
    CGRect rect=(CGRect){{0.0f,0.0f},size};
    
    //开启一个图形上下文
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0f);
    
    //获取图形上下文
    CGContextRef context=UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    
    CGContextFillRect(context, rect);
    
    //获取图像
    UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭上下文
    UIGraphicsEndImageContext();
    
    return image;
}

+(UIImage *)imageFromContextWithColor:(UIColor *)color{
    
    CGSize size=CGSizeMake(1.0f, 1.0f);
    
    return [self imageFromContextWithColor:color size:size];
}


- (UIImage *) imageWithTintColor:(UIColor *)tintColor
{
    return [self imageWithTintColor:tintColor blendMode:kCGBlendModeDestinationIn];
}

- (UIImage *) imageWithGradientTintColor:(UIColor *)tintColor
{
    return [self imageWithTintColor:tintColor blendMode:kCGBlendModeOverlay];
}

- (UIImage *) imageWithTintColor:(UIColor *)tintColor blendMode:(CGBlendMode)blendMode
{
    //We want to keep alpha, set opaque to NO; Use 0.0f for scale to use the scale factor of the device’s main screen.
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    [tintColor setFill];
    CGRect bounds = CGRectMake(0, 0, self.size.width, self.size.height);
    UIRectFill(bounds);
    
    //Draw the tinted image in context
    [self drawInRect:bounds blendMode:blendMode alpha:1.0f];
    
    if (blendMode != kCGBlendModeDestinationIn) {
        [self drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.0f];
    }
    
    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return tintedImage;
}


@end


#pragma mark UIImageView
@implementation UIImageView(Additions)

+ (UIImageView *)imageViewWithFrame:(CGRect)frame image:(UIImage *)image userInteractionEnabled:(BOOL)userInteractionEnabled
{
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.image = image;
    imageView.userInteractionEnabled = userInteractionEnabled;
#if !__has_feature(objc_arc)
    return [imageView autorelease];
#else
    return imageView;
#endif
}
+ (UIImageView *)imageViewWithFrame:(CGRect)frame image:(UIImage *)image{
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.image = image;
#if !__has_feature(objc_arc)
    return [imageView autorelease];
#else
    return imageView;
#endif
}


+ (UIImageView *)imageViewWithImage:(UIImage *)image Center:(CGPoint)center{
    UIImageView * imageView = [[UIImageView alloc] initWithImage:image];
    imageView.center = center;
#if !__has_feature(objc_arc)
    return [imageView autorelease];
#else
    return imageView;
#endif
}

+ (UIImageView *)imageViewWithImage:(UIImage *)image origin:(CGPoint)origin{
    UIImageView * imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(origin.x, origin.y, image.size.width, image.size.height);
#if !__has_feature(objc_arc)
    return [imageView autorelease];
#else
    return imageView;
#endif
}


+ (UIImageView *)imageViewWithFrame:(CGRect)frame image:(UIImage *)image center:(CGPoint)center{
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.image = image;
    imageView.center = center;
#if !__has_feature(objc_arc)
    return [imageView autorelease];
#else
    return imageView;
#endif
}

-(void)showLableWithTitle:(NSString *)title{
    if (title) {
        UILabel *lable = [UILabel labelWithFrame:CGRectMake(0, self.frame.size.height-40, 40, 40) text:title font:[UIFont systemFontOfSize:13] textColor:[UIColor colorWithRed:222/255.0 green:222/255.0 blue:222/255.0 alpha:0.78] backGroundColor:[UIColor blackColor] textAlignment:NSTextAlignmentCenter];
        lable.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        lable.layer.cornerRadius = 20;
        lable.clipsToBounds = YES;
        [self addSubview:lable];
    }
    
}

const NSString *IMAGEVIEW_DID_SELECTED = @"IMAGEVIEW_DID_SELECTED";

const NSString *IMAGEVIEW_TAP_TO_LOAD = @"IMAGEVIEW_TAP_TO_LOAD";

-(BOOL)selected{
    return [objc_getAssociatedObject(self,&IMAGEVIEW_DID_SELECTED) boolValue];
}

-(void)setSelected:(BOOL)selected{
    objc_setAssociatedObject(self,&IMAGEVIEW_DID_SELECTED,[NSNumber numberWithBool:selected],OBJC_ASSOCIATION_ASSIGN);
}


+(BOOL)tapToLoadImage{
    return [objc_getAssociatedObject(self,&IMAGEVIEW_TAP_TO_LOAD) boolValue];
}

+(void)setTapToLoadImage:(BOOL)tap{
    objc_setAssociatedObject(self,&IMAGEVIEW_TAP_TO_LOAD,[NSNumber numberWithBool:tap],OBJC_ASSOCIATION_ASSIGN);
}


@end

@implementation NSUserDefaults (DN)

-(void)setObj:(id)i forKey:(NSString*)key {
    if (i!=nil && ![i isEqual:[NSNull null]]) {
        [self setObject:i forKey:key];
    }
}

@end



@implementation NSURL (DN)

- (NSDictionary *)parameters {
    NSMutableDictionary * parametersDictionary = [NSMutableDictionary dictionary];
    NSArray * queryComponents = [self.query componentsSeparatedByString:@"&"];
    
    for (NSString * queryComponent in queryComponents) {
        NSString * key = [queryComponent componentsSeparatedByString:@"="].firstObject;
        NSString *last = [queryComponent componentsSeparatedByString:@"="].lastObject;
        if (last.length > 0) {
            NSString * value = [queryComponent substringFromIndex:(key.length + 1)];
            [parametersDictionary setObject:value forKey:key];
        }
    }
    return parametersDictionary;
}

@end



#pragma mark UIWebView
@implementation UIWebView (Additions)

- (void)webView:(UIWebView *)sender runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(CGRect *)frame {
    UIAlertView* customAlert = [[UIAlertView alloc] initWithTitle:@"提示信息" message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [customAlert show];
}

- (void)loadWebsite:(NSString *)website {
    [self loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:website]]];
}

- (void)postWebsite:(NSString *)website body:(NSString *)body {
//    website = [website stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    body = [body stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"%@-hh-%@",website, body);
    NSURL *url = [NSURL URLWithString:website];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];

    NSArray * cookies = [[NSHTTPCookieStorage  sharedHTTPCookieStorage] cookies];
    NSDictionary * headers = [NSHTTPCookie requestHeaderFieldsWithCookies:cookies];
    
    NSMutableDictionary* cookieDictionary = [NSMutableDictionary new];
    for (NSHTTPCookie* cookie in cookies) {
        NSDictionary *dic = @{cookie.name : cookie.value};
        [cookieDictionary addEntriesFromDictionary:dic];
    }
    
    [request setHTTPShouldHandleCookies:YES];
    [request setAllHTTPHeaderFields:headers];
    
    NSLog(@"cookies--->%@---->%@",cookies, headers);
//    NSString *cookiesStr = cookies[0];
    
    //<NSHTTPCookie version:0 name:\"PHPSESSID\" value:\"d0kbltbrqdji5ns3ed2n8if3s0\" expiresDate:(null) created:2016-01-29 04:00:45 +0000 (4.75733e+08) sessionOnly:TRUE domain:\"wiibao.tc.mainone.cn\" path:\"/\" isSecure:FALSE>
    
    [request setHTTPMethod: @"POST"];
    [request setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
    [self loadRequest:request];
    
    NSLog(@"dic=====>%@",cookieDictionary);
    
}

- (void)clearCookies {
    NSHTTPCookieStorage *storage = NSHTTPCookieStorage.sharedHTTPCookieStorage;
    for (NSHTTPCookie *cookie in storage.cookies)
        [storage deleteCookie:cookie];
    [NSUserDefaults.standardUserDefaults synchronize];
}

- (void)removeBackgroundShadow {
    for (UIView *eachSubview in [self.scrollView subviews]) {
        if ([eachSubview isKindOfClass:[UIImageView class]] && eachSubview.frame.origin.x <= 500) {
            eachSubview.hidden = YES;
            [eachSubview removeFromSuperview];
        }
    }
}

- (NSString *)getCurrentURL {
    return [self stringByEvaluatingJavaScriptFromString:@"document.location.href"];
}

- (NSString *)getTitle {
    return [self stringByEvaluatingJavaScriptFromString:@"document.title"];
}

- (NSArray *)getImgs {
    NSMutableArray *arrImgURL = [[NSMutableArray alloc] init];
    for (int i = 0; i < [self nodeCountOfTag:@"img"]; i++) {
        NSString *jsString = [NSString stringWithFormat:@"document.getElementsByTagName('img')[%d].src", i];
        NSString *imageStr = [self stringByEvaluatingJavaScriptFromString:jsString];
        NSLog(@"网页的所有图片-=-=-===~~~~~>%@",imageStr);
        if ([[imageStr lowercaseString] hasSuffix:@".jpg"] || [[imageStr lowercaseString] hasSuffix:@".png"] ) {
            [arrImgURL addObject:imageStr];
        }
        
    }
    return arrImgURL;
}

/// 获取某个标签的结点个数
- (int)nodeCountOfTag:(NSString *)tag {
    NSString *jsString = [NSString stringWithFormat:@"document.getElementsByTagName('%@').length", tag];
    int len = [[self stringByEvaluatingJavaScriptFromString:jsString] intValue];
    return len;
}


- (NSString *)getShareTitle {
   NSString *shareTitle = [self getContentWithID:@"title_share"];
    return shareTitle;
}

- (NSString *)getShareImage {
    NSString *shareImage = [self getContentWithID:@"image_share"];
    if (shareImage.length > 0) {
        return shareImage;
    }else {
        return @"http://img.wiibao.cn/wiibao/144.png";
    }
    
}

- (NSString *)getSharecontent {
    NSString *sharecontent = [self getContentWithID:@"content_share"];
    if (sharecontent.length > 0) {
        return sharecontent;
    }else {
        return @"详情";
    }
}

- (NSString *)getShareURL {
    NSString *shareURL= [self getContentWithID:@"url_share"];
    return shareURL;

}

- (NSString *)getContentWithID:(NSString *)tagID {
    for (int i = 0; i < [self nodeCountOfTag:@"input"]; i++) {
        NSString *jsString = [NSString stringWithFormat:@"document.getElementsByTagName('input')[%d].value", i];
        NSString *jsStringID = [NSString stringWithFormat:@"document.getElementsByTagName('input')[%d].id", i];
        if ([[self stringByEvaluatingJavaScriptFromString:jsStringID] isEqualToString:tagID]) {
            return [self stringByEvaluatingJavaScriptFromString:jsString];
        }
    }
    return nil;
}




@end

#pragma mark UITextField
@implementation UITextField(Additions)

-(void)addLeftViewWithImage:(NSString *)image{
    
    
    // 密码输入框左边图片
    UIImageView *lockIv = [[UIImageView alloc] init];
    
    // 设置尺寸
    CGRect imageBound = self.bounds;
    // 宽度高度一样
    imageBound.size.width = imageBound.size.height;
    lockIv.bounds = imageBound;
    
    // 设置图片
    lockIv.image = [UIImage imageNamed:image];
    
    // 设置图片居中显示
    lockIv.contentMode = UIViewContentModeCenter;
    
    // 添加TextFiled的左边视图
    self.leftView = lockIv;
    
    // 设置TextField左边的总是显示
    self.leftViewMode = UITextFieldViewModeAlways;
}

+(UITextField*)textFieldWithFrame:(CGRect)frame
                        alignment:(NSTextAlignment)alignment
                      placeholder:(NSString*)placeholder
                      borderStyle:(UITextBorderStyle)borderStyle delegate:(id<UITextFieldDelegate>)vc{
    UITextField * text = [[UITextField alloc]initWithFrame:frame];
    [text setTextAlignment:alignment];
    text .text = @"";
    text.backgroundColor = [UIColor clearColor];
    [text setBorderStyle:borderStyle];//设置属性
    text.placeholder = placeholder;//设置提示文字
    //    text.backgroundColor = [UIColor whiteColor];
    text.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;//设置字体垂直居中
    text.delegate = vc;
#if !__has_feature(objc_arc)
    return [text autorelease];
#else
    return text;
#endif
}

@end

static const char *phTextView = "placeHolderTextView";
@implementation UITextView (DN)

- (UITextView *)placeHolderTextView {
    return objc_getAssociatedObject(self, phTextView);
}

- (void)setPlaceHolderTextView:(UITextView *)placeHolderTextView {
    objc_setAssociatedObject(self, phTextView, placeHolderTextView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)addPlaceHolder:(NSString *)placeHolder {
    if (![self placeHolderTextView]) {
        self.delegate = self;
        UITextView *textView = [[UITextView alloc] initWithFrame:self.bounds];
        textView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        textView.font = self.font;
        textView.backgroundColor = [UIColor clearColor];
        textView.textColor = [UIColor grayColor];
        textView.userInteractionEnabled = NO;
        textView.text = placeHolder;
        [self addSubview:textView];
        [self setPlaceHolderTextView:textView];
    }
}

# pragma mark - UITextViewDelegate
- (void)textViewDidBeginEditing:(UITextView *)textView {
    self.placeHolderTextView.hidden = YES;
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    if (textView.text && [textView.text isEqualToString:@""]) {
        self.placeHolderTextView.hidden = NO;
    }
}


@end


#pragma mark EncodeURL
@implementation EncodeURL

+ (NSString*)URLencode:(NSString *)originalString stringEncoding:(NSStringEncoding)stringEncoding {
    //!  @  $  &  (  )  =  +  ~  `  ;  '  :  ,  /  ?
    //%21%40%24%26%28%29%3D%2B%7E%60%3B%27%3A%2C%2F%3F
    NSArray *escapeChars = [NSArray arrayWithObjects:@";" , @"/" , @"?" , @":" ,
                            @"@" , @"&" , @"=" , @"+" ,    @"$" , @"," ,
                            @"!", @"'", @"(", @")", @"*", nil];
    
    NSArray *replaceChars = [NSArray arrayWithObjects:@"%3B" , @"%2F", @"%3F" , @"%3A" ,
                             @"%40" , @"%26" , @"%3D" , @"%2B" , @"%24" , @"%2C" ,
                             @"%21", @"%27", @"%28", @"%29", @"%2A", nil];
    
    int len = (int)[escapeChars count];
    
    NSMutableString *temp = [[originalString
                              stringByAddingPercentEscapesUsingEncoding:stringEncoding]
                             mutableCopy];
    
    int i;
    for (i = 0; i < len; i++) {
        [temp replaceOccurrencesOfString:[escapeChars objectAtIndex:i]
                              withString:[replaceChars objectAtIndex:i]
                                 options:NSLiteralSearch
                                   range:NSMakeRange(0, [temp length])];
    }
    
    NSString *outStr = [NSString stringWithString:temp];
    
    return outStr;
}


@end


#include <sys/types.h>
#include <sys/sysctl.h>
#include <sys/socket.h>
#include <net/if.h>
#include <net/if_dl.h>

static NSString * const BFUniqueIdentifierDefaultsKey = @"BFUniqueIdentifier";

#pragma mark UIDevice
@implementation UIDevice (BFKit)

+(NSString *)name{
    return [[UIDevice currentDevice] name];
}

+ (NSString *)devicePlatform
{
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithUTF8String:machine];
    free(machine);
    return platform;
}

+ (NSString *)devicePlatformString
{
    NSString *platform = [self devicePlatform];
    // iPhone
    if ([platform isEqualToString:@"iPhone1,1"])    return @"iPhone 2G";
    if ([platform isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,3"])    return @"iPhone 4 (CDMA)";
    if ([platform isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"])    return @"iPhone 5 (GSM)";
    if ([platform isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (CDMA)";
    if ([platform isEqualToString:@"iPhone5,3"])    return @"iPhone 5C (GSM)";
    if ([platform isEqualToString:@"iPhone5,4"])    return @"iPhone 5C (Global)";
    if ([platform isEqualToString:@"iPhone6,1"])    return @"iPhone 5S (GSM)";
    if ([platform isEqualToString:@"iPhone6,2"])    return @"iPhone 5S (Global)";
    if ([platform isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    // iPod
    if ([platform isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([platform isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([platform isEqualToString:@"iPod5,1"])      return @"iPod Touch 5G";
    // iPad
    if ([platform isEqualToString:@"iPad1,1"])      return @"iPad 1";
    if ([platform isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([platform isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([platform isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([platform isEqualToString:@"iPad2,4"])      return @"iPad 2 (32nm)";
    if ([platform isEqualToString:@"iPad2,5"])      return @"iPad mini (WiFi)";
    if ([platform isEqualToString:@"iPad2,6"])      return @"iPad mini (GSM)";
    if ([platform isEqualToString:@"iPad2,7"])      return @"iPad mini (CDMA)";
    if ([platform isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
    if ([platform isEqualToString:@"iPad3,2"])      return @"iPad 3 (CDMA)";
    if ([platform isEqualToString:@"iPad3,3"])      return @"iPad 3 (GSM)";
    if ([platform isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([platform isEqualToString:@"iPad3,5"])      return @"iPad 4 (GSM)";
    if ([platform isEqualToString:@"iPad3,6"])      return @"iPad 4 (CDMA)";
    if ([platform isEqualToString:@"iPad4,1"])      return @"iPad Air (WiFi)";
    if ([platform isEqualToString:@"iPad4,2"])      return @"iPad Air (Cellular)";
    if ([platform isEqualToString:@"iPad4,3"])      return @"iPad Air (China)";
    if ([platform isEqualToString:@"iPad5,3"])      return @"iPad Air 2 (WiFi)";
    if ([platform isEqualToString:@"iPad5,4"])      return @"iPad Air 2 (Cellular)";
    // iPad mini
    if ([platform isEqualToString:@"iPad4,4"])      return @"iPad mini 2 (WiFi)";
    if ([platform isEqualToString:@"iPad4,5"])      return @"iPad mini 2 (Cellular)";
    if ([platform isEqualToString:@"iPad4,6"])      return @"iPad mini 2 (China)";
    if ([platform isEqualToString:@"iPad4,7"])      return @"iPad mini 3 (WiFi)";
    if ([platform isEqualToString:@"iPad4,8"])      return @"iPad mini 3 (Cellular)";
    if ([platform isEqualToString:@"iPad4,9"])      return @"iPad mini 3 (China)";
    // Simulator
    if ([platform isEqualToString:@"i386"])         return @"Simulator";
    if ([platform isEqualToString:@"x86_64"])       return @"Simulator";
    return platform;
}

+ (BOOL)isiPad
{
    if([[[self devicePlatform] substringToIndex:4] isEqualToString:@"iPad"])
        return YES;
    else
        return NO;
}

+ (BOOL)isiPhone
{
    if([[[self devicePlatform] substringToIndex:6] isEqualToString:@"iPhone"])
        return YES;
    else
        return NO;
}

+ (BOOL)isiPod
{
    if([[[self devicePlatform] substringToIndex:4] isEqualToString:@"iPod"])
        return YES;
    else
        return NO;
}

+ (BOOL)isSimulator
{
    if([[self devicePlatform] isEqualToString:@"i386"] || [[self devicePlatform] isEqualToString:@"x86_64"])
        return YES;
    else
        return NO;
}

+ (BOOL)isRetina
{
    if ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)] && ([UIScreen mainScreen].scale == 2.0 || [UIScreen mainScreen].scale == 3.0))
        return YES;
    else
        return NO;
}

+ (BOOL)isRetinaHD
{
    if ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)] && ([UIScreen mainScreen].scale == 3.0))
        return YES;
    else
        return NO;
}

+ (NSInteger)iOSVersion
{
    return [[[UIDevice currentDevice] systemVersion] integerValue];
}

+ (NSUInteger)getSysInfo:(uint)typeSpecifier
{
    size_t size = sizeof(int);
    int results;
    int mib[2] = {CTL_HW, typeSpecifier};
    sysctl(mib, 2, &results, &size, NULL, 0);
    return (NSUInteger) results;
}

+ (NSUInteger)cpuFrequency
{
    return [self getSysInfo:HW_CPU_FREQ];
}

+ (NSUInteger)busFrequency
{
    return [self getSysInfo:HW_BUS_FREQ];
}

+ (NSUInteger)ramSize
{
    return [self getSysInfo:HW_MEMSIZE];
}

+ (NSUInteger)cpuNumber
{
    return [self getSysInfo:HW_NCPU];
}

+ (NSUInteger)totalMemory
{
    return [self getSysInfo:HW_PHYSMEM];
}

+ (NSUInteger)userMemory
{
    return [self getSysInfo:HW_USERMEM];
}

+ (NSNumber *)totalDiskSpace
{
    NSDictionary *fattributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    return [fattributes objectForKey:NSFileSystemSize];
}

+ (NSNumber *)freeDiskSpace
{
    NSDictionary *fattributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    return [fattributes objectForKey:NSFileSystemFreeSize];
}

+ (NSString *)macAddress
{
    int                 mib[6];
    size_t              len;
    char                *buf;
    unsigned char       *ptr;
    struct if_msghdr    *ifm;
    struct sockaddr_dl  *sdl;
    
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    
    if((mib[5] = if_nametoindex("en0")) == 0)
    {
        printf("Error: if_nametoindex error\n");
        return NULL;
    }
    
    if(sysctl(mib, 6, NULL, &len, NULL, 0) < 0)
    {
        printf("Error: sysctl, take 1\n");
        return NULL;
    }
    
    if((buf = malloc(len)) == NULL)
    {
        printf("Could not allocate memory. Rrror!\n");
        return NULL;
    }
    
    if(sysctl(mib, 6, buf, &len, NULL, 0) < 0)
    {
        printf("Error: sysctl, take 2");
        return NULL;
    }
    
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    NSString *outstring = [NSString stringWithFormat:@"%02X:%02X:%02X:%02X:%02X:%02X",
                           *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    // NSString *outstring = [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X",
    //                       *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    free(buf);
    
    return outstring;
}

+ (NSString *)uniqueIdentifier
{
    NSString *uuid;
    if([[UIDevice currentDevice] respondsToSelector:@selector(identifierForVendor)])
    {
        uuid = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    }
    else
    {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        uuid = [defaults objectForKey:BFUniqueIdentifierDefaultsKey];
        if (!uuid) {
            uuid = [self generateUUID];
            [defaults setObject:uuid forKey:BFUniqueIdentifierDefaultsKey];
            [defaults synchronize];
        }
    }
    return uuid;
}

+ (NSString *)generateUUID
{
    CFUUIDRef theUUID = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, theUUID);
    CFRelease(theUUID);
    return (__bridge_transfer NSString *)string;
}

@end

#pragma mark CALayer
@implementation CALayer(Additions)
-(void)rotationAnimationToValue:(CGFloat)value functionName:(NSString*)name duration:(CFTimeInterval)time repeatCount:(int)count delegate:(id)deg{
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];//旋转动画
    [rotationAnimation setTimingFunction:[CAMediaTimingFunction functionWithName:name]];//设置动画特效
    rotationAnimation.toValue = [NSNumber numberWithFloat: value];//旋转度数
    rotationAnimation.duration = time;//动画时间
    rotationAnimation.cumulative = YES;//是否还原
    rotationAnimation.repeatCount = count;//重复次数
    rotationAnimation.delegate = deg;
    [self addAnimation:rotationAnimation forKey:@"rotationAnimation"];//运行动画
}




/**
 *  转场动画
 *
 *  @param animType 转场动画类型
 *  @param subtype  转动动画方向
 *  @param curve    转动动画曲线
 *  @param duration 转动动画时长
 *
 *  @return 转场动画实例
 */
-(CATransition *)transitionWithAnimType:(CALayerTransitionAnimType)animType subType:(CALayerTransitionSubType)subType curve:(CALayerTransitionCurve)curve duration:(CGFloat)duration{
    
    NSString *key = @"transition";
    
    if([self animationForKey:key]!=nil){
        [self removeAnimationForKey:key];
    }
    
    
    CATransition *transition=[CATransition animation];
    
    //动画时长
    transition.duration=duration;
    
    //动画类型
    transition.type=[self animaTypeWithTransitionType:animType];
    
    //动画方向
    transition.subtype=[self animaSubtype:subType];
    
    //缓动函数
    transition.timingFunction=[CAMediaTimingFunction functionWithName:[self curve:curve]];
    
    //完成动画删除
    transition.removedOnCompletion = YES;
    
    [self addAnimation:transition forKey:key];
    
    return transition;
}



/*
 *  返回动画曲线
 */
-(NSString *)curve:(CALayerTransitionCurve)curve{
    
    //曲线数组
    NSArray *funcNames=@[kCAMediaTimingFunctionDefault,kCAMediaTimingFunctionEaseIn,kCAMediaTimingFunctionEaseInEaseOut,kCAMediaTimingFunctionEaseOut,kCAMediaTimingFunctionLinear];
    
    return [self objFromArray:funcNames index:curve isRamdom:(CALayerTransitionCurveRamdom == curve)];
}



/*
 *  返回动画方向
 */
-(NSString *)animaSubtype:(CALayerTransitionSubType)subType{
    
    //设置转场动画的方向
    NSArray *subtypes=@[kCATransitionFromTop,kCATransitionFromLeft,kCATransitionFromBottom,kCATransitionFromRight];
    
    return [self objFromArray:subtypes index:subType isRamdom:(CALayerTransitionSubtypesFromRamdom == subType)];
}




/*
 *  返回动画类型
 */
-(NSString *)animaTypeWithTransitionType:(CALayerTransitionAnimType)type{
    
    //设置转场动画的类型
    NSArray *animArray=@[@"rippleEffect",@"suckEffect",@"pageCurl",@"oglFlip",@"cube",@"reveal",@"pageUnCurl"];
    
    return [self objFromArray:animArray index:type isRamdom:(CALayerTransitionAnimTypeRamdom == type)];
}



/*
 *  统一从数据返回对象
 */
-(id)objFromArray:(NSArray *)array index:(NSUInteger)index isRamdom:(BOOL)isRamdom{
    
    NSUInteger count = array.count;
    
    NSUInteger i = isRamdom?arc4random_uniform((u_int32_t)count) : index;
    
    return array[i];
}


@end


#pragma mark NSDate
@implementation NSDate (Extend)

- (NSString *)formatRecentContactDate
{
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents *todayComponents = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay |
                                         NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitWeekday
                                                    fromDate:[NSDate date]];
    NSDateComponents *dateComponents = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay |
                                        NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitWeekday
                                                   fromDate:self];
    
    static NSDateFormatter *formatter = nil;
    NSString *dateString = nil;
    
    if (!formatter) {
        formatter = [[NSDateFormatter alloc] init];
    }
    
    if (todayComponents.day == dateComponents.day) {
        formatter.dateFormat = @"hh:mm";
        dateString = [formatter stringFromDate:self];
    }
    else if (todayComponents.day - 1 == dateComponents.day) {
        dateString = @"昨天";
    }
    else if (todayComponents.day - dateComponents.day <= 7) {
        if (WEEK_DAYS.count > dateComponents.weekday-1) {
            dateString = WEEK_DAYS[dateComponents.weekday-1];
        }
    }
    else {
        formatter.dateFormat = @"YY-MM-dd";
        dateString = [formatter stringFromDate:self];
    }
    
    return dateString;
}


/*
 *  时间戳
 */
-(NSString *)timestamp{
    
    NSTimeInterval timeInterval = [self timeIntervalSince1970];
    
    NSString *timeString = [NSString stringWithFormat:@"%.0f",timeInterval];
    
    return [timeString copy];
}


/*
 *  时间成分
 */
-(NSDateComponents *)components{
    
    //创建日历
    NSCalendar *calendar=[NSCalendar currentCalendar];
    
    //定义成分
    NSCalendarUnit unit=NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    return [calendar components:unit fromDate:self];
}

/*
 *  是否是今年
 */
-(BOOL)isThisYear{
    
    NSDateComponents *dateComponents=self.components;
    
    NSDateComponents *nowComponents=[NSDate date].components;
    
    return dateComponents.year==nowComponents.year;
}

/*
 *  是否是今天
 */
-(BOOL)isToday{
    
    //差值为0天
    return [self calWithValue:0];
}

/*
 *  是否是昨天
 */
-(BOOL)isYesToday{
    
    //差值为1天
    return [self calWithValue:1];
}

-(BOOL)calWithValue:(NSInteger)value{
    
    //得到给定时间的处理后的时间的components
    NSDateComponents *dateComponents=self.ymdDate.components;
    
    //得到当前时间的处理后的时间的components
    NSDateComponents *nowComponents=[NSDate date].ymdDate.components;
    
    //比较
    BOOL res=dateComponents.year==nowComponents.year && dateComponents.month==nowComponents.month && (dateComponents.day + value)==nowComponents.day;
    
    return res;
}
/*
 *  清空时分秒，保留年月日
 */
-(NSDate *)ymdDate{
    
    //定义fmt
    NSDateFormatter *fmt=[[NSDateFormatter alloc] init];
    
    //设置格式:去除时分秒
    fmt.dateFormat=@"yyyy-MM-dd";
    
    //得到字符串格式的时间
    NSString *dateString=[fmt stringFromDate:self];
    
    //再转为date
    NSDate *date=[fmt dateFromString:dateString];
    
    return date;
}


/**
 *  两个时间比较
 *
 *  @param unit     成分单元
 *  @param fromDate 起点时间
 *  @param toDate   终点时间
 *
 *  @return 时间成分对象
 */
+(NSDateComponents *)dateComponents:(NSCalendarUnit)unit fromDate:(NSDate *)fromDate toDate:(NSDate *)toDate{
    
    //创建日历
    NSCalendar *calendar=[NSCalendar currentCalendar];
    
    //直接计算
    NSDateComponents *components = [calendar components:unit fromDate:fromDate toDate:toDate options:0];
    
    return components;
}

@end

#define D_MINUTE 60
#define D_HOUR   3600
#define D_DAY    86400
#define D_WEEK   604800
#define D_YEAR   31556926

@implementation NSDate (Utils)

+ (NSDate *)dateWithYear:(NSInteger)year
                   month:(NSInteger)month
                     day:(NSInteger)day
                    hour:(NSInteger)hour
                  minute:(NSInteger)minute
                  second:(NSInteger)second{
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSTimeZone *systemTimeZone = [NSTimeZone systemTimeZone];
    
    NSDateComponents *dateComps = [[NSDateComponents alloc] init];
    [dateComps setCalendar:gregorian];
    [dateComps setYear:year];
    [dateComps setMonth:month];
    [dateComps setDay:day];
    [dateComps setTimeZone:systemTimeZone];
    [dateComps setHour:hour];
    [dateComps setMinute:minute];
    [dateComps setSecond:second];
    
    
    return [dateComps date];
}

+ (NSInteger)daysOffsetBetweenStartDate:(NSDate *)startDate endDate:(NSDate *)endDate
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    unsigned int unitFlags = NSCalendarUnitDay;
    NSDateComponents *comps = [gregorian components:unitFlags fromDate:startDate  toDate:endDate  options:0];
    NSInteger days = [comps day];
    return days;
}

+ (NSDate *)dateWithHour:(int)hour
                  minute:(int)minute
{
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:now];
    [components setHour:hour];
    [components setMinute:minute];
    NSDate *newDate = [calendar dateFromComponents:components];
    return newDate;
}

#pragma mark - Data component
- (NSInteger)year
{
    return [self.components year];
}

- (NSInteger)month
{
    return [self.components month];
}

- (NSInteger)day
{
    return [self.components day];
}

- (NSInteger)hour
{
    return [self.components hour];
}

- (NSInteger)minute
{
    return [self.components minute];
}

- (NSInteger)second
{
    return self.components.second;
}

- (NSString *)weekday
{
    NSInteger weekday = [[NSDate date].components weekday]; // 星期几（注意，周日是“1”，周一是“2”。。。。）
    NSString *week = @"";
    switch (weekday) {
        case 1:
            week = @"星期日";
            break;
        case 2:
            week = @"星期一";
            break;
        case 3:
            week = @"星期二";
            break;
        case 4:
            week = @"星期三";
            break;
        case 5:
            week = @"星期四";
            break;
        case 6:
            week = @"星期五";
            break;
        case 7:
            week = @"星期六";
            break;
            
        default:
            break;
    }
    
    return week;
}




#pragma mark - Time string
- (NSString *)timeHourMinute
{
    
    return [self timeHourMinuteWithPrefix:NO suffix:NO];
}

- (NSString *)timeHourMinuteWithPrefix
{
    return [self timeHourMinuteWithPrefix:YES suffix:NO];
}

- (NSString *)timeHourMinuteWithSuffix
{
    return [self timeHourMinuteWithPrefix:NO suffix:YES];
}

- (NSString *)timeHourMinuteWithPrefix:(BOOL)enablePrefix suffix:(BOOL)enableSuffix
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"HH:mm"];
    NSString *timeStr = [formatter stringFromDate:self];
    if (enablePrefix) {
        timeStr = [NSString stringWithFormat:@"%@%@",([self hour] > 12 ? @"下午" : @"上午"),timeStr];
    }
    if (enableSuffix) {
        timeStr = [NSString stringWithFormat:@"%@%@",([self hour] > 12 ? @"pm" : @"am"),timeStr];
    }
    return timeStr;
}


#pragma mark - Date String
- (NSString *)stringTime
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"HH:mm"];
    NSString *str = [formatter stringFromDate:self];
    return str;
}

- (NSString *)stringMonthDay
{
    return [NSDate dateMonthDayWithDate:self];
}

- (NSString *)stringYearMonthDay
{
    return [NSDate stringYearMonthDayWithDate:self];
}

- (NSString *)stringYearMonthDayHourMinuteSecond
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *str = [formatter stringFromDate:self];
    return str;
    
}

- (NSString *)stringYearMonthDayCompareToday
{
    NSString *str;
    NSInteger chaDay = [self daysBetweenCurrentDateAndDate];
    if (chaDay == 0) {
        str = @"Today";
    }else if (chaDay == 1){
        str = @"Tomorrow";
    }else if (chaDay == -1){
        str = @"Yesterday";
    }else{
        str = [self stringYearMonthDay];
    }
    
    return str;
}

+ (NSString *)stringLoacalDate
{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    [format  setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    NSString *dateStr = [format stringFromDate:localeDate];
    
    return dateStr;
}

+ (NSString *)stringYearMonthDayWithDate:(NSDate *)date
{
    if (date == nil) {
        date = [NSDate date];
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *str = [formatter stringFromDate:date];
    return str;
}

+ (NSString *)dateMonthDayWithDate:(NSDate *)date
{
    if (date == nil) {
        date = [NSDate date];
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"MM.dd"];
    NSString *str = [formatter stringFromDate:date];
    return str;
}


#pragma mark - Date formate

+ (NSString *)dateFormatString {
    return @"yyyy-MM-dd";
}

+ (NSString *)timeFormatString {
    return @"HH:mm:ss";
}

+ (NSString *)timestampFormatString {
    return @"yyyy-MM-dd HH:mm:ss";
}

+ (NSString *)timestampFormatStringSubSeconds
{
    return @"yyyy-MM-dd HH:mm";
}

#pragma mark - Date adjust
- (NSDate *) dateByAddingDays: (NSInteger) dDays
{
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + D_DAY * dDays;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *) dateBySubtractingDays: (NSInteger) dDays
{
    return [self dateByAddingDays: (dDays * -1)];
}

#pragma mark - Relative Dates
+ (NSDate *) dateWithDaysFromNow: (NSInteger) days
{
    // Thanks, Jim Morrison
    return [[NSDate date] dateByAddingDays:days];
}

+ (NSDate *) dateWithDaysBeforeNow: (NSInteger) days
{
    // Thanks, Jim Morrison
    return [[NSDate date] dateBySubtractingDays:days];
}

+ (NSDate *) dateTomorrow
{
    return [NSDate dateWithDaysFromNow:1];
}

+ (NSDate *) dateYesterday
{
    return [NSDate dateWithDaysBeforeNow:1];
}

+ (NSDate *) dateWithHoursFromNow: (NSInteger) dHours
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + D_HOUR * dHours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

+ (NSDate *) dateWithHoursBeforeNow: (NSInteger) dHours
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - D_HOUR * dHours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

+ (NSDate *) dateWithMinutesFromNow: (NSInteger) dMinutes
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + D_MINUTE * dMinutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

+ (NSDate *) dateWithMinutesBeforeNow: (NSInteger) dMinutes
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - D_MINUTE * dMinutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}



+ (NSDate *) dateStandardFormatTimeZeroWithDate: (NSDate *) aDate{
    NSString *str = [[NSDate stringYearMonthDayWithDate:aDate]stringByAppendingString:@" 00:00:00"];
    NSDate *date = [NSDate dateFromString:str];
    return date;
}

- (NSInteger) daysBetweenCurrentDateAndDate
{
    //只取年月日比较
    NSDate *dateSelf = [NSDate dateStandardFormatTimeZeroWithDate:self];
    NSTimeInterval timeInterval = [dateSelf timeIntervalSince1970];
    NSDate *dateNow = [NSDate dateStandardFormatTimeZeroWithDate:nil];
    NSTimeInterval timeIntervalNow = [dateNow timeIntervalSince1970];
    
    NSTimeInterval cha = timeInterval - timeIntervalNow;
    CGFloat chaDay = cha / 86400.0;
    NSInteger day = chaDay * 1;
    return day;
}

#pragma mark - Date and string convert
+ (NSDate *)dateFromString:(NSString *)string {
    return [NSDate dateFromString:string withFormat:[NSDate dbFormatString]];
}

+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format {
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:format];
    NSDate *date = [inputFormatter dateFromString:string];
    return date;
}

- (NSString *)string {
    return [self stringWithFormat:[NSDate dbFormatString]];
}

- (NSString *)stringCutSeconds
{
    return [self stringWithFormat:[NSDate timestampFormatStringSubSeconds]];
}

- (NSString *)stringWithFormat:(NSString *)format {
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:format];
    NSString *timestamp_str = [outputFormatter stringFromDate:self];
    return timestamp_str;
}

+ (NSString *)dbFormatString {
    return [NSDate timestampFormatString];
}
@end

#pragma mark NSFileManager
@implementation NSFileManager (BFKit)

+ (NSString *)readTextFile:(NSString *)file ofType:(NSString *)type
{
    NSString *temp = [[NSBundle mainBundle] pathForResource:file ofType:type];
    file = [NSString stringWithContentsOfFile:temp encoding:NSStringEncodingConversionAllowLossy error:nil];
    return file;
}

+ (BOOL)saveDictionaryToPath:(DirectoryType)path withFilename:(NSString *)fileName dictionary:(NSDictionary *)dictionary
{
    NSString *_path;
    
    switch(path)
    {
        case DirectoryTypeMainBundle:
            _path = [self getBundlePathForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        case DirectoryTypeLibrary:
            _path = [self getLibraryDirectoryForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        case DirectoryTypeDocuments:
            _path = [self getDocumentsDirectoryForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        case DirectoryTypeCache:
            _path = [self getCacheDirectoryForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        default:
            break;
    }
    return [dictionary writeToFile:_path atomically:YES];
}

+ (NSDictionary *)loadDictionaryFromPath:(DirectoryType)path withFilename:(NSString *)fileName
{
    NSString *_path;
    
    switch(path)
    {
        case DirectoryTypeMainBundle:
            _path = [self getBundlePathForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        case DirectoryTypeLibrary:
            _path = [self getLibraryDirectoryForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        case DirectoryTypeDocuments:
            _path = [self getDocumentsDirectoryForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        case DirectoryTypeCache:
            _path = [self getCacheDirectoryForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        default:
            break;
    }
    return [NSDictionary dictionaryWithContentsOfFile:_path];
}

+ (BOOL)saveArrayToPath:(DirectoryType)path withFilename:(NSString *)fileName array:(NSArray *)array
{
    NSString *_path;
    
    switch(path)
    {
        case DirectoryTypeMainBundle:
            _path = [self getBundlePathForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        case DirectoryTypeLibrary:
            _path = [self getLibraryDirectoryForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        case DirectoryTypeDocuments:
            _path = [self getDocumentsDirectoryForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        case DirectoryTypeCache:
            _path = [self getCacheDirectoryForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        default:
            break;
    }
    return [array writeToFile:_path atomically:YES];
}

+ (NSArray *)loadArrayFromPath:(DirectoryType)path withFilename:(NSString *)fileName
{
    NSString *_path;
    
    switch(path)
    {
        case DirectoryTypeMainBundle:
            _path = [self getBundlePathForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        case DirectoryTypeLibrary:
            _path = [self getLibraryDirectoryForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        case DirectoryTypeDocuments:
            _path = [self getDocumentsDirectoryForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        case DirectoryTypeCache:
            _path = [self getCacheDirectoryForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        default:
            break;
    }
    return [NSArray arrayWithContentsOfFile:_path];
}

+ (NSString *)getBundlePathForFile:(NSString *)fileName
{
    NSString *fileExtension = [fileName pathExtension];
    return [[NSBundle mainBundle] pathForResource:[fileName stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@".%@", fileExtension] withString:@""] ofType:fileExtension];
}

+ (NSString *)getDocumentsDirectoryForFile:(NSString *)fileName
{
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@/", fileName]];
}

+ (NSString *)getLibraryDirectoryForFile:(NSString *)fileName
{
    NSString *libraryDirectory = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    return [libraryDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@/", fileName]];
}

+ (NSString *)getCacheDirectoryForFile:(NSString *)fileName
{
    NSString *cacheDirectory = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    return [cacheDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@/", fileName]];
}

+ (BOOL)deleteFile:(NSString *)fileName fromDirectory:(DirectoryType)directory
{
    if(fileName.length > 0)
    {
        NSString *path;
        
        switch(directory)
        {
            case DirectoryTypeMainBundle:
                path = [self getBundlePathForFile:fileName];
                break;
            case DirectoryTypeLibrary:
                path = [self getLibraryDirectoryForFile:fileName];
                break;
            case DirectoryTypeDocuments:
                path = [self getDocumentsDirectoryForFile:fileName];
                break;
            case DirectoryTypeCache:
                path = [self getCacheDirectoryForFile:fileName];
                break;
            default:
                break;
        }
        
        if([[NSFileManager defaultManager] fileExistsAtPath:path])
        {
            return [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
        }
        else
        {
            return NO;
        }
    }
    
    return NO;
}

+ (BOOL)moveLocalFile:(NSString *)fileName fromDirectory:(DirectoryType)origin toDirectory:(DirectoryType)destination
{
    return [self moveLocalFile:fileName fromDirectory:origin toDirectory:destination withFolderName:nil];
}

+ (BOOL)moveLocalFile:(NSString *)fileName fromDirectory:(DirectoryType)origin toDirectory:(DirectoryType)destination withFolderName:(NSString *)folderName
{
    NSString *originPath;
    
    switch(origin)
    {
        case DirectoryTypeMainBundle:
            originPath = [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
            break;
        case DirectoryTypeLibrary:
            originPath = [self getDocumentsDirectoryForFile:fileName];
            break;
        case DirectoryTypeDocuments:
            originPath = [self getLibraryDirectoryForFile:fileName];
            break;
        case DirectoryTypeCache:
            originPath = [self getCacheDirectoryForFile:fileName];
            break;
        default:
            break;
    }
    
    NSString *destinationPath;
    
    switch(destination)
    {
        case DirectoryTypeMainBundle:
            if(folderName)
                destinationPath = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@/%@", folderName, fileName] ofType:nil];
            else
                destinationPath = [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
            break;
        case DirectoryTypeLibrary:
            if(folderName)
                destinationPath = [self getLibraryDirectoryForFile:[NSString stringWithFormat:@"%@/%@", folderName, fileName]];
            else
                destinationPath = [self getLibraryDirectoryForFile:fileName];
            break;
        case DirectoryTypeDocuments:
            if(folderName)
                destinationPath = [self getDocumentsDirectoryForFile:[NSString stringWithFormat:@"%@/%@", folderName, fileName]];
            else
                destinationPath = [self getDocumentsDirectoryForFile:fileName];
            break;
        case DirectoryTypeCache:
            if(folderName)
                destinationPath = [self getCacheDirectoryForFile:[NSString stringWithFormat:@"%@/%@", folderName, fileName]];
            else
                destinationPath = [self getCacheDirectoryForFile:fileName];
            break;
        default:
            break;
    }
    
    // Check if folder exist, if not, create automatically
    if(folderName)
    {
        NSString *folderPath = [NSString stringWithFormat:@"%@/%@", destinationPath, folderName];
        if(![[NSFileManager defaultManager] fileExistsAtPath:folderPath])
        {
            [[NSFileManager defaultManager] createDirectoryAtPath:folderPath withIntermediateDirectories:NO attributes:nil error:nil];
        }
    }
    
    BOOL copied = NO, deleted = NO;
    
    if([[NSFileManager defaultManager] fileExistsAtPath:originPath])
    {
        if([[NSFileManager defaultManager] copyItemAtPath:originPath toPath:destinationPath error:nil])
            copied = YES;
    }
    
    if(destination != DirectoryTypeMainBundle)
    {
        if([[NSFileManager defaultManager] fileExistsAtPath:originPath])
            if([[NSFileManager defaultManager] removeItemAtPath:originPath error:nil])
                deleted = YES;
    }
    
    if(copied && deleted)
        return YES;
    else
        return NO;
}

+ (BOOL)duplicateFileAtPath:(NSString *)origin toNewPath:(NSString *)destination
{
    if([[NSFileManager defaultManager] fileExistsAtPath:origin])
        return [[NSFileManager defaultManager] copyItemAtPath:origin toPath:destination error:nil];
    else
        return NO;
}

+ (BOOL)renameFileFromDirectory:(DirectoryType)origin atPath:(NSString *)path withOldName:(NSString *)oldName andNewName:(NSString *)newName
{
    NSString *originPath;
    
    switch(origin)
    {
        case DirectoryTypeMainBundle:
            originPath = [[NSBundle mainBundle] pathForResource:path ofType:nil];
            break;
        case DirectoryTypeLibrary:
            originPath = [self getDocumentsDirectoryForFile:path];
            break;
        case DirectoryTypeDocuments:
            originPath = [self getLibraryDirectoryForFile:path];
            break;
        case DirectoryTypeCache:
            originPath = [self getCacheDirectoryForFile:path];
            break;
        default:
            break;
    }
    
    if([[NSFileManager defaultManager] fileExistsAtPath:originPath])
    {
        NSString *newNamePath = [originPath stringByReplacingOccurrencesOfString:oldName withString:newName];
        if([[NSFileManager defaultManager] copyItemAtPath:originPath toPath:newNamePath error:nil])
        {
            if([[NSFileManager defaultManager] removeItemAtPath:originPath error:nil])
                return YES;
            else
                return NO;
        }
        else
            return NO;
    }
    else
        return NO;
}



+(BOOL)haveFilesInFilePath:(NSString *)filePath{
    BOOL r = [[NSFileManager defaultManager] fileExistsAtPath:filePath];
    
    return r;
}


+(NSString *)appSetingFilePath{
    return [self setingsFilePath:APP_NAME];
}

+(NSString *)setingsFilePath:(NSString *)setName{
    return [self getLibraryDirectoryForFile:[NSString stringWithFormat:@"%@-Settings.plist",setName]];
}

+ (id)getAppSettingsForObjectWithKey:(NSString *)objKey
{
    return [self getSettings:APP_NAME objectForKey:objKey];
}

+ (BOOL)setAppSettingsForObject:(id)value forKey:(NSString *)objKey
{
    return [self setSettings:APP_NAME object:value forKey:objKey];
}

+ (id)getSettings:(NSString *)settings objectForKey:(NSString *)objKey
{
    NSString *path = [self getLibraryDirectoryForFile:[NSString stringWithFormat:@"%@-Settings.plist", settings]];
    
    NSDictionary *loadedPlist = [NSDictionary dictionaryWithContentsOfFile:path];
    
    return [loadedPlist objectForKey:objKey];
}

+ (BOOL)setSettings:(NSString *)settings object:(id)value forKey:(NSString *)objKey
{
    NSString *path = [self getLibraryDirectoryForFile:[NSString stringWithFormat:@"%@-Settings.plist", settings]];
    NSMutableDictionary *loadedPlist = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    if (!loadedPlist) {
        
        NSLog(@"创建 %@-settings",settings);
        
        loadedPlist = [NSMutableDictionary dictionary];
    }
    [loadedPlist setObject:value forKey:objKey];
    return [loadedPlist writeToFile:path atomically:YES];
}

@end

#pragma mark UIFont
@implementation UIFont (BFKit)

+ (void)allFamilyAndFonts
{
    NSArray *fontFamilies = [UIFont familyNames];
    
    for(int i = 0; i < [fontFamilies count]; i++)
    {
        NSString *fontFamily = [fontFamilies objectAtIndex:i];
        NSArray *fontNames = [UIFont fontNamesForFamilyName:[fontFamilies objectAtIndex:i]];
        NSLog(@"%@: %@", fontFamily, fontNames);
    }
}

+ (NSArray *)fontsNameForFamilyName:(FamilyFontName)familyFontName
{
    NSArray *fontNames;
    
    switch(familyFontName)
    {
        case FamilyFontNameAcademyEngravedLET:
            fontNames = [UIFont fontNamesForFamilyName:@"Academy Engraved LET"];
            break;
        case FamilyFontNameAlNile:
            fontNames = [UIFont fontNamesForFamilyName:@"Al Nile"];
            break;
        case FamilyFontNameAmericanTypewriter:
            fontNames = [UIFont fontNamesForFamilyName:@"American Typewriter"];
            break;
        case FamilyFontNameAppleColorEmoji:
            fontNames = [UIFont fontNamesForFamilyName:@"Apple Color Emoji"];
            break;
        case FamilyFontNameAppleSDGothicNeo:
            fontNames = [UIFont fontNamesForFamilyName:@"Apple SD Gothic Neo"];
            break;
        case FamilyFontNameArial:
            fontNames = [UIFont fontNamesForFamilyName:@"Arial"];
            break;
        case FamilyFontNameArialHebrew:
            fontNames = [UIFont fontNamesForFamilyName:@"Arial Hebrew"];
            break;
        case FamilyFontNameArialRoundedMTBold:
            fontNames = [UIFont fontNamesForFamilyName:@"Arial Rounded MT Bold"];
            break;
        case FamilyFontNameAvenir:
            fontNames = [UIFont fontNamesForFamilyName:@"Avenir"];
            break;
        case FamilyFontNameAvenirNext:
            fontNames = [UIFont fontNamesForFamilyName:@"Avenir Next"];
            break;
        case FamilyFontNameAvenirNextCondensed:
            fontNames = [UIFont fontNamesForFamilyName:@"Avenir Next Condensed"];
            break;
        case FamilyFontNameBanglaSangamMN:
            fontNames = [UIFont fontNamesForFamilyName:@"Bangla Sangam MN"];
            break;
        case FamilyFontNameBaskerville:
            fontNames = [UIFont fontNamesForFamilyName:@"Baskerville"];
            break;
        case FamilyFontNameBodoni72:
            fontNames = [UIFont fontNamesForFamilyName:@"Bodoni 72"];
            break;
        case FamilyFontNameBodoni72Oldstyle:
            fontNames = [UIFont fontNamesForFamilyName:@"Bodoni 72 Oldstyle"];
            break;
        case FamilyFontNameBodoni72Smallcaps:
            fontNames = [UIFont fontNamesForFamilyName:@"Bodoni 72 Smallcaps"];
            break;
        case FamilyFontNameBodoniOrnaments:
            fontNames = [UIFont fontNamesForFamilyName:@"Bodoni Ornaments"];
            break;
        case FamilyFontNameBradleyHand:
            fontNames = [UIFont fontNamesForFamilyName:@"Bradley Hand"];
            break;
        case FamilyFontNameChalkboardSE:
            fontNames = [UIFont fontNamesForFamilyName:@"Chalkboard SE"];
            break;
        case FamilyFontNameChalkduster:
            fontNames = [UIFont fontNamesForFamilyName:@"Chalkduster"];
            break;
        case FamilyFontNameCochin:
            fontNames = [UIFont fontNamesForFamilyName:@"Cochin"];
            break;
        case FamilyFontNameCopperplate:
            fontNames = [UIFont fontNamesForFamilyName:@"Copperplate"];
            break;
        case FamilyFontNameCourier:
            fontNames = [UIFont fontNamesForFamilyName:@"Courier"];
            break;
        case FamilyFontNameCourierNew:
            fontNames = [UIFont fontNamesForFamilyName:@"Courier New"];
            break;
        case FamilyFontNameDamascus:
            fontNames = [UIFont fontNamesForFamilyName:@"Damascus"];
            break;
        case FamilyFontNameDevanagariSangamMN:
            fontNames = [UIFont fontNamesForFamilyName:@"Devanagari Sangam MN"];
            break;
        case FamilyFontNameDidot:
            fontNames = [UIFont fontNamesForFamilyName:@"Didot"];
            break;
        case FamilyFontNameDINAlternate:
            fontNames = [UIFont fontNamesForFamilyName:@"DIN Alternate"];
            break;
        case FamilyFontNameDINCondensed:
            fontNames = [UIFont fontNamesForFamilyName:@"DIN Condensed"];
            break;
        case FamilyFontNameEuphemiaUCAS:
            fontNames = [UIFont fontNamesForFamilyName:@"Euphemia UCAS"];
            break;
        case FamilyFontNameFarah:
            fontNames = [UIFont fontNamesForFamilyName:@"Farah"];
            break;
        case FamilyFontNameFutura:
            fontNames = [UIFont fontNamesForFamilyName:@"Futura"];
            break;
        case FamilyFontNameGeezaPro:
            fontNames = [UIFont fontNamesForFamilyName:@"Geeza Pro"];
            break;
        case FamilyFontNameGeorgia:
            fontNames = [UIFont fontNamesForFamilyName:@"Georgia"];
            break;
        case FamilyFontNameGillSans:
            fontNames = [UIFont fontNamesForFamilyName:@"Gill Sans"];
            break;
        case FamilyFontNameGujaratiSangemMN:
            fontNames = [UIFont fontNamesForFamilyName:@"Gujarati Sangam MN"];
            break;
        case FamilyFontNameGurmukhiMN:
            fontNames = [UIFont fontNamesForFamilyName:@"Gurmukhi MN"];
            break;
        case FamilyFontNameHeitiSC:
            fontNames = [UIFont fontNamesForFamilyName:@"Heiti SC"];
            break;
        case FamilyFontNameHeitiTC:
            fontNames = [UIFont fontNamesForFamilyName:@"Heiti TC"];
            break;
        case FamilyFontNameHelvetica:
            fontNames = [UIFont fontNamesForFamilyName:@"Helvetica"];
            break;
        case FamilyFontNameHelveticaNeue:
            fontNames = [UIFont fontNamesForFamilyName:@"Helvetica Neue"];
            break;
        case FamilyFontNameHiraginoKakuGothicProN:
            fontNames = [UIFont fontNamesForFamilyName:@"Hiragino Kaku Gothic ProN"];
            break;
        case FamilyFontNameHiraginoMinchoProN:
            fontNames = [UIFont fontNamesForFamilyName:@"Hiragino Mincho ProN"];
            break;
        case FamilyFontNameHoeflerText:
            fontNames = [UIFont fontNamesForFamilyName:@"Hoefler Text"];
            break;
        case FamilyFontNameIowanOldStyle:
            fontNames = [UIFont fontNamesForFamilyName:@"Iowan Old Style"];
            break;
        case FamilyFontNameKailasa:
            fontNames = [UIFont fontNamesForFamilyName:@"Kailasa"];
            break;
        case FamilyFontNameKannadaSangamMN:
            fontNames = [UIFont fontNamesForFamilyName:@"Kannada Sangam MN"];
            break;
        case FamilyFontNameMalayamSangamMN:
            fontNames = [UIFont fontNamesForFamilyName:@"Malayalam Sangam MN"];
            break;
        case FamilyFontNameMarion:
            fontNames = [UIFont fontNamesForFamilyName:@"Marion"];
            break;
        case FamilyFontNameMarkerFelt:
            fontNames = [UIFont fontNamesForFamilyName:@"Marker Felt"];
            break;
        case FamilyFontNameMenlo:
            fontNames = [UIFont fontNamesForFamilyName:@"Menlo"];
            break;
        case FamilyFontNameMishafi:
            fontNames = [UIFont fontNamesForFamilyName:@"Mishafi"];
            break;
        case FamilyFontNameNoteworthy:
            fontNames = [UIFont fontNamesForFamilyName:@"Noteworthy"];
            break;
        case FamilyFontNameOptima:
            fontNames = [UIFont fontNamesForFamilyName:@"Optima"];
            break;
        case FamilyFontNameOriyaSangemMN:
            fontNames = [UIFont fontNamesForFamilyName:@"Oriya Sangam MN"];
            break;
        case FamilyFontNamePalatino:
            fontNames = [UIFont fontNamesForFamilyName:@"Palatino"];
            break;
        case FamilyFontNamePapyrus:
            fontNames = [UIFont fontNamesForFamilyName:@"Papyrus"];
            break;
        case FamilyFontNamePartyLET:
            fontNames = [UIFont fontNamesForFamilyName:@"Party LET"];
            break;
        case FamilyFontNameSavoyeLET:
            fontNames = [UIFont fontNamesForFamilyName:@"Savoye LET"];
            break;
        case FamilyFontNameSinhalaSangamMN:
            fontNames = [UIFont fontNamesForFamilyName:@"Sinhala Sangam MN"];
            break;
        case FamilyFontNameSnellRoundhand:
            fontNames = [UIFont fontNamesForFamilyName:@"Snell Roundhand"];
            break;
        case FamilyFontNameSuperclarendon:
            fontNames = [UIFont fontNamesForFamilyName:@"Superclarendon"];
            break;
        case FamilyFontNameSymbol:
            fontNames = [UIFont fontNamesForFamilyName:@"Symbol"];
            break;
        case FamilyFontNameTamilSangamMN:
            fontNames = [UIFont fontNamesForFamilyName:@"Tamil Sangam MN"];
            break;
        case FamilyFontNameTeluguSangamMN:
            fontNames = [UIFont fontNamesForFamilyName:@"Telugu Sangam MN"];
            break;
        case FamilyFontNameThonburi:
            fontNames = [UIFont fontNamesForFamilyName:@"Thonburi"];
            break;
        case FamilyFontNameTimesNewRoman:
            fontNames = [UIFont fontNamesForFamilyName:@"Times New Roman"];
            break;
        case FamilyFontNameTrebuchetMS:
            fontNames = [UIFont fontNamesForFamilyName:@"Trebuchet MS"];
            break;
        case FamilyFontNameVerdana:
            fontNames = [UIFont fontNamesForFamilyName:@"Verdana"];
            break;
        case FamilyFontNameZapfDingBats:
            fontNames = [UIFont fontNamesForFamilyName:@"Zapf Dingbats"];
            break;
        case FamilyFontNameZapfino:
            fontNames = [UIFont fontNamesForFamilyName:@"Zapfino"];
            break;
        default:
            break;
    }
    
    NSLog (@"%@", fontNames);
    
    return fontNames;
}

+ (UIFont *)fontForFontName:(FontName)fontName size:(CGFloat)fontSize
{
    switch(fontName)
    {
        case FontNameAcademyEngravedLetPlain:
            return [UIFont fontWithName:@"AcademyEngravedLetPlain" size:fontSize];
            break;
        case FontNameAlNile:
            return [UIFont fontWithName:@"AlNile" size:fontSize];
            break;
        case FontNameAlNileBold:
            return [UIFont fontWithName:@"AlNile-Bold" size:fontSize];
            break;
        case FontNameAmericanTypewriter:
            return [UIFont fontWithName:@"AmericanTypewriter" size:fontSize];
            break;
        case FontNameAmericanTypewriterBold:
            return [UIFont fontWithName:@"AmericanTypewriter-Bold" size:fontSize];
            break;
        case FontNameAmericanTypewriterCondensed:
            return [UIFont fontWithName:@"AmericanTypewriter-Condensed" size:fontSize];
            break;
        case FontNameAmericanTypewriterCondensedBold:
            return [UIFont fontWithName:@"AmericanTypewriter-CondensedBold" size:fontSize];
            break;
        case FontNameAmericanTypewriterCondensedLight:
            return [UIFont fontWithName:@"AmericanTypewriter-CondensedLight" size:fontSize];
            break;
        case FontNameAmericanTypewriterLight:
            return [UIFont fontWithName:@"AmericanTypewriter-Light" size:fontSize];
            break;
        case FontNameAppleColorEmoji:
            return [UIFont fontWithName:@"AppleColorEmoji" size:fontSize];
            break;
        case FontNameAppleSDGohticNeoBold:
            return [UIFont fontWithName:@"AppleSDGothicNeo-Bold" size:fontSize];
            break;
        case FontNameAppleSDGohticNeoLight:
            return [UIFont fontWithName:@"AppleSDGothicNeo-Light" size:fontSize];
            break;
        case FontNameAppleSDGohticNeoMedium:
            return [UIFont fontWithName:@"AppleSDGothicNeo-Medium" size:fontSize];
            break;
        case FontNameAppleSDGohticNeoRegular:
            return [UIFont fontWithName:@"AppleSDGothicNeo-Regular" size:fontSize];
            break;
        case FontNameAppleSDGohticNeoSemiBold:
            return [UIFont fontWithName:@"AppleSDGothicNeo-SemiBold" size:fontSize];
            break;
        case FontNameAppleSDGohticNeoThin:
            return [UIFont fontWithName:@"AppleSDGothicNeo-Thin" size:fontSize];
            break;
        case FontNameArialBoldItalicMT:
            return [UIFont fontWithName:@"Arial-BoldItalicMT" size:fontSize];
            break;
        case FontNameArialBoldMT:
            return [UIFont fontWithName:@"Arial-BoldMT" size:fontSize];
            break;
        case FontNameArialHebrew:
            return [UIFont fontWithName:@"ArialHebrew" size:fontSize];
            break;
        case FontNameArialHebrewBold:
            return [UIFont fontWithName:@"ArialHebrew-Bold" size:fontSize];
            break;
        case FontNameArialHebrewLight:
            return [UIFont fontWithName:@"ArialHebrew-Light" size:fontSize];
            break;
        case FontNameArialItalicMT:
            return [UIFont fontWithName:@"Arial-ItalicMT" size:fontSize];
            break;
        case FontNameArialMT:
            return [UIFont fontWithName:@"ArialMT" size:fontSize];
            break;
        case FontNameArialRoundedMTBold:
            return [UIFont fontWithName:@"ArialRoundedMTBold" size:fontSize];
            break;
        case FontNameASTHeitiLight:
            return [UIFont fontWithName:@"ASTHeiti-Light" size:fontSize];
            break;
        case FontNameASTHeitiMedium:
            return [UIFont fontWithName:@"ASTHeiti-Medium" size:fontSize];
            break;
        case FontNameAvenirBlack:
            return [UIFont fontWithName:@"Avenir-Black" size:fontSize];
            break;
        case FontNameAvenirBlackOblique:
            return [UIFont fontWithName:@"Avenir-BlackOblique" size:fontSize];
            break;
        case FontNameAvenirBook:
            return [UIFont fontWithName:@"Avenir-Book" size:fontSize];
            break;
        case FontNameAvenirBookOblique:
            return [UIFont fontWithName:@"Avenir-BookOblique" size:fontSize];
            break;
        case FontNameAvenirHeavtOblique:
            return [UIFont fontWithName:@"Avenir-HeavyOblique" size:fontSize];
            break;
        case FontNameAvenirHeavy:
            return [UIFont fontWithName:@"Avenir-Heavy" size:fontSize];
            break;
        case FontNameAvenirLight:
            return [UIFont fontWithName:@"Avenir-Light" size:fontSize];
            break;
        case FontNameAvenirLightOblique:
            return [UIFont fontWithName:@"Avenir-LightOblique" size:fontSize];
            break;
        case FontNameAvenirMedium:
            return [UIFont fontWithName:@"Avenir-Medium" size:fontSize];
            break;
        case FontNameAvenirMediumOblique:
            return [UIFont fontWithName:@"Avenir-MediumOblique" size:fontSize];
            break;
        case FontNameAvenirNextBold:
            return [UIFont fontWithName:@"AvenirNext-Bold" size:fontSize];
            break;
        case FontNameAvenirNextBoldItalic:
            return [UIFont fontWithName:@"AvenirNext-BoldItalic" size:fontSize];
            break;
        case FontNameAvenirNextCondensedBold:
            return [UIFont fontWithName:@"AvenirNextCondensed-Bold" size:fontSize];
            break;
        case FontNameAvenirNextCondensedBoldItalic:
            return [UIFont fontWithName:@"AvenirNextCondensed-BoldItalic" size:fontSize];
            break;
        case FontNameAvenirNextCondensedDemiBold:
            return [UIFont fontWithName:@"AvenirNextCondensed-DemiBold" size:fontSize];
            break;
        case FontNameAvenirNextCondensedDemiBoldItalic:
            return [UIFont fontWithName:@"AvenirNextCondensed-DemiBoldItalic" size:fontSize];
            break;
        case FontNameAvenirNextCondensedHeavy:
            return [UIFont fontWithName:@"AvenirNextCondensed-Heavy" size:fontSize];
            break;
        case FontNameAvenirNextCondensedHeavyItalic:
            return [UIFont fontWithName:@"AvenirNextCondensed-HeavyItalic" size:fontSize];
            break;
        case FontNameAvenirNextCondensedItalic:
            return [UIFont fontWithName:@"AvenirNextCondensed-Italic" size:fontSize];
            break;
        case FontNameAvenirNextCondensedMedium:
            return [UIFont fontWithName:@"AvenirNextCondensed-Medium" size:fontSize];
            break;
        case FontNameAvenirNextCondensedMediumItalic:
            return [UIFont fontWithName:@"AvenirNextCondensed-MediumItalic" size:fontSize];
            break;
        case FontNameAvenirNextCondensedRegular:
            return [UIFont fontWithName:@"AvenirNextCondensed-Regular" size:fontSize];
            break;
        case FontNameAvenirNextCondensedUltraLight:
            return [UIFont fontWithName:@"AvenirNextCondensed-UltraLight" size:fontSize];
            break;
        case FontNameAvenirNextCondensedUltraLightItalic:
            return [UIFont fontWithName:@"AvenirNextCondensed-UltraLightItalic" size:fontSize];
            break;
        case FontNameAvenirNextDemiBold:
            return [UIFont fontWithName:@"AvenirNext-DemiBold" size:fontSize];
            break;
        case FontNameAvenirNextDemiBoldItalic:
            return [UIFont fontWithName:@"AvenirNext-BoldItalic" size:fontSize];
            break;
        case FontNameAvenirNextHeavy:
            return [UIFont fontWithName:@"AvenirNext-Heavy" size:fontSize];
            break;
        case FontNameAvenirNextItalic:
            return [UIFont fontWithName:@"AvenirNext-Italic" size:fontSize];
            break;
        case FontNameAvenirNextMedium:
            return [UIFont fontWithName:@"AvenirNext-Medium" size:fontSize];
            break;
        case FontNameAvenirNextMediumItalic:
            return [UIFont fontWithName:@"AvenirNext-MediumItalic" size:fontSize];
            break;
        case FontNameAvenirNextRegular:
            return [UIFont fontWithName:@"AvenirNext-Regular" size:fontSize];
            break;
        case FontNameAvenirNextUltraLight:
            return [UIFont fontWithName:@"AvenirNext-UltraLight" size:fontSize];
            break;
        case FontNameAvenirNextUltraLightItalic:
            return [UIFont fontWithName:@"AvenirNext-UltraLightItalic" size:fontSize];
            break;
        case FontNameAvenirOblique:
            return [UIFont fontWithName:@"Avenir-Oblique" size:fontSize];
            break;
        case FontNameAvenirRoman:
            return [UIFont fontWithName:@"Avenir-Roman" size:fontSize];
            break;
        case FontNameBanglaSangamMN:
            return [UIFont fontWithName:@"BanglaSangamMN" size:fontSize];
            break;
        case FontNameBanglaSangamMNBold:
            return [UIFont fontWithName:@"BanglaSangamMN-Bold" size:fontSize];
            break;
        case FontNameBaskerville:
            return [UIFont fontWithName:@"Baskerville" size:fontSize];
            break;
        case FontNameBaskervilleBold:
            return [UIFont fontWithName:@"Baskerville-Bold" size:fontSize];
            break;
        case FontNameBaskervilleBoldItalic:
            return [UIFont fontWithName:@"Baskerville-BoldItalic" size:fontSize];
            break;
        case FontNameBaskervilleItalic:
            return [UIFont fontWithName:@"Baskerville-Italic" size:fontSize];
            break;
        case FontNameBaskervilleSemiBold:
            return [UIFont fontWithName:@"Baskerville-SemiBold" size:fontSize];
            break;
        case FontNameBaskervilleSemiBoldItalic:
            return [UIFont fontWithName:@"Baskerville-BoldItalic" size:fontSize];
            break;
        case FontNameBodoniOrnamentsITCTT:
            return [UIFont fontWithName:@"BodoniOrnamentsITCTT" size:fontSize];
            break;
        case FontNameBodoniSvtyTwoITCTTBold:
            return [UIFont fontWithName:@"BodoniSvtyTwoITCTT-Bold" size:fontSize];
            break;
        case FontNameBodoniSvtyTwoITCTTBook:
            return [UIFont fontWithName:@"BodoniSvtyTwoITCTT-Book" size:fontSize];
            break;
        case FontNameBodoniSvtyTwoITCTTBookIta:
            return [UIFont fontWithName:@"BodoniSvtyTwoITCTT-BookIta" size:fontSize];
            break;
        case FontNameBodoniSvtyTwoOSITCTTBold:
            return [UIFont fontWithName:@"BodoniSvtyTwoOSITCTT-Bold" size:fontSize];
            break;
        case FontNameBodoniSvtyTwoOSITCTTBook:
            return [UIFont fontWithName:@"BodoniSvtyTwoOSITCTT-Book" size:fontSize];
            break;
        case FontNameBodoniSvtyTwoOSITCTTBookIt:
            return [UIFont fontWithName:@"BodoniSvtyTwoOSITCTT-BookIt" size:fontSize];
            break;
        case FontNameBodoniSvtyTwoSCITCTTBook:
            return [UIFont fontWithName:@"BodoniSvtyTwoSCITCTT-Book" size:fontSize];
            break;
        case FontNameBradleyHandITCTTBold:
            return [UIFont fontWithName:@"BradleyHandITCTT-Bold" size:fontSize];
            break;
        case FontNameChalkboardSEBold:
            return [UIFont fontWithName:@"ChalkboardSE-Bold" size:fontSize];
            break;
        case FontNameChalkboardSELight:
            return [UIFont fontWithName:@"ChalkboardSE-Light" size:fontSize];
            break;
        case FontNameChalkboardSERegular:
            return [UIFont fontWithName:@"ChalkboardSE-Regular" size:fontSize];
            break;
        case FontNameChalkduster:
            return [UIFont fontWithName:@"Chalkduster" size:fontSize];
            break;
        case FontNameCochin:
            return [UIFont fontWithName:@"Cochin" size:fontSize];
            break;
        case FontNameCochinBold:
            return [UIFont fontWithName:@"Cochin-Bold" size:fontSize];
            break;
        case FontNameCochinBoldItalic:
            return [UIFont fontWithName:@"Cochin-BoldItalic" size:fontSize];
            break;
        case FontNameCochinItalic:
            return [UIFont fontWithName:@"Cochin-Italic" size:fontSize];
            break;
        case FontNameCopperplate:
            return [UIFont fontWithName:@"Copperplate" size:fontSize];
            break;
        case FontNameCopperplateBold:
            return [UIFont fontWithName:@"Copperplate-Bold" size:fontSize];
            break;
        case FontNameCopperplateLight:
            return [UIFont fontWithName:@"Copperplate-Light" size:fontSize];
            break;
        case FontNameCourier:
            return [UIFont fontWithName:@"Courier" size:fontSize];
            break;
        case FontNameCourierBold:
            return [UIFont fontWithName:@"Courier-Bold" size:fontSize];
            break;
        case FontNameCourierBoldOblique:
            return [UIFont fontWithName:@"Courier-BoldOblique" size:fontSize];
            break;
        case FontNameCourierNewPSBoldItalicMT:
            return [UIFont fontWithName:@"CourierNewPS-BoldItalicMT" size:fontSize];
            break;
        case FontNameCourierNewPSBoldMT:
            return [UIFont fontWithName:@"CourierNewPS-BoldMT" size:fontSize];
            break;
        case FontNameCourierNewPSItalicMT:
            return [UIFont fontWithName:@"CourierNewPS-ItalicMT" size:fontSize];
            break;
        case FontNameCourierNewPSMT:
            return [UIFont fontWithName:@"CourierNewPSMT" size:fontSize];
            break;
        case FontNameCourierOblique:
            return [UIFont fontWithName:@"Courier-Oblique" size:fontSize];
            break;
        case FontNameDamascus:
            return [UIFont fontWithName:@"Damascus" size:fontSize];
            break;
        case FontNameDamascusBold:
            return [UIFont fontWithName:@"DamascusBold" size:fontSize];
            break;
        case FontNameDamascusMedium:
            return [UIFont fontWithName:@"DamascusMedium" size:fontSize];
            break;
        case FontNameDamascusSemiBold:
            return [UIFont fontWithName:@"DamascusSemiBold" size:fontSize];
            break;
        case FontNameDevanagariSangamMN:
            return [UIFont fontWithName:@"DevanagariSangamMN" size:fontSize];
            break;
        case FontNameDevanagariSangamMNBold:
            return [UIFont fontWithName:@"DevanagariSangamMN-Bold" size:fontSize];
            break;
        case FontNameDidot:
            return [UIFont fontWithName:@"Didot" size:fontSize];
            break;
        case FontNameDidotBold:
            return [UIFont fontWithName:@"Didot-Bold" size:fontSize];
            break;
        case FontNameDidotItalic:
            return [UIFont fontWithName:@"Didot-Italic" size:fontSize];
            break;
        case FontNameDINAlternateBold:
            return [UIFont fontWithName:@"DINAlternate-Bold" size:fontSize];
            break;
        case FontNameDINCondensedBold:
            return [UIFont fontWithName:@"DINCondensed-Bold" size:fontSize];
            break;
        case FontNameDiwanMishafi:
            return [UIFont fontWithName:@"DiwanMishafi" size:fontSize];
            break;
        case FontNameEuphemiaUCAS:
            return [UIFont fontWithName:@"EuphemiaUCAS" size:fontSize];
            break;
        case FontNameEuphemiaUCASBold:
            return [UIFont fontWithName:@"EuphemiaUCAS-Bold" size:fontSize];
            break;
        case FontNameEuphemiaUCASItalic:
            return [UIFont fontWithName:@"EuphemiaUCAS-Italic" size:fontSize];
            break;
        case FontNameFarah:
            return [UIFont fontWithName:@"Farah" size:fontSize];
            break;
        case FontNameFuturaCondensedExtraBold:
            return [UIFont fontWithName:@"Futura-ExtraBold" size:fontSize];
            break;
        case FontNameFuturaCondensedMedium:
            return [UIFont fontWithName:@"Futura-CondensedMedium" size:fontSize];
            break;
        case FontNameFuturaMedium:
            return [UIFont fontWithName:@"Futura-Medium" size:fontSize];
            break;
        case FontNameFuturaMediumItalicm:
            return [UIFont fontWithName:@"Futura-MediumItalic" size:fontSize];
            break;
        case FontNameGeezaPro:
            return [UIFont fontWithName:@"GeezaPro" size:fontSize];
            break;
        case FontNameGeezaProBold:
            return [UIFont fontWithName:@"GeezaPro-Bold" size:fontSize];
            break;
        case FontNameGeezaProLight:
            return [UIFont fontWithName:@"GeezaPro-Light" size:fontSize];
            break;
        case FontNameGeorgia:
            return [UIFont fontWithName:@"Georgia" size:fontSize];
            break;
        case FontNameGeorgiaBold:
            return [UIFont fontWithName:@"Georgia-Bold" size:fontSize];
            break;
        case FontNameGeorgiaBoldItalic:
            return [UIFont fontWithName:@"Georgia-BoldItalic" size:fontSize];
            break;
        case FontNameGeorgiaItalic:
            return [UIFont fontWithName:@"Georgia-Italic" size:fontSize];
            break;
        case FontNameGillSans:
            return [UIFont fontWithName:@"GillSans" size:fontSize];
            break;
        case FontNameGillSansBold:
            return [UIFont fontWithName:@"GillSans-Bold" size:fontSize];
            break;
        case FontNameGillSansBoldItalic:
            return [UIFont fontWithName:@"GillSans-BoldItalic" size:fontSize];
            break;
        case FontNameGillSansItalic:
            return [UIFont fontWithName:@"GillSans-Italic" size:fontSize];
            break;
        case FontNameGillSansLight:
            return [UIFont fontWithName:@"GillSans-Light" size:fontSize];
            break;
        case FontNameGillSansLightItalic:
            return [UIFont fontWithName:@"GillSans-LightItalic" size:fontSize];
            break;
        case FontNameGujaratiSangamMN:
            return [UIFont fontWithName:@"GujaratiSangamMN" size:fontSize];
            break;
        case FontNameGujaratiSangamMNBold:
            return [UIFont fontWithName:@"GujaratiSangamMN-Bold" size:fontSize];
            break;
        case FontNameGurmukhiMN:
            return [UIFont fontWithName:@"GurmukhiMN" size:fontSize];
            break;
        case FontNameGurmukhiMNBold:
            return [UIFont fontWithName:@"GurmukhiMN-Bold" size:fontSize];
            break;
        case FontNameHelvetica:
            return [UIFont fontWithName:@"Helvetica" size:fontSize];
            break;
        case FontNameHelveticaBold:
            return [UIFont fontWithName:@"Helvetica-Bold" size:fontSize];
            break;
        case FontNameHelveticaBoldOblique:
            return [UIFont fontWithName:@"Helvetica-BoldOblique" size:fontSize];
            break;
        case FontNameHelveticaLight:
            return [UIFont fontWithName:@"Helvetica-Light" size:fontSize];
            break;
        case FontNameHelveticaLightOblique:
            return [UIFont fontWithName:@"Helvetica-LightOblique" size:fontSize];
            break;
        case FontNameHelveticaNeue:
            return [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
            break;
        case FontNameHelveticaNeueBold:
            return [UIFont fontWithName:@"HelveticaNeue-Bold" size:fontSize];
            break;
        case FontNameHelveticaNeueBoldItalic:
            return [UIFont fontWithName:@"HelveticaNeue-BoldItalic" size:fontSize];
            break;
        case FontNameHelveticaNeueCondensedBlack:
            return [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:fontSize];
            break;
        case FontNameHelveticaNeueCondensedBold:
            return [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:fontSize];
            break;
        case FontNameHelveticaNeueItalic:
            return [UIFont fontWithName:@"HelveticaNeue-Italic" size:fontSize];
            break;
        case FontNameHelveticaNeueLight:
            return [UIFont fontWithName:@"HelveticaNeue-Light" size:fontSize];
            break;
        case FontNameHelveticaNeueMedium:
            return [UIFont fontWithName:@"HelveticaNeue-Medium" size:fontSize];
            break;
        case FontNameHelveticaNeueMediumItalic:
            return [UIFont fontWithName:@"HelveticaNeue-MediumItalic" size:fontSize];
            break;
        case FontNameHelveticaNeueThin:
            return [UIFont fontWithName:@"HelveticaNeue-Thin" size:fontSize];
            break;
        case FontNameHelveticaNeueThinItalic:
            return [UIFont fontWithName:@"HelveticaNeue-ThinItalic" size:fontSize];
            break;
        case FontNameHelveticaNeueUltraLight:
            return [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:fontSize];
            break;
        case FontNameHelveticaNeueUltraLightItalic:
            return [UIFont fontWithName:@"HelveticaNeue-UltraLightItalic" size:fontSize];
            break;
        case FontNameHelveticaOblique:
            return [UIFont fontWithName:@"Helvetica-Oblique" size:fontSize];
            break;
        case FontNameHiraKakuProNW3:
            return [UIFont fontWithName:@"HiraKakuProN-W3" size:fontSize];
            break;
        case FontNameHiraKakuProNW6:
            return [UIFont fontWithName:@"HiraKakuProN-W6" size:fontSize];
            break;
        case FontNameHiraMinProNW3:
            return [UIFont fontWithName:@"HiraMinProN-W3" size:fontSize];
            break;
        case FontNameHiraMinProNW6:
            return [UIFont fontWithName:@"HiraMinProN-W6" size:fontSize];
            break;
        case FontNameHoeflerTextBlack:
            return [UIFont fontWithName:@"HoeflerText-Black" size:fontSize];
            break;
        case FontNameHoeflerTextBlackItalic:
            return [UIFont fontWithName:@"HoeflerText-BlackItalic" size:fontSize];
            break;
        case FontNameHoeflerTextItalic:
            return [UIFont fontWithName:@"HoeflerText-Italic" size:fontSize];
            break;
        case FontNameHoeflerTextRegular:
            return [UIFont fontWithName:@"HoeflerText-Regular" size:fontSize];
            break;
        case FontNameIowanOldStyleBold:
            return [UIFont fontWithName:@"IowanOldStyle-Bold" size:fontSize];
            break;
        case FontNameIowanOldStyleBoldItalic:
            return [UIFont fontWithName:@"IowanOldStyle-BoldItalic" size:fontSize];
            break;
        case FontNameIowanOldStyleItalic:
            return [UIFont fontWithName:@"IowanOldStyle-Italic" size:fontSize];
            break;
        case FontNameIowanOldStyleRoman:
            return [UIFont fontWithName:@"IowanOldStyle-Roman" size:fontSize];
            break;
        case FontNameKailasa:
            return [UIFont fontWithName:@"Kailasa" size:fontSize];
            break;
        case FontNameKailasaBold:
            return [UIFont fontWithName:@"Kailasa-Bold" size:fontSize];
            break;
        case FontNameKannadaSangamMN:
            return [UIFont fontWithName:@"KannadaSangamMN" size:fontSize];
            break;
        case FontNameKannadaSangamMNBold:
            return [UIFont fontWithName:@"KannadaSangamMN-Bold" size:fontSize];
            break;
        case FontNameMalayalamSangamMN:
            return [UIFont fontWithName:@"MalayalamSangamMN" size:fontSize];
            break;
        case FontNameMalayalamSangamMNBold:
            return [UIFont fontWithName:@"MalayalamSangamMN-Bold" size:fontSize];
            break;
        case FontNameMarionBold:
            return [UIFont fontWithName:@"Marion-Bold" size:fontSize];
            break;
        case FontNameMarionItalic:
            return [UIFont fontWithName:@"Marion-Italic" size:fontSize];
            break;
        case FontNameMarionRegular:
            return [UIFont fontWithName:@"Marion-Regular" size:fontSize];
            break;
        case FontNameMarkerFeltThin:
            return [UIFont fontWithName:@"MarkerFelt-Thin" size:fontSize];
            break;
        case FontNameMarkerFeltWide:
            return [UIFont fontWithName:@"MarkerFelt-Wide" size:fontSize];
            break;
        case FontNameMenloBold:
            return [UIFont fontWithName:@"Menlo-Bold" size:fontSize];
            break;
        case FontNameMenloBoldItalic:
            return [UIFont fontWithName:@"Menlo-BoldItalic" size:fontSize];
            break;
        case FontNameMenloItalic:
            return [UIFont fontWithName:@"Menlo-Italic" size:fontSize];
            break;
        case FontNameMenloRegular:
            return [UIFont fontWithName:@"Menlo-Regular" size:fontSize];
            break;
        case FontNameNoteworthyBold:
            return [UIFont fontWithName:@"Noteworthy-Bold" size:fontSize];
            break;
        case FontNameNoteworthyLight:
            return [UIFont fontWithName:@"Noteworthy-Light" size:fontSize];
            break;
        case FontNameOptimaBold:
            return [UIFont fontWithName:@"Optima-Bold" size:fontSize];
            break;
        case FontNameOptimaBoldItalic:
            return [UIFont fontWithName:@"Optima-BoldItalic" size:fontSize];
            break;
        case FontNameOptimaExtraBlack:
            return [UIFont fontWithName:@"Optima-ExtraBold" size:fontSize];
            break;
        case FontNameOptimaItalic:
            return [UIFont fontWithName:@"Optima-Italic" size:fontSize];
            break;
        case FontNameOptimaRegular:
            return [UIFont fontWithName:@"Optima-Regular" size:fontSize];
            break;
        case FontNameOriyaSangamMN:
            return [UIFont fontWithName:@"OriyaSangamMN" size:fontSize];
            break;
        case FontNameOriyaSangamMNBold:
            return [UIFont fontWithName:@"OriyaSangamMN-Bold" size:fontSize];
            break;
        case FontNamePalatinoBold:
            return [UIFont fontWithName:@"Palatino-Bold" size:fontSize];
            break;
        case FontNamePalatinoBoldItalic:
            return [UIFont fontWithName:@"Palatino-BoldItalic" size:fontSize];
            break;
        case FontNamePalatinoItalic:
            return [UIFont fontWithName:@"Palatino-Italic" size:fontSize];
            break;
        case FontNamePalatinoRoman:
            return [UIFont fontWithName:@"Palatino-Roman" size:fontSize];
            break;
        case FontNamePapyrus:
            return [UIFont fontWithName:@"Papyrus" size:fontSize];
            break;
        case FontNamePapyrusCondensed:
            return [UIFont fontWithName:@"Papyrus-Condensed" size:fontSize];
            break;
        case FontNamePartyLetPlain:
            return [UIFont fontWithName:@"PartyLetPlain" size:fontSize];
            break;
        case FontNameSavoyeLetPlain:
            return [UIFont fontWithName:@"SavoyeLetPlain" size:fontSize];
            break;
        case FontNameSinhalaSangamMN:
            return [UIFont fontWithName:@"SinhalaSangamMN" size:fontSize];
            break;
        case FontNameSinhalaSangamMNBold:
            return [UIFont fontWithName:@"SinhalaSangamMN-Bold" size:fontSize];
            break;
        case FontNameSnellRoundhand:
            return [UIFont fontWithName:@"SnellRoundhand" size:fontSize];
            break;
        case FontNameSnellRoundhandBlack:
            return [UIFont fontWithName:@"SnellRoundhand-Black" size:fontSize];
            break;
        case FontNameSnellRoundhandBold:
            return [UIFont fontWithName:@"SnellRoundhand-Bold" size:fontSize];
            break;
        case FontNameSTHeitiSCLight:
            return [UIFont fontWithName:@"STHeitiSC-Light" size:fontSize];
            break;
        case FontNameSTHeitiSCMedium:
            return [UIFont fontWithName:@"STHeitiSC-Medium" size:fontSize];
            break;
        case FontNameSTHeitiTCLight:
            return [UIFont fontWithName:@"STHeitiTC-Light" size:fontSize];
            break;
        case FontNameSTHeitiTCMedium:
            return [UIFont fontWithName:@"STHeitiTC-Medium" size:fontSize];
            break;
        case FontNameSuperclarendonBlack:
            return [UIFont fontWithName:@"Superclarendon-Black" size:fontSize];
            break;
        case FontNameSuperclarendonBlackItalic:
            return [UIFont fontWithName:@"Superclarendon-BalckItalic" size:fontSize];
            break;
        case FontNameSuperclarendonBold:
            return [UIFont fontWithName:@"Superclarendon-Bold" size:fontSize];
            break;
        case FontNameSuperclarendonBoldItalic:
            return [UIFont fontWithName:@"Superclarendon-BoldItalic" size:fontSize];
            break;
        case FontNameSuperclarendonItalic:
            return [UIFont fontWithName:@"Superclarendon-Italic" size:fontSize];
            break;
        case FontNameSuperclarendonLight:
            return [UIFont fontWithName:@"Superclarendon-Light" size:fontSize];
            break;
        case FontNameSuperclarendonLightItalic:
            return [UIFont fontWithName:@"Superclarendon-LightItalic" size:fontSize];
            break;
        case FontNameSuperclarendonRegular:
            return [UIFont fontWithName:@"Superclarendon-Regular" size:fontSize];
            break;
        case FontNameSymbol:
            return [UIFont fontWithName:@"Symbol" size:fontSize];
            break;
        case FontNameTamilSangamMN:
            return [UIFont fontWithName:@"TamilSangamMN" size:fontSize];
            break;
        case FontNameTamilSangamMNBold:
            return [UIFont fontWithName:@"TamilSangamMN-Bold" size:fontSize];
            break;
        case FontNameTeluguSangamMN:
            return [UIFont fontWithName:@"TeluguSangamMN" size:fontSize];
            break;
        case FontNameTeluguSangamMNBold:
            return [UIFont fontWithName:@"TeluguSangamMN-Bold" size:fontSize];
            break;
        case FontNameThonburi:
            return [UIFont fontWithName:@"Thonburi" size:fontSize];
            break;
        case FontNameThonburiBold:
            return [UIFont fontWithName:@"Thonburi-Bold" size:fontSize];
            break;
        case FontNameThonburiLight:
            return [UIFont fontWithName:@"Thonburi-Light" size:fontSize];
            break;
        case FontNameTimesNewRomanPSBoldItalicMT:
            return [UIFont fontWithName:@"TimesNewRomanPS-BoldItalic" size:fontSize];
            break;
        case FontNameTimesNewRomanPSBoldMT:
            return [UIFont fontWithName:@"TimesNewRomanPS-Bold" size:fontSize];
            break;
        case FontNameTimesNewRomanPSItalicMT:
            return [UIFont fontWithName:@"TimesNewRomanPS-ItalicMT" size:fontSize];
            break;
        case FontNameTimesNewRomanPSMT:
            return [UIFont fontWithName:@"TimesNewRomanPSMT" size:fontSize];
            break;
        case FontNameTrebuchetBoldItalic:
            return [UIFont fontWithName:@"Trebuchet-BoldItalic" size:fontSize];
            break;
        case FontNameTrebuchetMS:
            return [UIFont fontWithName:@"TrebuchetMS" size:fontSize];
            break;
        case FontNameTrebuchetMSBold:
            return [UIFont fontWithName:@"TrebuchetMS-Bold" size:fontSize];
            break;
        case FontNameTrebuchetMSItalic:
            return [UIFont fontWithName:@"TrebuchetMS-Italic" size:fontSize];
            break;
        case FontNameVerdana:
            return [UIFont fontWithName:@"Verdana" size:fontSize];
            break;
        case FontNameVerdanaBold:
            return [UIFont fontWithName:@"Verdana-Bold" size:fontSize];
            break;
        case FontNameVerdanaBoldItalic:
            return [UIFont fontWithName:@"Verdana-BoldItalic" size:fontSize];
            break;
        case FontNameVerdanaItalic:
            return [UIFont fontWithName:@"Verdana-Italic" size:fontSize];
            break;
        case FontNameZapfDingbatsITC:
            return [UIFont fontWithName:@"ZapfDingbatsITC" size:fontSize];
            break;
        case FontNameZapfino:
            return [UIFont fontWithName:@"Zapfino" size:fontSize];
            break;
        default:
            break;
    }
    
    return nil;
}

@end

#pragma mark UIStoryboard
@implementation UIStoryboard (WF)

+(void)showInitialViewControllerWithStoryboardName:(NSString *)name{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:name bundle:nil];
    [UIApplication sharedApplication].keyWindow.rootViewController = storyboard.instantiateInitialViewController;
}
@end
