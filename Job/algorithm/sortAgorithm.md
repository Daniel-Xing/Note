<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [排序算法](#%E6%8E%92%E5%BA%8F%E7%AE%97%E6%B3%95)
  - [冒泡排序](#%E5%86%92%E6%B3%A1%E6%8E%92%E5%BA%8F)
    - [优化方法（深度赋智面试）](#%E4%BC%98%E5%8C%96%E6%96%B9%E6%B3%95%E6%B7%B1%E5%BA%A6%E8%B5%8B%E6%99%BA%E9%9D%A2%E8%AF%95)
  - [归并排序](#%E5%BD%92%E5%B9%B6%E6%8E%92%E5%BA%8F)
  - [快速排序](#%E5%BF%AB%E9%80%9F%E6%8E%92%E5%BA%8F)
  - [堆排序](#%E5%A0%86%E6%8E%92%E5%BA%8F)
  - [计数排序](#%E8%AE%A1%E6%95%B0%E6%8E%92%E5%BA%8F)
- [Leetcode](#leetcode)
- [面经问题](#%E9%9D%A2%E7%BB%8F%E9%97%AE%E9%A2%98)
  - [找出两个文件中相同的行，数据量小时和数据量大时分别怎么做？](#%E6%89%BE%E5%87%BA%E4%B8%A4%E4%B8%AA%E6%96%87%E4%BB%B6%E4%B8%AD%E7%9B%B8%E5%90%8C%E7%9A%84%E8%A1%8C%E6%95%B0%E6%8D%AE%E9%87%8F%E5%B0%8F%E6%97%B6%E5%92%8C%E6%95%B0%E6%8D%AE%E9%87%8F%E5%A4%A7%E6%97%B6%E5%88%86%E5%88%AB%E6%80%8E%E4%B9%88%E5%81%9A)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


# 排序算法

[go实现多种排序算法](https://zhuanlan.zhihu.com/p/320419705)

## 冒泡排序

**原理**



### 优化方法（深度赋智面试）

- 用一个flag来判断是否发生交换，如果没有，直接break
- 内层循环不需要遍历到结尾

## 归并排序

分治



## 快速排序

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



## 堆排序

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

## 计数排序

# Leetcode

- ***[算法题](https://www.nowcoder.com/jump/super-jump/word?word=算法题)\****：用栈实现队列（Leetcode）其中栈的数据结构也自己实现*
- leetcode 32l
- *[算法题](https://www.nowcoder.com/jump/super-jump/word?word=算法题)：无重复字符的最长子串（[leetcode](https://www.nowcoder.com/jump/super-jump/word?word=leetcode)）*
- ***[算法题](https://www.nowcoder.com/jump/super-jump/word?word=算法题)\****：对无序的[链表](https://www.nowcoder.com/jump/super-jump/word?word=链表)进行[排序](https://www.nowcoder.com/jump/super-jump/word?word=排序)（不可以使用Java中的容器）
- ***[算法题](https://www.nowcoder.com/jump/super-jump/word?word=算法题)\****：下一个排列（Leetcode）*

# 面经问题

## 找出两个文件中相同的行，数据量小时和数据量大时分别怎么做？

作者：酱天小禽兽
链接：https://www.nowcoder.com/discuss/626825
来源：牛客网

回答的是：内存够的话直接用hashMap，否则哈希取模分解到若干个小文件，分治处理） 

  19.1 面试官半天都没有理解我的意思，解释了大概十分钟。。可能不是面试官想要的方法吧。 

   19.2 你这个方法读写操作有点多，能优化下吗？ 

  19.3 能用布隆过滤器吗?（回答的是 布隆过滤器只能判断不存在，不能准确判断是否存在） 

  19.4 那能用布隆过滤器优化吗？（想了想，可以用布隆先简单过滤一次吧，然后说了思路）

