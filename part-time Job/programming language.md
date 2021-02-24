# Programming Language

## Golang

### GC

### 基础

#### Array 

1. 当元素数量小于或者等于 4 个时，会直接将数组中的元素放置在栈上；
2. 当元素数量大于 4 个时，会将数组中的元素放置到静态区并在运行时取出；

#### [Slice](https://draveness.me/golang/docs/part2-foundation/ch03-datastructure/golang-array-and-slice/)

slice是一个结构体，在数组上提供了一层抽象

```go
type SliceHeader struct {
	Data uintptr
	Len  int
	Cap  int
}

// len(slice) or cap(slice) 获取容量
```

##### 拷贝

```go
copy(a,b)

// 编译时拷贝
n := len(a)
if n > len(b) {
    n = len(b)
}
if a.ptr != b.ptr {
    memmove(a.ptr, b.ptr, n*sizeof(elem(a))) 
}

// 运行时拷贝
func slicecopy(to, fm slice, width uintptr) int {
	if fm.len == 0 || to.len == 0 {
		return 0
	}
	n := fm.len
	if to.len < n {
		n = to.len
	}
	if width == 0 {
		return n
	}
	...

	size := uintptr(n) * width
	if size == 1 {
		*(*byte)(to.array) = *(*byte)(fm.array)
	} else {
		memmove(to.array, fm.array, size)
	}
	return n
}

// 都采用了memmove 整块拷贝内存到目标地址，相比于逐个拷贝数组元素，效率更高
// TODO： Mememove实现？
```

##### [扩容](https://juejin.cn/post/6844903812331732999)

扩容会发生在slice append的时候，当slice的cap不足以容纳新元素，就会进行growSlice。

```go
// 常规操作
func growslice(et *_type, old slice, cap int) slice {
    
	// 省略一些判断...

    newcap := old.cap
    doublecap := newcap + newcap
    if cap > doublecap {
        newcap = cap
    } else {
        if old.len < 1024 {
            newcap = doublecap
        } else {
            // Check 0 < newcap to detect overflow
            // and prevent an infinite loop.
            for 0 < newcap && newcap < cap {
                newcap += newcap / 4
            }
            // Set newcap to the requested cap when
            // the newcap calculation overflowed.
            if newcap <= 0 {
                newcap = cap
            }
        }
    }
    // 省略一些后续...
}
```

实际操作：append的时候发生扩容的动作

- append单个元素，或者append少量的多个元素，这里的少量指double之后的容量能容纳，这样就会走以下扩容流程，不足1024，双倍扩容，超过1024的，1.25倍扩容。
- 若是append多个元素，且double后的容量不能容纳，直接使用预估的容量。

**敲重点！！！！此外，以上两个分支得到新容量后，均需要根据slice的类型size，算出新的容量所需的内存情况`capmem`，然后再进行`capmem`向上取整，得到新的所需内存，除上类型size，得到真正的最终容量,作为新的slice的容量。**

#### [Hash表](https://draveness.me/golang/docs/part2-foundation/ch03-datastructure/golang-hashmap/)

#### String

不可变字符串，结构如下

```go
type StringHeader struct {
	Data uintptr  // 指向底层string
	Len  int			// 长度
}
```

需要转换为[]byte 类型进行修改，[]byte类型也可以转换为string 类型，都需要发生内存拷贝，因此为造成性能损失

### 其他

#### 为什么要选择GO

#### Go的优缺点

