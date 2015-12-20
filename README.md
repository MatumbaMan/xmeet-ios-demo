###使用方法：<br>
1.将libxmeetapi.a、XmeetViewController.h、xmeetapi.bundle拷贝到工程目录下，并添加进工程。<br>
2.添加libicucore.dylib Library<br>
3.设置工程的Build Setting中找到OTHER_LINKER_FLAGS,添加2个相关的编译条件：-ObjC和-all_load。<br>
4.引用#import "XmeetViewController.h"，并调用如下代码<br>
```JAVA
XmeetViewController * xmeet = [[XmeetViewController alloc]init];
[xmeet setShowType:YES];
UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:xmeet];
[self presentViewController:nav animated:YES completion:nil];
```
    或者<br>
```JAVA
XmeetViewController *xmeet = [[XmeetViewController alloc]init];
[self.navigationController pushViewController:xmeet animated:YES];
```
(注：setShowType方法为跳转方式设置，默认为presentViewController，YES为pushViewController)<br>
大功告成。 <br>
[了解更多](http://meet.xpro.im)
