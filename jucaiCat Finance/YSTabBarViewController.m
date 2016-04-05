//
//  YSTabBarViewController.m
//  YUSIR帝霸
//
//  Created by sq-ios40 on 16/3/24.
//  Copyright © 2016年 YUSIR. All rights reserved.
//

#import "YSTabBarViewController.h"
#import "YSNavigationViewController.h"
#import "YSHomeViewController.h"
#import "YSProductViewController.h"
@interface YSTabBarViewController ()

@end

@implementation YSTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupAllChildViewControllers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -配置所有的子视图控制器
/**
 *  配置所有的子视图控制器
 */
- (void)setupAllChildViewControllers {
//     添加子视图控制器
    // 首页
    // 发现
    UIStoryboard *HomeStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    YSHomeViewController *homeVC = [HomeStoryboard instantiateViewControllerWithIdentifier:@"homeVC"];
    [self setupChildViewController:homeVC title:@"首页" imageName:@"tabbar_home" selectedImageName:@"tabbar_home_selected"];
    //产品
    YSProductViewController *productVC = [[YSProductViewController alloc] init];
    [self setupChildViewController:productVC title:@"产品列表" imageName:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_selected"];
//
//    // 发现
//    UIStoryboard *DiscoveryStoryboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:[NSBundle mainBundle]];
//    YSDiscoveryViewController *discoveryVC = [DiscoveryStoryboard instantiateViewControllerWithIdentifier:@"DiscoveryVC"];
//    [self setupChildViewController:discoveryVC title:@"发现" imageName:@"tabbar_discover" selectedImageName:@"tabbar_discover_selected"];
//    // 我的
//    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:[NSBundle mainBundle]];
//    YSMeViewController *meVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"meVC"];
//    [self setupChildViewController:meVC title:@"我的" imageName:@"tabbar_profile" selectedImageName:@"tabbar_profile_selected"];
//    // 添加加号按钮
//    [self setupCenterButton];
    // 配置tab bar
    self.tabBar.backgroundImage = [UIImage imageNamed:@"tabbar_background"];
}

#pragma mark - 配置某一个子视图控制器的方法封装
/**
 *  配置某一个子视图控制器
 *
 *  @param controller        子视图控制器
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中的图标
 */
- (void)setupChildViewController:(UIViewController *)controller title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName {
    // 1.设置属性
    controller.title = title;
    controller.tabBarItem.image = [UIImage imageNamed:imageName];
    controller.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    controller.view.backgroundColor = [UIColor whiteColor];
    
    // 2.包装一个导航控制器加入到tab bar controller中
    YSNavigationViewController *navi = [[YSNavigationViewController alloc] initWithRootViewController:controller];
    [self addChildViewController:navi];
}

///**
// *  配置中间的加号按钮
// */
//- (void)setupCenterButton {
//    [self.tabBar.items[2] setEnabled:NO];
//    UIButton *centerButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    CGPoint origin = [self.view convertPoint:self.tabBar.center toView:self.tabBar];
//    CGSize buttonSize = CGSizeMake(self.tabBar.frame.size.width / 5 - 6, self.tabBar.frame.size.height - 4);
//    centerButton.frame = CGRectMake(origin.x - buttonSize.height/2, origin.y - buttonSize.height/2, buttonSize.height, buttonSize.height);
//    centerButton.backgroundColor = [UIColor whiteColor];
//    [centerButton setBackgroundImage:[UIImage imageNamed:@"navigationbar_background"] forState:UIControlStateNormal];
//    [centerButton setImage:[UIImage imageNamed:@"tabbar_compose_background_icon_add"] forState:UIControlStateNormal];
//   
//    [self.tabBar addSubview:centerButton];
//}







@end
