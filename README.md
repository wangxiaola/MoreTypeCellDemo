# MoreTypeCellDemo

首先吐槽一下名字，起一个名字脑壳都想疼了😂

平时我们在开发界面的时候经常会遇到一个列表页面，会加载很多不同类型的`cell`，一般`app`的首页界面就会这样设计，比如这样：
![首页](https://upload-images.jianshu.io/upload_images/1823354-cb8f791dbf4a6bfd.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/300)

一般像这样的界面`cell`数量基本都是七八个，多的有十多个。如果在`Tableview`代理里加载显示，`if else` 一大堆，代码太难维护了，而且不好修改，如果那天不要这个功能，一改就是一大堆，加载`cell`的代理里改，高度代理和点击代理也要改，太繁琐了.

那有没有解决方案呢？目前我自己想到的有2种方法，一种是继承，一种是协议。继承耦合度很高，也不能完全解决各种判断，主流还是面向协议开发。

**原理**：在这样的列表里一般一个`model`就对应一个`cell`，我的思想就是让这个model继承一个协议，协议里实现显示这个`cell`的一些方法，然后在`Tableview`代理里用协议调用相应的方法就行，具体实现如下：

1、定义协议接口
```
@protocol WXLPublicCellConfigProtocol <NSObject>
@optional
/**
获取 cell 的复用标识

@return 复用标识
*/
- (nullable NSString *)obtainCellReuseIdentifier;
/**
获取 cell 的高度

@param indexPath indexPath
@return 高度
*/
- (CGFloat)obtainHeightWithindexPath:(NSIndexPath *)indexPath;

/**
cell 点击

@param indexPath indexPath
@param other 其它对象
*/
- (void)cellDidSelectRowAtIndexPath:(NSIndexPath *)indexPath other:(_Nullable id)other;
@end
```
2、model实现协议
`.h`
```
@interface WXLHomePublicModel : NSObject <WXLPublicCellConfigProtocol>

@end
```
`.m`
```
/**
获取 cell 的复用标识

@return 复用标识
*/
- (nullable NSString *)obtainCellReuseIdentifier{
return @"WXLHomeOneTableViewCellID";
}
/**
获取 cell 的高度

@param indexPath indexPath
@return 高度
*/
- (CGFloat)obtainHeightWithindexPath:(NSIndexPath *)indexPath{

return 80;
}

/**
cell 点击

@param indexPath indexPath
@param other 其它对象
*/
- (void)cellDidSelectRowAtIndexPath:(NSIndexPath *)indexPath other:(id)other{

NSLog(@"%@ 点击 %ld",NSStringFromClass([self class]),indexPath.row);
}
```
5、cell开放赋值接口
`.h`
```
/**
协议对象
*/
@property (nonatomic, strong) id<WXLPublicCellConfigProtocol>cellConfig;
```
`.m`
```
- (void)setCellConfig:(id<WXLPublicCellConfigProtocol>)cellConfig
{
WXLHomeOneModel *model = cellConfig;

self.textLabel.text = model.name;
self.textLabel.textColor = model.backColor;
}
```
4、TableView代理里数据返回
```
#pragma mark ---- UITableViewDelegate ----
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
id<WXLPublicCellConfigProtocol>model = self.listArray[indexPath.row];
return [model obtainHeightWithindexPath:indexPath];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
[tableView deselectRowAtIndexPath:indexPath animated:YES];
id<WXLPublicCellConfigProtocol>model = self.listArray[indexPath.row];
[model cellDidSelectRowAtIndexPath:indexPath other:nil];
}
#pragma mark ---- UITableViewDataSource ----
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
return self.listArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
id<WXLPublicCellConfigProtocol>model = self.listArray[indexPath.row];
WXLHomePublicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[model obtainCellReuseIdentifier]];
cell.cellConfig = model;
return cell;
}
```
运行效果：
![效果图](https://upload-images.jianshu.io/upload_images/1823354-4af78dc86d38bba1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/300)

是不是代码很简洁了，如果不想要某个`cell`，只需要删除这个`model`就行。
其实我用一个协议来写也有弊端，这样`model`就只能对应单独的`cell`了，如果想要对应多个cell可以在`model`里在调用一个协议，这个协议由`cell`实现，主要实现`cell`相关的操作，比如返回`cell`的唯一标示或`cell`的`class`。

因本人技术所限，在解决多个`cell`加载的方发里目前就只想到这二个种, 如果以后有更好的方法, 会及时与大家分享，欢迎讨论。


[简书地址](https://www.jianshu.com/p/69933569e0d1)



