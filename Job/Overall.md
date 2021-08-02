

# 秋招梳理

## 21年可参加

### 小米 2021年7月1日-2022年12月31日的海外留学生

### 华为 2年

#### 2021/7/28 笔试题目

```go
/**
作者：。。。201901251159692
链接：https://www.nowcoder.com/discuss/693271?type=2&order=3&pos=6&page=1&ncTraceId=&channel=-1&source_id=discuss_tag_nctrack
来源：牛客网

第一题 服务器
输入
// 4
// 0,2,200,0,1
// 1,3,400,0,1
// 2,3,400,1,0
// 3,3,300,0,1
// 3 1 3 200 0 1
输出
//2 1 3
第一行输入服务器个数M
接下来M行为服务器参数，按顺序为编号，cpu数，内存大小， 架构， 是否支持NP卡
最后一行为选择要求， 按顺序为服务器数， 选择策略， cpu数，内存大小，架构， NP
(服务器cpu数内存应不小于要求， 架构NP必须一致)
其中架构0-8 为9则都可以
NP 0-1 为2则都可以
选择策略：
为1时 cpu优先， 优先最符合的cpu数，在选最符合的内存大小
为2时 内存优先， 优先最符合的内存大小，在选最符合的cpu数
cpu数内存大小一样时，按编号大小选
输出说明， 选两台， 分别为1,3

**/


func Server() {
	// 读取输入
	var n int
	fmt.Scan(&n)

	servers := make([][]int, n)
	for i := 0; i < n; i++ {
		servers[i] = make([]int, 5)

		fmt.Scanf("%d,%d,%d,%d,%d", &servers[i][0], &servers[i][1], &servers[i][2], &servers[i][3], &servers[i][4])
	}

	var (
		N         int // number
		Strategy  int // strategy
		MinCpu    int //
		MinMemory int //
		Arch      int // architecture
		NPArch    int //
	)

	fmt.Scanf("%d %d %d %d %d %d", &N, &Strategy, &MinCpu, &MinMemory, &Arch, &NPArch)

	fmt.Println(N, Strategy, MinCpu, MinMemory, Arch, NPArch)

	// process
	switch Strategy {
	case 1:
		sort.Slice(servers, func(i, j int) bool {
			if servers[i][1] < servers[j][1] {
				return true
			}

			if servers[i][1] == servers[j][1] && servers[i][2] < servers[j][2] {
				return true
			}

			if servers[i][1] == servers[j][1] && servers[i][2] == servers[j][2] && servers[i][0] < servers[j][0] {
				return true
			}

			return false
		})

		fmt.Printf("ok")
	case 2:

		sort.Slice(servers, func(i, j int) bool {
			if servers[i][2] < servers[j][2] {
				return true
			}

			if servers[i][2] == servers[j][2] && servers[i][1] < servers[j][1] {
				return true
			}

			if servers[i][2] == servers[j][2] && servers[i][1] == servers[j][1] && servers[i][0] < servers[j][0] {
				return true
			}

			return false
		})
	}

	fmt.Println(servers)

	var ans []int
	for i := 0; i < n; i++ {
		if servers[i][3] != Arch || servers[i][4] != NPArch {
			continue
		}

		if servers[i][1] >= MinCpu && servers[i][2] >= MinMemory {
			ans = append(ans, servers[i][0])
		}

		if len(ans) == N {
			break
		}
	}

	sort.Slice(ans, func(i, j int) bool {
		return ans[i] < ans[j]
	})

	fmt.Printf("%d ", len(ans))
	for i := 0; i < len(ans); i++ {
		fmt.Printf("%v ", ans[i])
	}
	// fmt.Printf("/n")
}
```



