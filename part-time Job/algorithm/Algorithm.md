# Algorithm

## 数据结构

### 🌲树

#### 平衡二叉树

左右子树高相差1

#### 红黑树

[红黑树原理讲解](https://www.jianshu.com/p/e136ec79235c)

性质1：每个节点要么是黑色，要么是红色。

性质2：根节点是黑色。

性质3：每个叶子节点（NIL）是黑色。

性质4：每个红色结点的两个子结点一定都是黑色。

**性质5：任意一结点到每个叶子结点的路径都包含数量相同的黑结点。**

#### 红黑树和平衡二叉树

本质上其实差不多，AVL的查询性能更好一点，因为树高是平均的。红黑树的插入和删除性能更好一点，因为不需要严格要求树高。

#### B树&B+树

B+ 树的优点在于：由于B+树在内部节点上不包含数据信息，因此在内存页中能够存放更多的key。  数据存放的更加紧密，具有更好的空间局部性。因此访问叶子节点上关联的数据也具有更好的缓存命中率。B+树的叶子结点都是相连的，因此对整棵树的便利只需要一次线性遍历叶子结点即可。而且由于数据顺序排列并且相连，所以便于区间查找和搜索。而B树则需要进行每一层的递归遍历。相邻的元素可能在内存中不相邻，所以缓存命中性没有B+树好。但是B树也有优点，其优点在于，由于B树的每一个节点都包含key和value，因此经常访问的元素可能离根节点更近，因此访问也更迅速。

#### 跳表

[skip-list](https://15721.courses.cs.cmu.edu/spring2018/papers/08-oltpindexes1/pugh-skiplists-cacm1990.pdf)

![image-20210416162942024](/Users/xingzheng/Note/part-time Job/img/image-20210416162942024.png)

### 图

#### 图的存储（优点缺点）

#### 图的遍历算法

## 排序算法

[go实现多种排序算法](https://zhuanlan.zhihu.com/p/320419705)

### 冒泡排序

**原理**



#### 优化方法（深度赋智面试）

- 用一个flag来判断是否发生交换，如果没有，直接break
- 内层循环不需要遍历到结尾

### 归并排序

分治



### 快速排序

每次选取开头的元素并进行比较，双指针交换，将比基准元素小的都放在左边，将比基准元素大的都放在右边

```go
func quickSort(nums []int) {
  sort(nums, 0, len(nums)-1)
}

func sort(nums []int, lBounce, rBounce int) {
  if lBounce >= rBounce {
    return
  }
  base := nums[lBouce]
  left, right := lBounce +1, rBounce
  for {
    for nums[left] <= base {
      left ++
    }
    for nums[right] > base {
      right++
    }
    if left >= right {
      break
    }
    nums[left], nums[right] = nums[right], nums[left]
  }
  nums[lBounce], nums[right] = nums[right], nums[lBounce]
  sort(nums, lBounce, right -1)
  sort(nums, left, rBounce)
}
```



### 堆排序

[堆排序原理讲解](https://www.jianshu.com/p/21bef3fc3030)

```go
package main

import (
 "fmt"
)

type uint64Slice []uint64

func main()  {
 numbers := []uint64{5,2,7,3,6,1,4}
 sortHeap(numbers)
 fmt.Println(numbers)
}

func sortHeap(numbers uint64Slice)  {
 length := len(numbers)
 buildMaxHeap(numbers,length)
 for i := length-1;i>0;i--{
  numbers.swap(0,i)
  length -=1
  heapify(numbers,0,length)
 }
}

// 构造大顶堆
func buildMaxHeap(numbers uint64Slice,length int)  {
 for i := length / 2; i >= 0; i-- {
  heapify(numbers, i, length)
 }
}

func heapify(numbers uint64Slice, i, length int) {
 left := 2*i + 1
 right := 2*i + 2
 largest := i
 if left < length && numbers[left] > numbers[largest] {
  largest = left
 }
 if right < length && numbers[right] > numbers[largest] {
  largest = right
 }
 if largest != i {
  numbers.swap(i, largest)
  heapify(numbers, largest, length)
 }
}

// 交换方法
func (numbers uint64Slice)swap(i,j int)  {
 numbers[i],numbers[j] = numbers[j],numbers[i]
}
```

### 计数排序

## Leetcode

- ***[算法题](https://www.nowcoder.com/jump/super-jump/word?word=算法题)\****：用栈实现队列（Leetcode）其中栈的数据结构也自己实现*
- leetcode 32l
- *[算法题](https://www.nowcoder.com/jump/super-jump/word?word=算法题)：无重复字符的最长子串（[leetcode](https://www.nowcoder.com/jump/super-jump/word?word=leetcode)）*
- ***[算法题](https://www.nowcoder.com/jump/super-jump/word?word=算法题)\****：对无序的[链表](https://www.nowcoder.com/jump/super-jump/word?word=链表)进行[排序](https://www.nowcoder.com/jump/super-jump/word?word=排序)（不可以使用Java中的容器）
- ***[算法题](https://www.nowcoder.com/jump/super-jump/word?word=算法题)\****：下一个排列（Leetcode）*

## 面经问题

### 找出两个文件中相同的行，数据量小时和数据量大时分别怎么做？

作者：酱天小禽兽
链接：https://www.nowcoder.com/discuss/626825
来源：牛客网

回答的是：内存够的话直接用hashMap，否则哈希取模分解到若干个小文件，分治处理） 

  19.1 面试官半天都没有理解我的意思，解释了大概十分钟。。可能不是面试官想要的方法吧。 

   19.2 你这个方法读写操作有点多，能优化下吗？ 

  19.3 能用布隆过滤器吗?（回答的是 布隆过滤器只能判断不存在，不能准确判断是否存在） 

  19.4 那能用布隆过滤器优化吗？（想了想，可以用布隆先简单过滤一次吧，然后说了思路）

