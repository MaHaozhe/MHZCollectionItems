
#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

#import <objc/runtime.h>
#import <MapKit/MapKit.h>
#import <AssetsLibrary/AssetsLibrary.h>


typedef NS_ENUM(NSInteger, UINavigationControllerPushOrientation) {
    UINavigationControllerPushOrientationLeft = 0,
    UINavigationControllerPushOrientationRight,
    UINavigationControllerPushOrientationTop,
    UINavigationControllerPushOrientationBottom
};

typedef NS_ENUM(NSInteger, UIViewControllerPresentOrientation) {
    UIViewControllerPresentOrientationLeft = 0,
    UIViewControllerPresentOrientationRight,
    UIViewControllerPresentOrientationTop,
    UIViewControllerPresentOrientationBottom
};

@interface Helper : NSObject



/**
 *  判断给定的点是否被一个CGRect包含
 *
 *  @param r 检测框
 *  @param p 检测点
 *
 *  @return return yes 包含 反之没有
 */
+ (BOOL)pointInRect:(CGRect)r point:(CGPoint)p;

/**
 *  int转字符串
 *
 *  @param temp int值
 *
 *  @return 字符串
 */
+ (NSString *)intToh:(int)temp;

/**
 *  int转字母
 *
 *  @param temp int值
 *
 *  @return 字符串
 */
+ (NSString *)intToLetter:(int)temp;

/**
 *  int转十六进制字符串
 *
 *  @param tmpid int值
 *
 *  @return 字符串
 */
+ (NSString *)intToHex:(int)tmpid;

/**
 *  月份转英文缩写
 *
 *  @param index 月份
 *
 *  @return 英文缩写
 */
+ (NSString *)monthToEnglish:(int)index;
@end

@interface UITableView(Additions)
/**
 *  暂无
 */
@end

@interface UIButton(Additions)


/**
 *  设置button额外点击有效区域
 */
@property (nonatomic, assign) UIEdgeInsets touchAreaInsets;

/**
 *  图片文字上下排列居中对齐
 *
 *  @param spacing 上下间距
 */
- (void)middleAlignButtonWithSpacing:(CGFloat)spacing;


- (UIFont *)titleFont;
- (void)setTitleFont:(UIFont *)font;

/**
 *  button
 *
 *  @param frame      大小
 *  @param title      title
 *  @param titlecolor title颜色
 *  @param target     响应者
 *  @param action     事件
 *
 *  @return button
 */
+ (UIButton *)buttonWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titlecolor target:(id)target action:(SEL)action;

/**
 *  button
 *
 *  @param buttonType      按钮类型
 *  @param frame           大小
 *  @param title           title
 *  @param backgroundImage 背景图片
 *  @param target          响应者
 *  @param action          事件
 *
 *  @return button
 */
+ (UIButton *)buttonWithType:(UIButtonType)buttonType frame:(CGRect)frame title:(NSString *)title backgroundImage:(UIImage *)backgroundImage target:(id)target action:(SEL)action;

/**
 *  button
 *
 *  @param frame           大小
 *  @param backgroundImage 背景图片
 *  @param img             图片
 *  @param target          响应者
 *  @param action          事件
 *
 *  @return button
 */
+ (UIButton *)buttonWithFrame:(CGRect)frame backgroundImage:(UIImage *)backgroundImage backgroundImageToSelected:(UIImage*)img target:(id)target action:(SEL)action;

/**
 *  button
 *
 *  @param buttonType      按钮类型
 *  @param frame           大小
 *  @param title           title
 *  @param backgroundImage 背景图片
 *  @param target          响应者
 *  @param action          事件
 *  @param alignment       title对齐方向
 *
 *  @return button
 */
+ (UIButton *)buttonWithType:(UIButtonType)buttonType frame:(CGRect)frame title:(NSString *)title backgroundImage:(UIImage *)backgroundImage target:(id)target action:(SEL)action withAlignment:(UIControlContentHorizontalAlignment)alignment;

/**
 *  倒计时按钮
 *
 *  @param timeLine 倒计时总时间
 *  @param title    还没倒计时的title 如获取验证码
 *  @param subTitle 倒计时中的子名字，如时、分、秒
 *  @param mColor   还没倒计时的颜色
 *  @param color    倒计时中的颜色
 */
- (void)startWithTime:(NSInteger)timeLine title:(NSString *)title countDownTitle:(NSString *)subTitle mainColor:(UIColor *)mColor countColor:(UIColor *)color;

@end

@interface UIViewController(Additions)

/**
 *  类的字符串名字
 *
 *  @return 字符串
 */
- (NSString *)toString;
/**
 *  跳转
 *
 *  @param viewControllerToPresent 跳到某视图
 *  @param flag                    是否动画
 *  @param orientation             方向
 *  @param completion              完成后调用
 */
- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag orientation:(UIViewControllerPresentOrientation)orientation completion:(void (^)(void))completion;
/**
 *  关闭视图
 *
 *  @param flag        是否有动画
 *  @param orientation 方向
 *  @param completion  完成后调用
 */
- (void)dismissViewControllerAnimated:(BOOL)flag  orientation:(UIViewControllerPresentOrientation)orientation completion:(void (^)(void))completion;
/**
 *  关闭所有modal
 */
- (void)dismissAllModalController;
@end

@interface NSObject(JSON)
- (id)JSONValue;
- (NSString*)JSONString;
@end


@interface UIColor(Additions)

/**
 *  颜色
 *
 *  @param red   红
 *  @param green 绿
 *  @param blue  蓝
 *  @param alpha 透明度
 *
 *  @return 颜色
 */
+ (UIColor *)colorWithWholeRed:(CGFloat)red
                         green:(CGFloat)green
                          blue:(CGFloat)blue
                         alpha:(CGFloat)alpha;

/**
 *  十六进制颜色
 *
 *  @param Oxrgb 十六进制字符串
 *  @param alpha 透明度
 *
 *  @return 颜色
 */
+ (UIColor *)colorWith0xRGB:(NSString *)Oxrgb alpha:(CGFloat)alpha;

/**
 *  十六进制颜色
 *
 *  @param Oxrgb 十六进制字符串
 *
 *  @return 颜色
 */
+ (UIColor *)colorWith0xRGB:(NSString *)Oxrgb;
/**
 *  随机颜色
 *
 *  @return 颜色
 */
+ (UIColor *)randomColor;
/**
 *  随机颜色
 *
 *  @param alpha alpha
 *
 *  @return 颜色
 */
+ (UIColor *)randomColor:(CGFloat)alpha;

/**
 *  color
 *
 *  @param red   red
 *  @param green green
 *  @param blue  blue
 *  @param alpha alpha
 *
 *  @return color
 */
+ (UIColor *)colorWithR:(CGFloat)red g:(CGFloat)green b:(CGFloat)blue a:(CGFloat)alpha;
@end

typedef void(^UIAlertViewCallBackBlock)(NSInteger buttonIndex);

@interface UIAlertView (DN)<UIAlertViewDelegate>

@property (nonatomic, copy) UIAlertViewCallBackBlock alertViewCallBackBlock;

+ (void)alertWithCallBackBlock:(UIAlertViewCallBackBlock)alertViewCallBackBlock title:(NSString *)title message:(NSString *)message  cancelButtonName:(NSString *)cancelButtonName otherButtonTitles:(NSString *)otherButtonTitles, ...NS_REQUIRES_NIL_TERMINATION;

@end