```go
/**
作者：。。。201901251159692
链接：https://www.nowcoder.com/discuss/693271?type=2&order=3&pos=6&page=1&ncTraceId=&channel=-1&source_id=discuss_tag_nctrack
来源：牛客网

第三题 去西藏
// 3 4
// 1 0 0 0
// 0 0 0 0
// 0 0 2 -1

// 2
输入
二维矩阵 其中1表示起点，2表示终点，0可走，-1不可走
求从1开始经过所有0到2的路径数，不走重复节点
输出
有两条
**/

func DFS() {
	var rows, collumns int
	var x, y int
	var allZero, allRoad, haveZero int
	fmt.Scanf("%d %d", &rows, &collumns)

	roadMap := make([][]int, rows)
	for i := 0; i < rows; i++ {
		roadMap[i] = make([]int, collumns)
		for j := 0; j < collumns; j++ {
			fmt.Scan(&roadMap[i][j])
			if roadMap[i][j] == 0 {
				allZero++
			}
			if roadMap[i][j] == 1 {
				x, y = i, j
				roadMap[i][j] = 0
			}
		}
	}
	allZero++

	fmt.Println(roadMap)
	fmt.Println(x, y, allZero, allRoad, haveZero)

	var dfs func(xx, yy int)
	dfs = func(xx, yy int) {
		if xx < 0 || xx > rows-1 || yy < 0 || yy > collumns-1 {
			return
		}

		if roadMap[xx][yy] == -1 || roadMap[xx][yy] == 1 {
			return
		}

		if roadMap[xx][yy] == 2 {
			fmt.Println(xx, yy, haveZero, allRoad, allZero)
			if haveZero == allZero {
				fmt.Println("ok")
				allRoad++
			}

			return
		}

		roadMap[xx][yy] = 1
		fmt.Println(roadMap)
		haveZero++
		dfs(xx-1, yy)

		dfs(xx+1, yy)

		dfs(xx, yy-1)

		dfs(xx, yy+1)
		roadMap[xx][yy] = 0
		haveZero--
	}

	dfs(x, y)

	fmt.Println(allRoad)
}
```





### 快手 2年

### OPPO 



## 22 年可参加

### 字节跳动 

### 腾讯



# 梳理

看面经复习操作系统和计算机网络

刷算法题

侧重点在 数据库和分布式

## 算法 

- leetcode至少刷200～300道题目
- 算法导论网课

## 分布式

- 毕设
- MIT分布式网课

## 自我介绍

你好，我是电子科技大学的大四学生 邢政。目前主要使用go做后台相关的开发，独立完成过一个后台项目，目前部署在教研室的服务器上。使用过常见的mysql，redis等数据库，有一定的计算机基础。在校期间的话成绩还不错，获得过几次奖学金。



## 项目

### MPI

#### 亮点

通过逐步的优化，使得运算速度大幅度提升，相较于第一个版本，提升到100%

#### 难点

优化的思路是最难想的。因为需要不断的测试嘛。比如说，在消除广播之后，实际测出来的提升几乎没有

- 从理论上来说，如果单核cpu频率够高，相比于通信开销来说，计算本地的素数的开销是可以忽略不计的

提高l1 cache命中率

- 需要小心的计算l1 cache究竟能load进多少数据进去，如果太少了，性能还可以提升。如果稍微多一点，性能反而会下降。

### 标注平台

#### 亮点



### 分布式关系算子

#### 亮点

讨论通用算法以及复杂度

基于flink实现 纯流式处理

#### 难点

语义不匹配

算法设计

## 智力题

### 圆湖中心鸭子速度s，岸边老虎速度4s，问鸭子能否逃生。经典智力题。



### 参加一个[游戏]()节目，你是参赛者，主持人会在你的前面放三个盒子，其中一个盒子藏奖品，你选中一个盒子之后，主持人会开启另外两个中没奖品的一个盒子，剩下一个盒子。请问现在有机会让你换成另外一个盒子，你换盒子和不换盒子的中奖概率是怎么样的？



### 非负无序整数数组[2,1,3,4,2,1],target = 3，找到target等于3的序列，使得剩下的元素最长，输出剩余元素最长的长度 

要求：只能从头部找，或者尾部找或者头部+尾部找，中间不能越过元素 

eg1： [2,1,3,4,2,1] target = 3

头部2+1=3，len(3,4,2,1)=4 

尾部1+2=3,len(2,1,3,4)=4 

头部2+尾部1 = 3，len(1,3,4,2)=4 

eg2：[4,5,6] target = 3 

不存在，return -1 

eg3：[2,1,3,4,4,3] 

头部2+头部1，len(3,4,4,3) = 4 

尾部2：len(2,1,3,4,4,) = 5 

提示：可以考虑反向思维->连续子串的和=sum(arr)-target