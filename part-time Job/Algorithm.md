# Algorithm

## 数据结构

### 平衡二叉树

### B树&B+树

### 红黑树

[红黑树原理讲解](https://www.jianshu.com/p/e136ec79235c)

## 排序算法

[go实现多种排序算法](https://zhuanlan.zhihu.com/p/320419705)

### 冒泡排序

**原理**



#### 优化方法（深度赋智面试）

- 用一个flag来判断是否发生交换，如果没有，直接break
- 内层循环不需要遍历到结尾

### 快速排序

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