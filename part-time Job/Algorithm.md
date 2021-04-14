# Algorithm

## 数据结构

### 平衡二叉树

### 红黑树

### B树&B+树

[红黑树原理讲解](https://www.jianshu.com/p/e136ec79235c)

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