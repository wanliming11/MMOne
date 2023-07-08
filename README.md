# MMOne

Practice something, keep learning!
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


- [ ]  ?


## Learning
- [ ] 1

[1]:	https://img-tx-ugcimg.douyucdn2.cn/image/47257125920230227155810-upload-cfa4/vthumbimage_00001.jpg