typedef void (^GestureActionBlock)(UIGestureRecognizer *gestureRecoginzer);
@interface UIView(Additions)

/**
 *  添加tap手势
 *
 *  @param block 代码块
 */
- (void)addTapActionWithBlock:(GestureActionBlock)block;

-(CGSize)size;
-(void)setSize:(CGSize)size;
-(void)setSize:(CGSize)size animated:(BOOL)animated;
-(void)setSize:(CGSize)size animated:(BOOL)animated completion:(void (^)(BOOL finished))completion;
-(void)setSize:(CGSize)size animated:(BOOL)animated duration:(NSTimeInterval)duration completion:(void (^)(BOOL finished))completion;

-(CGPoint)origin;
-(void)setOrigin:(CGPoint)origin;
-(void)setOrigin:(CGPoint)origin animated:(BOOL)animated;
-(void)setOrigin:(CGPoint)origin animated:(BOOL)animated completion:(void (^)(BOOL finished))completion;
-(void)setOrigin:(CGPoint)origin animated:(BOOL)animated duration:(NSTimeInterval)duration completion:(void (^)(BOOL finished))completion;

-(CGFloat)x;
-(void)setX:(CGFloat)x;
-(void)setX:(CGFloat)x animated:(BOOL)animated;
-(void)setX:(CGFloat)x animated:(BOOL)animated completion:(void (^)(BOOL finished))completion;
-(void)setX:(CGFloat)x animated:(BOOL)animated duration:(NSTimeInterval)duration completion:(void (^)(BOOL finished))completion;


-(CGFloat)y;
-(void)setY:(CGFloat)y;
-(void)setY:(CGFloat)y animated:(BOOL)animated;
-(void)setY:(CGFloat)y animated:(BOOL)animated completion:(void (^)(BOOL finished))completion;
-(void)setY:(CGFloat)y animated:(BOOL)animated duration:(NSTimeInterval)duration completion:(void (^)(BOOL finished))completion;

-(CGFloat)width;
-(void)setWidth:(CGFloat)width;
-(void)setWidth:(CGFloat)width animated:(BOOL)animated;
-(void)setWidth:(CGFloat)width animated:(BOOL)animated completion:(void (^)(BOOL finished))completion;
-(void)setWidth:(CGFloat)width animated:(BOOL)animated duration:(NSTimeInterval)duration completion:(void (^)(BOOL finished))completion;

-(CGFloat)height;
-(void)setHeight:(CGFloat)height;
-(void)setHeight:(CGFloat)height animated:(BOOL)animated;
-(void)setHeight:(CGFloat)height animated:(BOOL)animated completion:(void (^)(BOOL finished))completion;
-(void)setHeight:(CGFloat)height animated:(BOOL)animated duration:(NSTimeInterval)duration completion:(void (^)(BOOL finished))completion;

/**
 *  视图将要显示
 *
 *  @param animated 是否动画
 */
-(void)viewWillAppear:(BOOL)animated;

/**
 *  视图已经显示
 *
 *  @param animated 是否动画
 */
-(void)viewDidAppear:(BOOL)animated;

/**
 *  视图将要消失
 *
 *  @param animated 是否动画
 */
-(void)viewWillDisappear:(BOOL)animated;

/**
 *  视图已经消失
 *
 *  @param animated 是否动画
 */
-(void)viewDidDisappear:(BOOL)animated;

/**
 *  获取视图的控制器
 *
 *  @return 控制器
 */
-(UIViewController *)getSuperViewController;

/**
 *  从xib获取视图
 *
 *  @param name  xib名字
 *  @param index 视图编号
 *
 *  @return 视图
 */
-(UIView *)getViewWithXibName:(NSString *)name withIndex:(NSInteger)index;


- (void)addGradientLayerWithColors:(NSArray *)cgColorArray locations:(NSArray *)floatNumArray startPoint:(CGPoint )startPoint endPoint:(CGPoint)endPoint;

/**
 *  移动
 *
 *  @param p 左上点
 */
-(void)moveToOrigin:(CGPoint)p;

/**
 *  移动
 *
 *  @param p        左上点
 *  @param duration 时间
 */
-(void)moveToOrigin:(CGPoint)p duration:(NSTimeInterval)duration;

/**
 *  移动
 *
 *  @param p        左上点
 *  @param duration 时间
 *  @param delay    延迟时间
 */
-(void)moveToOrigin:(CGPoint)p duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay;

/**
 *  隐藏视图<alpha>
 *
 *  @param ann 是否动画
 */
-(void)hideWithAnimation:(BOOL)ann;

/**
 *  显示视图<alpha>
 *
 *  @param ann 是否动画
 */
-(void)showWithAnimation:(BOOL)ann;

/**
 *  添加滑动手势
 *
 *  @param target    响应者
 *  @param action    事件
 *  @param direction 方向
 *
 *  @return 手势
 */
-(UISwipeGestureRecognizer *)addSwipeWithTarget:(id)target action:(SEL)action direction:(UISwipeGestureRecognizerDirection)direction;

/**
 *  添加单击手势
 *
 *  @param target 响应者
 *  @param action 事件
 *
 *  @return 手势
 */
-(UITapGestureRecognizer *)addTapWithTarget:(id)target action:(SEL)action;

/**
 *  添加长按手势
 *
 *  @param target 响应者
 *  @param action 事件
 *
 *  @return 手势
 */
-(UILongPressGestureRecognizer *)addLongTapWithTarget:(id)target action:(SEL)action;

/**
 *  移除所有手势
 */
-(void)removeGestureRecognizers;

/**
 *  添加描边
 *
 *  @param borderColor 颜色
 *  @param borderWidth 大小
 */
-(void)addEffectWithBorderColor:(UIColor*)borderColor borderWidth:(float)borderWidth;

/**
 *  添加阴影
 *
 *  @param radius      阴影大小
 *  @param offset      便宜
 *  @param opacity     阴影透明度
 *  @param shadowColor 颜色
 */
-(void)addEffectWithShadowRadius:(float)radius shadowOffset:(CGSize)offset shadowOpacity:(float)opacity shadowColor:(UIColor*)shadowColor;
@end

@interface UINavigationItem (DN)

/**
 *  锁定左侧Item
 *
 *  @param lock 是否锁定
 */
- (void)lockLeftItem:(BOOL)lock;

/**
 *  锁定右侧Item
 *
 *  @param lock 是否锁定
 */
- (void)lockRightItem:(BOOL)lock;

@end

