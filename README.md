# MMOne

Practice complex something, keep learning!
MMOne is a project. This project wants to solve some small and complex problems, and at the same time to make a learning workspace for new technologies.

## Features
- [x] How to show a sprite figure on ?
	> 任何一张雪碧图，是一张很多小图片的组合，使用场景是为了对于缩略信息的快速展示的场景。由于雪碧图只需要一次下载，不需要多次请求网络和磁盘 IO，快速浏览的场景会比较合适。（PS：是否编辑软件里面的快速浏览也可以用这种想法） 
	> 1. 雪碧图可能有不同的尺寸。
	> 同一个视频的雪碧图的尺寸由于是一样的，所以可以跟每个视频约定一个尺寸，尺寸包括：缩略图的尺寸 + 一整张图包含多少个缩略图
	> 缩略图的尺寸： 
	> 一整张雪碧图包含 10*10：不足的部分用黑色填充 *
	> 资源参考： [https://img-tx-ugcimg.douyucdn2.cn/image/47257125920230227155810-upload-cfa4/vthumbimage\_00001.jpg][1]
	> 2. 定位到具体哪一个区域的算法:
	>  视频的索引是通过时间，通过时间去算 index，向下取整，然后算出要取的 Rect 。
	> 3. 渲染到屏幕: 通过 CALayer 的 ContentsRect

- [x]  Implementation strategy for multiple player focus contention.
	\ - 对于直播类 App 一般要处理的场景
	1. 主播放器的主动播放以及会后台播放。
	2. 其他音频播放器临时播放声音后，然后继续播放原来流的声音。
	3. 通话被抢占结束后恢复播放器的声音。
	4. 非常规做法： 假保活机制（设置一个静音的视频），让系统误以为当前应用抢占了音频焦点，而不把应用 Kill 掉。 
- 还有另外一种业务层的场景
	1. 两个播放器存在的时候，一个静音，一个正常播放声音。
- 常规的策略包括：
	- AVAudioSessionCategory：
		1. **`AVAudioSessionCategoryPlayback  最主流的，允许后台播放`，例如主播放器播放直播流的时候。**
		2. **AVAudioSessionCategoryAmbient   不支持后台播放,环境音或者天气预报；不会中断其他程序的音频播放**
		3. **AVAudioSessionCategorySoloAmbient  和上面的类似，但会降低其他音频的音量，**
		4. **AVAudioSessionCategoryRecord   音频录制；语音聊天应用程序或音乐制作应用程序；不允许后台播放；优先级比较高，可以中断其他音频**
		5. **AVAudioSessionCategoryPlayAndRecord  和上面类似，需要播放和录制的应用。** 
			1. 一般是同时需要音频录制和播放的场景，例如用户自己进行内容创作，一定会先录制后再进行播放，符合常规的业务
	- 所有上面的策略设置，因为 AudioSession 是一个单例，都要考虑是否需要还原策略的场景，或者下一个业务场景需要使用的时候，重置下自己的策略，如果存在交叉场景，很容易出错。
	- AVAudioSessionCategoryOptions 是一个掩码策略，用来满足在当前模式下的子定制化需求，类似于分组分支的小分支。
 - [x] Compare the MVC, MVP, MVVM and VIPER pattern.
	- 这几种代码架构模式都是前端比较相关的几种代码结构
	- MVC 反应的是 Model, View, Control 之间的扭转
	- MVP 反应的是 Model，View， Present 之间的扭转
	- MVVM 反应的是 Model，View，ViewModel 之间的扭转
	- Viper 更细分一些， View，Interact，Present，Entity，Router
	- 用代码来区分关于视图的展示，响应，网络与逻辑的操作，页面路由的操作， Model 的处理，每个业务场景放在哪里更合适。
- [] Chains
    - 案例里面有一个比较有趣的部分，就是会通过当前对象不断凭借，然后渲染富文本。
    - OC 里面通过 Category 加上 AssociatedObject 的方式形成外部链条拼接；内部通过不断返回 Self 形成链条拼接。
    - Swift 外部通过 Extensions 的
- [] 并查集的应用场景
- [x] LRU
- [x] iOS OC & Swift Category and extension
- [x] iOS Read&Write Lock
- [x] iOS Atomatic Property
- [x] Dynamic VM update:
    - 演示了一个类似直播间需要动态插入数据的场景，不同的推荐数据，然后获取去进行更新
- [ ] async and await
- [ ] SwiftUI - Cell
    * 
    



## Learning
- [ ] 1

[1]:	https://img-tx-ugcimg.douyucdn2.cn/image/47257125920230227155810-upload-cfa4/vthumbimage_00001.jpg
