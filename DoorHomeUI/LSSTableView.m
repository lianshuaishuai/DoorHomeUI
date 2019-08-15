//
//  LSSTableView.m
//  ttttt
//
//  Created by 连帅帅 on 2019/8/15.
//  Copyright © 2019 连帅帅. All rights reserved.
//

#import "LSSTableView.h"

@implementation LSSTableView
-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    if (point.y < 0)return nil;
    return [super hitTest:point withEvent:event];
}

@end