@interface UINavigationController(Additions)
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated orientation:(UINavigationControllerPushOrientation)orientation;
-(UIViewController *)popViewControllerAnimated:(BOOL)animated orientation:(UINavigationControllerPushOrientation)orientation;
-(NSArray *)popToRootViewControllerAnimated:(BOOL)animated orientation:(UINavigationControllerPushOrientation)orientation;
-(NSArray *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated orientation:(UINavigationControllerPushOrientation)orientation;
@end

@interface UIScrollView(Additions)


-(BOOL)showsScrollIndicator;
-(void)setShowsScrollIndicator:(BOOL)indicator;

-(CGFloat)top;
-(void)setTop:(CGFloat)top;

-(CGFloat)left;
-(void)setLeft:(CGFloat)left;

-(CGFloat)bottom;
-(void)setBottom:(CGFloat)bottom;

-(CGFloat)right;
-(void)setRight:(CGFloat)right;

@end

@interface UILabel(Additions)

/**
 *  lable
 *
 *  @param frame           大小
 *  @param text            文字
 *  @param font            字体
 *  @param color           字体颜色
 *  @param backGroundColor 背景颜色
 *
 *  @return lable
 */
+ (UILabel *)labelWithFrame:(CGRect)frame text:(NSString *)text font:(UIFont *)font textColor:(UIColor*)color backGroundColor:(UIColor*)backGroundColor;

/**
 *  Lable
 *
 *  @param frame           大小
 *  @param text            文字
 *  @param font            字体
 *  @param color           字体颜色
 *  @param backGroundColor 背景颜色
 *  @param align           对齐方向
 *
 *  @return lable
 */
+ (UILabel *)labelWithFrame:(CGRect)frame text:(NSString *)text font:(UIFont *)font textColor:(UIColor*)color backGroundColor:(UIColor*)backGroundColor textAlignment:(NSTextAlignment)align;
@end

@interface NSString(Additions)


- (NSString *)makeUnicodeToString;
/**
 *  网址拼接
 *
 *  @param urlString  网址
 *  @param parameters 参数
 *
 *  @return 完整网址
 */
+ (NSString *)URLString:(NSString *)urlString appendParameters:(NSDictionary *)parameters;

/**
 *  判断字符串是否为正确格式邮箱
 *
 *  @return yes 是 no 否
 */
-(BOOL)isValidateEmail;

/**
 *  判断字符串是否为正确格式手机号
 *
 *  @return yes 是 no 否
 */
-(BOOL)validateMobile;

/**
 *  密码有效性检测检测(6-16位不是纯字母或者数字)
 */
- (BOOL)validatePassWord;

/**
 *  字符串是否含有子字符串
 *
 *  @param substring 子字符串
 *
 *  @return yes 有 no 没有
 */
- (BOOL)hasString:(NSString *)substring;

/**
 *  字符串md5加密
 *
 *  @return 加密字符串
 */
-(NSString *)MD5String;

/**
 *  回去字符串占视图高度
 *
 *  @param font  字体
 *  @param width 宽
 *
 *  @return 高度
 */
-(CGFloat)getTextHeightWithFont:(UIFont *)font textWidth:(CGFloat)width;

/**
 *  utf8字符串
 *
 *  @return 字符串
 */
-(NSString *)utf8String;

/**
 *  gbk字符串
 *
 *  @return 字符串
 */
-(NSString *)gbkString;


- (NSString *)a;
- (NSString *)b;
- (NSString *)c;
- (NSString *)d;
- (NSString *)e;
- (NSString *)f;
- (NSString *)g;
- (NSString *)h;
- (NSString *)i;
- (NSString *)j;
- (NSString *)k;
- (NSString *)l;
- (NSString *)m;
- (NSString *)n;
- (NSString *)o;
- (NSString *)p;
- (NSString *)q;
- (NSString *)r;
- (NSString *)s;
- (NSString *)t;
- (NSString *)u;
- (NSString *)v;
- (NSString *)w;
- (NSString *)x;
- (NSString *)y;
- (NSString *)z;

- (NSString *)A;
- (NSString *)B;
- (NSString *)C;
- (NSString *)D;
- (NSString *)E;
- (NSString *)F;
- (NSString *)G;
- (NSString *)H;
- (NSString *)I;
- (NSString *)J;
- (NSString *)K;
- (NSString *)L;
- (NSString *)M;
- (NSString *)N;
- (NSString *)O;
- (NSString *)P;
- (NSString *)Q;
- (NSString *)R;
- (NSString *)S;
- (NSString *)T;
- (NSString *)U;
- (NSString *)V;
- (NSString *)W;
- (NSString *)X;
- (NSString *)Y;
- (NSString *)Z;

- (NSString *)_1;
- (NSString *)_2;
- (NSString *)_3;
- (NSString *)_4;
- (NSString *)_5;
- (NSString *)_6;
- (NSString *)_7;
- (NSString *)_8;
- (NSString *)_9;
- (NSString *)_0;

- (NSString *)_;
- (NSString *)space;
- (NSString *)dot;
- (NSString *)dash;
- (NSString *)comma;
- (NSString *)semicolon;
- (NSString *)colon;
- (NSString *)apostrophe;
- (NSString *)quotation;
- (NSString *)plus;
- (NSString *)equals;
- (NSString *)paren_left;
- (NSString *)paren_right;
- (NSString *)asterisk;
- (NSString *)ampersand;
- (NSString *)caret;
- (NSString *)percent;
- (NSString *)$;
- (NSString *)pound;
- (NSString *)at;
- (NSString *)exclamation;
- (NSString *)back_slash;
- (NSString *)forward_slash;
- (NSString *)curly_left;
- (NSString *)curly_right;
- (NSString *)bracket_left;
- (NSString *)bracket_right;
- (NSString *)bar;
- (NSString *)less_than;
- (NSString *)greater_than;
- (NSString *)underscore;


@end


/*
 *  水印方向
 */
typedef enum {
    
    //左上
    ImageWaterDirectTopLeft=0,
    
    //右上
    ImageWaterDirectTopRight,
    
    //左下
    ImageWaterDirectBottomLeft,
    
    //右下
    ImageWaterDirectBottomRight,
    
    //正中
    ImageWaterDirectCenter
    
}ImageWaterDirect;

@interface UIImage (Color)

/**
 *  合并多张图片
 *
 *  @param header  头
 *  @param content 中间
 *  @param footer  尾
 *
 *  @return image图片
 */
+ (UIImage *)composeWithHeader:(UIImage *)header content:(UIImage *)content footer:(UIImage *)footer;

/**
 *  截屏 scrollView
 *
 *  @param scrollView 要截屏的scrollView
 *
 *  @return image图片
 */

+ (UIImage *)captureScrollView:(UIScrollView *)scrollView;


/**
 *  通过assetUrl获取本地图片
 *
 *  @param assetUrl     字符串形式的本地图片的assetUrl路径
 *  @param successBlock 成功获取到图片后执行的操作
 *  @param failBlock    获取图片失败时执行的操作
 */
+ (void) imageForAssetUrl: (NSString *) assetUrl
                  success: (void(^)(UIImage *aImg)) successBlock
                     fail: (void(^)()) failBlock;

/**
 *  正方向图片
 *
 *  @return 图片
 */
-(UIImage *)upOrientationImage;

/**
 *  创建png图片
 *
 *  @param imageName 图片名字
 *
 *  @return 图片
 */
+(UIImage*)createPNGImage:(NSString*)imageName;
/**
 *  颜色转换为图片
 *
 *  @param color 颜色
 *
 *  @return 图片
 */
+(UIImage *)createImageWithColor:(UIColor *)color;

/**
 *  创建jpg图片
 *
 *  @param imageName 图片名字
 *
 *  @return 图片
 */
+(UIImage*)createJPGImage:(NSString*)imageName;

/**XHImage*/

+ (UIImage *)fastImageWithData:(NSData *)data;


/**
 *  图片处理 灰度 深棕色 反色
 *
 *  @param type 1 2 3
 *
 *  @return 图片
 */
-(UIImage *)grayscaleWithType:(int)type;

/**
 *  切图 保存到doc
 *
 *  @param image   目标图片
 *  @param x       坐标x
 *  @param y       坐标y
 *  @param quality 数量
 *
 *  @return 图片名称数组
 */
+ (NSDictionary *)separateImage:(UIImage *)image ByX:(int)x andY:(int)y cacheQuality:(float)quality;

/**
 *  图片大小转换
 *
 *  @param newSize size
 *
 *  @return 图片
 */
-(UIImage*)imageScaledToSize:(CGSize)newSize;

/**
 *  按size重绘图片(横着要中间,竖着要上边)
 *
 *  @param asize size
 *
 *  @return 图片
 */
-(UIImage *)thumbnailWithSize:(CGSize)asize;

/**
 *  等比例全图(差为空)
 *
 *  @param asize size
 *
 *  @return 图片
 */
-(UIImage *)thumbnailByScaleWithSize:(CGSize)asize;

/**
 *  添加水印文字
 *
 *  @param text      文字
 *  @param direction 方向
 *  @param fontColor 字体颜色
 *  @param fontPoint 字体大小
 *  @param marginXY  位置
 *
 *  @return 图片
 */
-(UIImage *)waterWithText:(NSString *)text direction:(ImageWaterDirect)direction fontColor:(UIColor *)fontColor fontPoint:(CGFloat)fontPoint marginXY:(CGPoint)marginXY;

/**
 *  添加水印图片
 *
 *  @param waterImage 水印图片
 *  @param direction  方向
 *  @param waterSize  大小
 *  @param marginXY   位置
 *
 *  @return 图片
 */
-(UIImage *)waterWithWaterImage:(UIImage *)waterImage direction:(ImageWaterDirect)direction waterSize:(CGSize)waterSize  marginXY:(CGPoint)marginXY;


/**
 *  截图
 *
 *  @param view 目标视图
 *
 *  @return 图片
 */
+(UIImage *)cutFromView:(UIView *)view;


/**
 *  填充颜色图片
 *
 *  @param color 颜色
 *
 *  @return 图片
 */
+(UIImage *)imageFromContextWithColor:(UIColor *)color;
/**
 *  填充颜色图片
 *
 *  @param color 颜色
 *  @param size  大小
 *
 *  @return 图片
 */
+(UIImage *)imageFromContextWithColor:(UIColor *)color size:(CGSize)size;


/**
 *  中心拉伸图片
 *
 *  @param name 图片名字
 *
 *  @return 图片
 */
+(UIImage *)stretchedImageWithName:(NSString *)name;

/**
 *  填充颜色图片
 *
 *  @param tintColor 颜色
 *
 *  @return 图片
 */
- (UIImage *) imageWithTintColor:(UIColor *)tintColor;

/**
 *  填充颜色图片<倾斜的>
 *
 *  @param tintColor 颜色
 *
 *  @return 图片
 */
- (UIImage *) imageWithGradientTintColor:(UIColor *)tintColor;


@end

@interface UIImageView(Additions)

/**
 *  ImageView
 *
 *  @param frame 大小
 *  @param image 图片
 *
 *  @return ImageView
 */
+ (UIImageView *)imageViewWithFrame:(CGRect)frame image:(UIImage *)image;

/**
 *  ImageView
 *
 *  @param frame                  大小
 *  @param image                  图片
 *  @param userInteractionEnabled 是否接受事件
 *
 *  @return ImageView
 */
+ (UIImageView *)imageViewWithFrame:(CGRect)frame image:(UIImage *)image userInteractionEnabled:(BOOL)userInteractionEnabled;

/**
 *  ImageView
 *
 *  @param frame  大小
 *  @param image  图片
 *  @param center 中心点
 *
 *  @return ImageView
 */
+ (UIImageView *)imageViewWithFrame:(CGRect)frame image:(UIImage *)image center:(CGPoint)center;

/**
 *  ImageView
 *
 *  @param image  图片
 *  @param origin 中心点
 *
 *  @return ImageView
 */
+ (UIImageView *)imageViewWithImage:(UIImage *)image Center:(CGPoint)center;
/**
 *  ImageView
 *
 *  @param image  图片
 *  @param origin 左上点
 *
 *  @return ImageView
 */
+ (UIImageView *)imageViewWithImage:(UIImage *)image origin:(CGPoint)origin;
-(void)showLableWithTitle:(NSString *)title;
/**
 *  设置图片可点击下载
 *
 *  @param tap yes可以 no不可以
 */
+(void)setTapToLoadImage:(BOOL)tap;
/**
 *  点击下载图片
 *
 *  @return 是否可以点击下载
 */
+(BOOL)tapToLoadImage;

@property(nonatomic,assign)BOOL selected;
@end

@interface NSUserDefaults (DN)

/**
 *  安全的存入一个键值对
 *
 *  @param i   value
 *  @param key key
 */
-(void)setObj:(id)i forKey:(NSString*)key;

@end

@interface NSURL (DN)

- (NSDictionary *)parameters;

@end

@interface UIWebView (Additions)

- (void)webView:(UIWebView *)sender runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(CGRect *)frame;


/**
 *  加载网站
 *
 *  @param website 网址
 */
- (void)loadWebsite:(NSString *)website;

/**
 *  post加载网站
 *
 *  @param website 网址
 *  @param body    参数
 */
- (void)postWebsite:(NSString *)website body:(NSString *)body;

/**
 *  @brief  清空cookie
 */
- (void)clearCookies;

/**
 *  移除网页背景颜色
 */
- (void)removeBackgroundShadow;

/**
 *  获取当前网页链接
 *
 *  @return 网页链接
 */
- (NSString *) getCurrentURL;

/**
 *  获取网页标题
 *
 *  @return 标题
 */
- (NSString *) getTitle;

/**
 *  读取网页中的图片
 */
- (NSArray *) getImgs;

/**
 *  获取分享标题
 */
- (NSString *)getShareTitle;

/**
 *  获取分享图片
 */
- (NSString *)getShareImage;

/**
 *  获取分享内容
 */
- (NSString *)getSharecontent;

/**
 *  获取分享链接
 */
- (NSString *)getShareURL;

@end


@interface UITextField(Additions)

/**
 *  显示左侧图片
 *
 *  @param image 图片
 */
-(void)addLeftViewWithImage:(NSString *)image;

/**
 *  TextField
 *
 *  @param frame       大小
 *  @param alignment   对齐方式
 *  @param placeholder 默认文字
 *  @param borderStyle 样式
 *  @param vc          代理
 *
 *  @return TextField
 */
+(UITextField*)textFieldWithFrame:(CGRect)frame
                        alignment:(NSTextAlignment)alignment
                      placeholder:(NSString*)placeholder
                      borderStyle:(UITextBorderStyle)borderStyle delegate:(id<UITextFieldDelegate>)vc;

@end

@interface UITextView (DN) <UITextViewDelegate>
@property (nonatomic, strong) UITextView *placeHolderTextView;
- (void)addPlaceHolder:(NSString *)placeHolder;
@end

@interface EncodeURL : NSObject {
    
}
/**
 *  URLencode
 *
 *  @param originalString 原始url字符串
 *  @param stringEncoding StringEncoding
 *
 *  @return encodeUrl字符串
 */
+ (NSString*)URLencode:(NSString *)originalString stringEncoding:(NSStringEncoding)stringEncoding;

@end

/*
 *  动画类型
 */
typedef enum{
    
    //水波
    CALayerTransitionAnimTypeRippleEffect=0,
    
    //吸走
    CALayerTransitionAnimTypeSuckEffect,
    
    //翻开书本
    CALayerTransitionAnimTypePageCurl,
    
    /**
     *  正反翻转
     */
    CALayerTransitionAnimTypeOglFlip,
    
    //正方体
    CALayerTransitionAnimTypeCube,
    
    //push推开
    CALayerTransitionAnimTypeReveal,
    
    //合上书本
    CALayerTransitionAnimTypePageUnCurl,
    
    //随机
    CALayerTransitionAnimTypeRamdom,
    
}CALayerTransitionAnimType;




/*
 *  动画方向
 */
typedef enum{
    
    //从上
    CALayerTransitionSubtypesFromTop=0,
    
    //从左
    CALayerTransitionSubtypesFromLeft,
    
    //从下
    CALayerTransitionSubtypesFromBotoom,
    
    //从右
    CALayerTransitionSubtypesFromRight,
    
    //随机
    CALayerTransitionSubtypesFromRamdom,
    
}CALayerTransitionSubType;


/*
 *  动画曲线
 */
typedef enum {
    
    //默认
    CALayerTransitionCurveDefault,
    
    //缓进
    CALayerTransitionCurveEaseIn,
    
    //缓出
    CALayerTransitionCurveEaseOut,
    
    //缓进缓出
    CALayerTransitionCurveEaseInEaseOut,
    
    //线性
    CALayerTransitionCurveLinear,
    
    //随机
    CALayerTransitionCurveRamdom,
    
}CALayerTransitionCurve;

@interface CALayer(Additions)

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
-(CATransition *)transitionWithAnimType:(CALayerTransitionAnimType)animType subType:(CALayerTransitionSubType)subType curve:(CALayerTransitionCurve)curve duration:(CGFloat)duration;

/**
 *  旋转动画
 *
 *  @param value 旋转角度
 *  @param name  动画特效
 *  @param time  动画时间
 *  @param count 重复次数
 *  @param deg   代理
 */
-(void)rotationAnimationToValue:(CGFloat)value functionName:(NSString*)name duration:(CFTimeInterval)time repeatCount:(int)count delegate:(id)deg;
@end



@interface NSDate (Extend)

- (NSString *)formatRecentContactDate;

/*
 *  时间戳
 */
@property (nonatomic,copy,readonly) NSString *timestamp;

/*
 *  时间成分
 */
@property (nonatomic,strong,readonly) NSDateComponents *components;

/*
 *  是否是今年
 */
@property (nonatomic,assign,readonly) BOOL isThisYear;

/*
 *  是否是今天
 */
@property (nonatomic,assign,readonly) BOOL isToday;

/*
 *  是否是昨天
 */
@property (nonatomic,assign,readonly) BOOL isYesToday;

/**
 *  两个时间比较
 *
 *  @param unit     成分单元
 *  @param fromDate 起点时间
 *  @param toDate   终点时间
 *
 *  @return 时间成分对象
 */
+(NSDateComponents *)dateComponents:(NSCalendarUnit)unit fromDate:(NSDate *)fromDate toDate:(NSDate *)toDate;
@end

#define WEEK_DAYS @[@"星期日", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六"]


@interface NSDate (Utils)


+ (NSDate *)dateWithYear:(NSInteger)year
                   month:(NSInteger)month
                     day:(NSInteger)day
                    hour:(NSInteger)hour
                  minute:(NSInteger)minute
                  second:(NSInteger)second;

+ (NSInteger)daysOffsetBetweenStartDate:(NSDate *)startDate endDate:(NSDate *)endDate;

+ (NSDate *)dateWithHour:(int)hour
                  minute:(int)minute;

#pragma mark - Getter
- (NSInteger)year;
- (NSInteger)month;
- (NSInteger)day;
- (NSInteger)hour;
- (NSInteger)minute;
- (NSInteger)second;
- (NSString *)weekday;


#pragma mark - Time string
- (NSString *)timeHourMinute;
- (NSString *)timeHourMinuteWithPrefix;
- (NSString *)timeHourMinuteWithSuffix;
- (NSString *)timeHourMinuteWithPrefix:(BOOL)enablePrefix suffix:(BOOL)enableSuffix;

#pragma mark - Date String
- (NSString *)stringTime;
- (NSString *)stringMonthDay;
- (NSString *)stringYearMonthDay;
- (NSString *)stringYearMonthDayHourMinuteSecond;
+ (NSString *)stringYearMonthDayWithDate:(NSDate *)date;      //date为空时返回的是当前年月日
+ (NSString *)stringLoacalDate;

#pragma mark - Date formate
+ (NSString *)dateFormatString;
+ (NSString *)timeFormatString;
+ (NSString *)timestampFormatString;
+ (NSString *)timestampFormatStringSubSeconds;

#pragma mark - Date adjust
- (NSDate *) dateByAddingDays: (NSInteger) dDays;
- (NSDate *) dateBySubtractingDays: (NSInteger) dDays;

#pragma mark - Relative dates from the date
+ (NSDate *) dateTomorrow;
+ (NSDate *) dateYesterday;
+ (NSDate *) dateWithDaysFromNow: (NSInteger) days;
+ (NSDate *) dateWithDaysBeforeNow: (NSInteger) days;
+ (NSDate *) dateWithHoursFromNow: (NSInteger) dHours;
+ (NSDate *) dateWithHoursBeforeNow: (NSInteger) dHours;
+ (NSDate *) dateWithMinutesFromNow: (NSInteger) dMinutes;
+ (NSDate *) dateWithMinutesBeforeNow: (NSInteger) dMinutes;
+ (NSDate *) dateStandardFormatTimeZeroWithDate: (NSDate *) aDate;  //标准格式的零点日期
- (NSInteger) daysBetweenCurrentDateAndDate;                     //负数为过去，正数为未来

#pragma mark - Date compare
- (NSString *)stringYearMonthDayCompareToday;                 //返回“今天”，“明天”，“昨天”，或年月日

#pragma mark - Date and string convert
+ (NSDate *)dateFromString:(NSString *)string;
+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format;
- (NSString *)string;
- (NSString *)stringCutSeconds;

@end


/**
 *  Directory type enum
 */
typedef NS_ENUM(NSInteger, DirectoryType)
{
    DirectoryTypeMainBundle = 0,
    DirectoryTypeLibrary,
    DirectoryTypeDocuments,
    DirectoryTypeCache
};

/**
 *  This class add some useful methods to NSFileManager
 */
@interface NSFileManager (BFKit)

/**
 *  Read a file an return the content as NSString
 *
 *  @param file File name
 *  @param type File type
 *
 *  @return Return the content of the file a NSString
 */
+ (NSString *)readTextFile:(NSString *)file
                    ofType:(NSString *)type;


/**
 *  Save a given Dictionary into a PLIST with the given filename
 *
 *  @param path     Path of the PLIST
 *  @param filename PLIST filename
 *  @param array    Array to save into PLIST
 *
 *  @return Return YES if the operation was successful, otherwise NO
 */
+ (BOOL)saveDictionaryToPath:(DirectoryType)path
                withFilename:(NSString *)fileName
                  dictionary:(NSDictionary *)dictionary;

/**
 *  Load Dictionary from a PLIST with the given filename
 *
 *  @param path     Path of the PLIST
 *  @param fileName PLIST filename
 *
 *  @return Return the loaded array
 */
+ (NSDictionary *)loadDictionaryFromPath:(DirectoryType)path
                            withFilename:(NSString *)fileName;

/**
 *  Save a given array into a PLIST with the given filename
 *
 *  @param path     Path of the PLIST
 *  @param filename PLIST filename
 *  @param array    Array to save into PLIST
 *
 *  @return Return YES if the operation was successful, otherwise NO
 */
+ (BOOL)saveArrayToPath:(DirectoryType)path
           withFilename:(NSString *)fileName
                  array:(NSArray *)array;

/**
 *  Load array from a PLIST with the given filename
 *
 *  @param path     Path of the PLIST
 *  @param fileName PLIST filename
 *
 *  @return Return the loaded array
 */
+ (NSArray *)loadArrayFromPath:(DirectoryType)path
                  withFilename:(NSString *)fileName;

/**
 *  Get the Bundle path for a filename
 *
 *  @param fileName Filename
 *
 *  @return Return the path as a NSString
 */
+ (NSString *)getBundlePathForFile:(NSString *)fileName;

/**
 *  Get the Documents directory for a filename
 *
 *  @param fileName Filename
 *
 *  @return Return the directory as a NSString
 */
+ (NSString *)getDocumentsDirectoryForFile:(NSString *)fileName;

/**
 *  Get the Library directory for a filename
 *
 *  @param fileName Filename
 *
 *  @return Return the directory as a NSString
 */
+ (NSString *)getLibraryDirectoryForFile:(NSString *)fileName;

/**
 *  Get the Cache directory for a filename
 *
 *  @param fileName Filename
 *
 *  @return Return the directory as a NSString
 */
+ (NSString *)getCacheDirectoryForFile:(NSString *)fileName;

/**
 *  Delete a file with the given filename.
 *
 *  @param filename Filename to delete
 *  @param origin   Directory of the file
 *
 *  @return Return YES if the operation was successful, otherwise NO
 */
+ (BOOL)deleteFile:(NSString *)fileName fromDirectory:(DirectoryType)directory;

/**
 *  Move a file from a directory to another
 *
 *  @param fileName    Filename to move
 *  @param origin      Origin directory of the file
 *  @param destination Destination directory of the file
 *
 *  @return Return YES if the operation was successful, otherwise NO
 */
+ (BOOL)moveLocalFile:(NSString *)fileName
        fromDirectory:(DirectoryType)origin
          toDirectory:(DirectoryType)destination;

/**
 *  Move a file from a directory to another
 *
 *  @param fileName    Filename to move
 *  @param origin      Origin directory of the file
 *  @param destination Destination directory of the file
 *  @param folderName  Folder name where to move the file. If folder not exist it will be created automatically
 *
 *  @return Return YES if the operation was successful, otherwise NO
 */
+ (BOOL)moveLocalFile:(NSString *)fileName
        fromDirectory:(DirectoryType)origin
          toDirectory:(DirectoryType)destination
       withFolderName:(NSString *)folderName;

/**
 *  To determine whether a file exists
 *
 *  @param FilePath FilePath
 *
 *  @return Return YES if the file was have, otherwise NO
 */
+(BOOL)haveFilesInFilePath:(NSString *)filePath;

/**
 *  the appSeting filePath
 *
 *  @return filePath
 */
+(NSString *)appSetingFilePath;

/**
 *  the seting filePath
 *
 *  @param setName
 *
 *  @return filePath
 */
+(NSString *)setingsFilePath:(NSString *)setName;

/**
 *  Duplicate a file into another directory
 *
 *  @param origin      Origin path
 *  @param destination Destination path
 *
 *  @return Return YES if the operation was successful, otherwise NO
 */
+ (BOOL)duplicateFileAtPath:(NSString *)origin
                  toNewPath:(NSString *)destination;

/**
 *  Rename a file with another filename
 *
 *  @param origin  Origin path
 *  @param path    Subdirectory path
 *  @param oldName Old filename
 *  @param newName New filename
 *
 *  @return Return YES if the operation was successful, otherwise NO
 */
+ (BOOL)renameFileFromDirectory:(DirectoryType)origin
                         atPath:(NSString *)path
                    withOldName:(NSString *)oldName
                     andNewName:(NSString *)newName;

/**
 *  Get the App settings for a given key
 *
 *  @param objKey Key to get the object
 *
 *  @return Return the object for the given key
 */
+ (id)getAppSettingsForObjectWithKey:(NSString *)objKey;

/**
 *  Set the App settings for a given object and key. The file will be saved in the Library directory
 *
 *  @param value  Object to set
 *  @param objKey Key to set the object
 *
 *  @return Return YES if the operation was successful, otherwise NO
 */
+ (BOOL)setAppSettingsForObject:(id)value
                         forKey:(NSString *)objKey;

/**
 *  Get the given settings for a given key
 *
 *  @param settings Settings filename
 *  @param objKey   Key to set the object
 *
 *  @return Return the object for the given key
 */
+ (id)getSettings:(NSString *)settings
     objectForKey:(NSString *)objKey;

/**
 *  Set the given settings for a given object and key. The file will be saved in the Library directory
 *
 *  @param settings Settings filename
 *  @param value    Object to set
 *  @param objKey   Key to set the object
 *
 *  @return Return YES if the operation was successful, otherwise NO
 */
+ (BOOL)setSettings:(NSString *)settings
             object:(id)value forKey:(NSString *)objKey;

@end


/**
 *  All font family names available in iOS 7
 */
typedef NS_ENUM(NSInteger, FamilyFontName)
{
    FamilyFontNameAcademyEngravedLET = 0,
    FamilyFontNameAlNile,
    FamilyFontNameAmericanTypewriter,
    FamilyFontNameAppleColorEmoji,
    FamilyFontNameAppleSDGothicNeo,
    FamilyFontNameArial,
    FamilyFontNameArialHebrew,
    FamilyFontNameArialRoundedMTBold,
    FamilyFontNameAvenir,
    FamilyFontNameAvenirNext,
    FamilyFontNameAvenirNextCondensed,
    FamilyFontNameBanglaSangamMN,
    FamilyFontNameBaskerville,
    FamilyFontNameBodoni72,
    FamilyFontNameBodoni72Oldstyle,
    FamilyFontNameBodoni72Smallcaps,
    FamilyFontNameBodoniOrnaments,
    FamilyFontNameBradleyHand,
    FamilyFontNameChalkboardSE,
    FamilyFontNameChalkduster,
    FamilyFontNameCochin,
    FamilyFontNameCopperplate,
    FamilyFontNameCourier,
    FamilyFontNameCourierNew,
    FamilyFontNameDamascus,
    FamilyFontNameDevanagariSangamMN,
    FamilyFontNameDidot,
    FamilyFontNameDINAlternate,
    FamilyFontNameDINCondensed,
    FamilyFontNameEuphemiaUCAS,
    FamilyFontNameFarah,
    FamilyFontNameFutura,
    FamilyFontNameGeezaPro,
    FamilyFontNameGeorgia,
    FamilyFontNameGillSans,
    FamilyFontNameGujaratiSangemMN,
    FamilyFontNameGurmukhiMN,
    FamilyFontNameHeitiSC,
    FamilyFontNameHeitiTC,
    FamilyFontNameHelvetica,
    FamilyFontNameHelveticaNeue,
    FamilyFontNameHiraginoKakuGothicProN,
    FamilyFontNameHiraginoMinchoProN,
    FamilyFontNameHoeflerText,
    FamilyFontNameIowanOldStyle,
    FamilyFontNameKailasa,
    FamilyFontNameKannadaSangamMN,
    FamilyFontNameMalayamSangamMN,
    FamilyFontNameMarion,
    FamilyFontNameMarkerFelt,
    FamilyFontNameMenlo,
    FamilyFontNameMishafi,
    FamilyFontNameNoteworthy,
    FamilyFontNameOptima,
    FamilyFontNameOriyaSangemMN,
    FamilyFontNamePalatino,
    FamilyFontNamePapyrus,
    FamilyFontNamePartyLET,
    FamilyFontNameSavoyeLET,
    FamilyFontNameSinhalaSangamMN,
    FamilyFontNameSnellRoundhand,
    FamilyFontNameSuperclarendon,
    FamilyFontNameSymbol,
    FamilyFontNameTamilSangamMN,
    FamilyFontNameTeluguSangamMN,
    FamilyFontNameThonburi,
    FamilyFontNameTimesNewRoman,
    FamilyFontNameTrebuchetMS,
    FamilyFontNameVerdana,
    FamilyFontNameZapfDingBats,
    FamilyFontNameZapfino
};

/**
 *  All font names for all family available in iOS 7
 */
typedef NS_ENUM(NSInteger, FontName)
{
    FontNameAcademyEngravedLetPlain = 0,
    FontNameAlNile,
    FontNameAlNileBold,
    FontNameAmericanTypewriter,
    FontNameAmericanTypewriterBold,
    FontNameAmericanTypewriterCondensed,
    FontNameAmericanTypewriterCondensedBold,
    FontNameAmericanTypewriterCondensedLight,
    FontNameAmericanTypewriterLight,
    FontNameAppleColorEmoji,
    FontNameAppleSDGohticNeoBold,
    FontNameAppleSDGohticNeoLight,
    FontNameAppleSDGohticNeoMedium,
    FontNameAppleSDGohticNeoRegular,
    FontNameAppleSDGohticNeoSemiBold,
    FontNameAppleSDGohticNeoThin,
    FontNameArialBoldItalicMT,
    FontNameArialBoldMT,
    FontNameArialHebrew,
    FontNameArialHebrewBold,
    FontNameArialHebrewLight,
    FontNameArialItalicMT,
    FontNameArialMT,
    FontNameArialRoundedMTBold,
    FontNameASTHeitiLight,
    FontNameASTHeitiMedium,
    FontNameAvenirBlack,
    FontNameAvenirBlackOblique,
    FontNameAvenirBook,
    FontNameAvenirBookOblique,
    FontNameAvenirHeavtOblique,
    FontNameAvenirHeavy,
    FontNameAvenirLight,
    FontNameAvenirLightOblique,
    FontNameAvenirMedium,
    FontNameAvenirMediumOblique,
    FontNameAvenirNextBold,
    FontNameAvenirNextBoldItalic,
    FontNameAvenirNextCondensedBold,
    FontNameAvenirNextCondensedBoldItalic,
    FontNameAvenirNextCondensedDemiBold,
    FontNameAvenirNextCondensedDemiBoldItalic,
    FontNameAvenirNextCondensedHeavy,
    FontNameAvenirNextCondensedHeavyItalic,
    FontNameAvenirNextCondensedItalic,
    FontNameAvenirNextCondensedMedium,
    FontNameAvenirNextCondensedMediumItalic,
    FontNameAvenirNextCondensedRegular,
    FontNameAvenirNextCondensedUltraLight,
    FontNameAvenirNextCondensedUltraLightItalic,
    FontNameAvenirNextDemiBold,
    FontNameAvenirNextDemiBoldItalic,
    FontNameAvenirNextHeavy,
    FontNameAvenirNextItalic,
    FontNameAvenirNextMedium,
    FontNameAvenirNextMediumItalic,
    FontNameAvenirNextRegular,
    FontNameAvenirNextUltraLight,
    FontNameAvenirNextUltraLightItalic,
    FontNameAvenirOblique,
    FontNameAvenirRoman,
    FontNameBanglaSangamMN,
    FontNameBanglaSangamMNBold,
    FontNameBaskerville,
    FontNameBaskervilleBold,
    FontNameBaskervilleBoldItalic,
    FontNameBaskervilleItalic,
    FontNameBaskervilleSemiBold,
    FontNameBaskervilleSemiBoldItalic,
    FontNameBodoniOrnamentsITCTT,
    FontNameBodoniSvtyTwoITCTTBold,
    FontNameBodoniSvtyTwoITCTTBook,
    FontNameBodoniSvtyTwoITCTTBookIta,
    FontNameBodoniSvtyTwoOSITCTTBold,
    FontNameBodoniSvtyTwoOSITCTTBook,
    FontNameBodoniSvtyTwoOSITCTTBookIt,
    FontNameBodoniSvtyTwoSCITCTTBook,
    FontNameBradleyHandITCTTBold,
    FontNameChalkboardSEBold,
    FontNameChalkboardSELight,
    FontNameChalkboardSERegular,
    FontNameChalkduster,
    FontNameCochin,
    FontNameCochinBold,
    FontNameCochinBoldItalic,
    FontNameCochinItalic,
    FontNameCopperplate,
    FontNameCopperplateBold,
    FontNameCopperplateLight,
    FontNameCourier,
    FontNameCourierBold,
    FontNameCourierBoldOblique,
    FontNameCourierNewPSBoldItalicMT,
    FontNameCourierNewPSBoldMT,
    FontNameCourierNewPSItalicMT,
    FontNameCourierNewPSMT,
    FontNameCourierOblique,
    FontNameDamascus,
    FontNameDamascusBold,
    FontNameDamascusMedium,
    FontNameDamascusSemiBold,
    FontNameDevanagariSangamMN,
    FontNameDevanagariSangamMNBold,
    FontNameDidot,
    FontNameDidotBold,
    FontNameDidotItalic,
    FontNameDINAlternateBold,
    FontNameDINCondensedBold,
    FontNameDiwanMishafi,
    FontNameEuphemiaUCAS,
    FontNameEuphemiaUCASBold,
    FontNameEuphemiaUCASItalic,
    FontNameFarah,
    FontNameFuturaCondensedExtraBold,
    FontNameFuturaCondensedMedium,
    FontNameFuturaMedium,
    FontNameFuturaMediumItalicm,
    FontNameGeezaPro,
    FontNameGeezaProBold,
    FontNameGeezaProLight,
    FontNameGeorgia,
    FontNameGeorgiaBold,
    FontNameGeorgiaBoldItalic,
    FontNameGeorgiaItalic,
    FontNameGillSans,
    FontNameGillSansBold,
    FontNameGillSansBoldItalic,
    FontNameGillSansItalic,
    FontNameGillSansLight,
    FontNameGillSansLightItalic,
    FontNameGujaratiSangamMN,
    FontNameGujaratiSangamMNBold,
    FontNameGurmukhiMN,
    FontNameGurmukhiMNBold,
    FontNameHelvetica,
    FontNameHelveticaBold,
    FontNameHelveticaBoldOblique,
    FontNameHelveticaLight,
    FontNameHelveticaLightOblique,
    FontNameHelveticaNeue,
    FontNameHelveticaNeueBold,
    FontNameHelveticaNeueBoldItalic,
    FontNameHelveticaNeueCondensedBlack,
    FontNameHelveticaNeueCondensedBold,
    FontNameHelveticaNeueItalic,
    FontNameHelveticaNeueLight,
    FontNameHelveticaNeueMedium,
    FontNameHelveticaNeueMediumItalic,
    FontNameHelveticaNeueThin,
    FontNameHelveticaNeueThinItalic,
    FontNameHelveticaNeueUltraLight,
    FontNameHelveticaNeueUltraLightItalic,
    FontNameHelveticaOblique,
    FontNameHiraKakuProNW3,
    FontNameHiraKakuProNW6,
    FontNameHiraMinProNW3,
    FontNameHiraMinProNW6,
    FontNameHoeflerTextBlack,
    FontNameHoeflerTextBlackItalic,
    FontNameHoeflerTextItalic,
    FontNameHoeflerTextRegular,
    FontNameIowanOldStyleBold,
    FontNameIowanOldStyleBoldItalic,
    FontNameIowanOldStyleItalic,
    FontNameIowanOldStyleRoman,
    FontNameKailasa,
    FontNameKailasaBold,
    FontNameKannadaSangamMN,
    FontNameKannadaSangamMNBold,
    FontNameMalayalamSangamMN,
    FontNameMalayalamSangamMNBold,
    FontNameMarionBold,
    FontNameMarionItalic,
    FontNameMarionRegular,
    FontNameMarkerFeltThin,
    FontNameMarkerFeltWide,
    FontNameMenloBold,
    FontNameMenloBoldItalic,
    FontNameMenloItalic,
    FontNameMenloRegular,
    FontNameNoteworthyBold,
    FontNameNoteworthyLight,
    FontNameOptimaBold,
    FontNameOptimaBoldItalic,
    FontNameOptimaExtraBlack,
    FontNameOptimaItalic,
    FontNameOptimaRegular,
    FontNameOriyaSangamMN,
    FontNameOriyaSangamMNBold,
    FontNamePalatinoBold,
    FontNamePalatinoBoldItalic,
    FontNamePalatinoItalic,
    FontNamePalatinoRoman,
    FontNamePapyrus,
    FontNamePapyrusCondensed,
    FontNamePartyLetPlain,
    FontNameSavoyeLetPlain,
    FontNameSinhalaSangamMN,
    FontNameSinhalaSangamMNBold,
    FontNameSnellRoundhand,
    FontNameSnellRoundhandBlack,
    FontNameSnellRoundhandBold,
    FontNameSTHeitiSCLight,
    FontNameSTHeitiSCMedium,
    FontNameSTHeitiTCLight,
    FontNameSTHeitiTCMedium,
    FontNameSuperclarendonBlack,
    FontNameSuperclarendonBlackItalic,
    FontNameSuperclarendonBold,
    FontNameSuperclarendonBoldItalic,
    FontNameSuperclarendonItalic,
    FontNameSuperclarendonLight,
    FontNameSuperclarendonLightItalic,
    FontNameSuperclarendonRegular,
    FontNameSymbol,
    FontNameTamilSangamMN,
    FontNameTamilSangamMNBold,
    FontNameTeluguSangamMN,
    FontNameTeluguSangamMNBold,
    FontNameThonburi,
    FontNameThonburiBold,
    FontNameThonburiLight,
    FontNameTimesNewRomanPSBoldItalicMT,
    FontNameTimesNewRomanPSBoldMT,
    FontNameTimesNewRomanPSItalicMT,
    FontNameTimesNewRomanPSMT,
    FontNameTrebuchetBoldItalic,
    FontNameTrebuchetMS,
    FontNameTrebuchetMSBold,
    FontNameTrebuchetMSItalic,
    FontNameVerdana,
    FontNameVerdanaBold,
    FontNameVerdanaBoldItalic,
    FontNameVerdanaItalic,
    FontNameZapfDingbatsITC,
    FontNameZapfino
};

/**
 *  This class add some useful methods to UIFont
 */
@interface UIFont (BFKit)

/**
 *  Print in console all family and font names
 */
+ (void)allFamilyAndFonts;


/**
 *  Print in console all font names for a given family
 *
 *  @param familyFontName Family to print the fonts
 *
 *  @return Return all the fonts for the given family
 */
+ (NSArray *)fontsNameForFamilyName:(FamilyFontName)familyFontName;

/**
 *  Craete an UIFont object from the given font name and size
 *
 *  @param fontName Font name
 *  @param fontSize Size of the font
 *
 *  @return Return an UIFont from the given font name and size
 */
+ (UIFont *)fontForFontName:(FontName)fontName
                       size:(CGFloat)fontSize;

@end

/**
 *  This class add some useful methods to UIDevice
 */
@interface UIDevice (BFKit)

/**
 *  Macros to compare system versions
 *
 *  @param v Version, like @"8.0"
 *
 *  @return Return a BOOL
 */
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

+(NSString *)name;


/**
 *  Return the device platform string
 *  Example: "iPhone3,2"
 *
 *  @return Return the device platform string
 */
+ (NSString *)devicePlatform;

/**
 *  Return the user-friendly device platform string
 *  Example: "iPad Air (Cellular)"
 *
 *  @return Return the user-friendly device platform string
 */
+ (NSString *)devicePlatformString;

/**
 *  Check if the current device is an iPad
 *
 *  @return Return YES if it's an iPad, NO if not
 */
+ (BOOL)isiPad;

/**
 *  Check if the current device is an iPhone
 *
 *  @return Return YES if it's an iPhone, NO if not
 */
+ (BOOL)isiPhone;

/**
 *  Check if the current device is an iPod
 *
 *  @return Return YES if it's an iPod, NO if not
 */
+ (BOOL)isiPod;

/**
 *  Check if the current device is the simulator
 *
 *  @return Return YES if it's the simulator, NO if not
 */
+ (BOOL)isSimulator;

/**
 *  Check if the current device has a Retina display
 *
 *  @return Return YES if it has a Retina display, NO if not
 */
+ (BOOL)isRetina;

/**
 *  Check if the current device has a Retina HD display
 *
 *  @return Return YES if it has a Retina HD display, NO if not
 */
+ (BOOL)isRetinaHD;

/**
 *  Return the iOS version without the subversion
 *  Example: 7
 *
 *  @return Return the iOS version
 */
+ (NSInteger)iOSVersion;

/**
 *  Return the current device CPU frequency
 *
 *  @return Return the current device CPU frequency
 */
+ (NSUInteger)cpuFrequency;

/**
 *  Return the current device BUS frequency
 *
 *  @return Return the current device BUS frequency
 */
+ (NSUInteger)busFrequency;

/**
 *  Return the current device RAM size
 *
 *  @return Return the current device RAM size
 */
+ (NSUInteger)ramSize;

/**
 *  Return the current device CPU number
 *
 *  @return Return the current device CPU number
 */
+ (NSUInteger)cpuNumber;

/**
 *  Return the current device total memory
 *
 *  @return Return the current device total memory
 */
+ (NSUInteger)totalMemory;

/**
 *  Return the current device non-kernel memory
 *
 *  @return Return the current device non-kernel memory
 */
+ (NSUInteger)userMemory;

/**
 *  Return the current device total disk space
 *
 *  @return Return the current device total disk space
 */
+ (NSNumber *)totalDiskSpace;

/**
 *  Return the current device free disk space
 *
 *  @return Return the current device free disk space
 */
+ (NSNumber *)freeDiskSpace;

/**
 *  Return the current device MAC address
 *
 *  @return Return the current device MAC address
 */
+ (NSString *)macAddress;

/**
 *  Generate an unique identifier and store it into standardUserDefaults
 *
 *  @return Return a unique identifier as a NSString
 */
+ (NSString *)uniqueIdentifier;

@end

@interface UIStoryboard (WF)

/**
 *  显示sb initial viewController
 *
 *  @param name sb名字
 */
+(void)showInitialViewControllerWithStoryboardName:(NSString *)name;
@end
