# Programming Language

## Golang

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

<details>
<summary><strong>如何实现栈和队列</strong></summary>
1.  通过slice实现，入栈出栈可以使用切片来实现。但是有内存泄漏的风险
2.  利用标准库里面的container/link（双向链表） 来实现，不保证线程安全

container包中包含三个主要的东西，一个是heap 定义了一些接口，需要用户自己去实现，接口内部嵌入了sort包的中的接口。
还有一个是link 双向链表，最后一个是ring
</details>

#### [Hash表](https://draveness.me/golang/docs/part2-foundation/ch03-datastructure/golang-hashmap/)

##### golang 如何创建一个map

字面量或者make

#### String

不可变字符串，结构如下

```go
type StringHeader struct {
	Data uintptr  // 指向底层string
	Len  int			// 长度
}
```

需要转换为[]byte 类型进行修改，[]byte类型也可以转换为string 类型，都需要发生内存拷贝，因此为造成性能损失





#### 函数

函数是一等公民：

- c语言函数传递参数和返回值使用寄存器和栈共同来操作，返回值只使用一个栈，所以不支持多返回值。GO语言使用栈来进行参数的传递与返回，只需要在栈上多分配一些空间即可实现多返回值，但是牺牲了性能。
- go语言值拷贝，传递大的结构体的时候注意使用指针传递； 结构体在内存中是连续的一块区域，指针指向结构体顶部。

#### 接口

接口是一些方法签名的集合； 鸭子类型，实现接口的时候不需要指定，在特定时候会进行类型转换进行Check；

- go中的接口分为两种类型：runtime.iface(带有一组方法的接口)，runtime.eface(不带方法的接口)
- 空接口interface{} != nil

<details>
<summary><strong>接口？有什么优劣之处？</strong></summary>

接口：抽象出来的模式或者说是约定，一系列函数签名的合集
优点：非侵入式的，编码起来非常灵活，一般来说在项目开始的时候很难去定义需要哪些接口，go可以随着项目的进行来确定最终需要那些接口
劣势: 相比与侵入式的接口而言，很难确定一个结构提实现了哪些接口，也很难确定哪些接口被实现了。可能存在名称冲突的问题。

如果a接口中包含b，c两个接口，且b，c两个接口中有重名，那么在go1.14 之前会报编译错误，但是在go1.14中修复了这个错误。

</details>





#### 反射

反射给Go提供了元编程的能力；Go中的反射主要集中于两种reflect.Type 和reflect.Value，可以使用提供的reflect.TypeOf和reflect.ValueOf来获取变量类型。

#### for range

```go
// 第一个例子
func main() {
	arr := []int{1, 2, 3}
	for _, v := range arr {
		arr = append(arr, v)
	}
	fmt.Println(arr)
}

$ go run main.go
1 2 3 1 2 3

// 第二个例子
func main() {
	arr := []int{1, 2, 3}
	newArr := []*int{}
	for _, v := range arr {
		newArr = append(newArr, &v)
	}
	for _, v := range newArr {
		fmt.Println(*v)
	}
}

$ go run main.go
3 3 3
```

**针对于遍历切片，运行时会被替换为**：

```go
ha := a
hv1 := 0
hn := len(ha)
v1 := hv1
for ; hv1 < hn; hv1++ {
    ...
}

/**
....
**/

ha := a
hv1 := 0
hn := len(ha)
v1 := hv1
v2 := nil
for ; hv1 < hn; hv1++ {
    tmp := ha[hv1]
    v1, v2 = hv1, tmp
    ...
}
```

即：会用新的变量来替换原来的数组，并且循环内部会复用元素，因此要注意变量的作用域

**对于字符串**

```go
ha := s
for hv1 := 0; hv1 < len(ha); {
    hv1t := hv1
    hv2 := rune(ha[hv1])  // 将字符数组转换为rune类型
    if hv2 < utf8.RuneSelf {
        hv1++
    } else {
        hv2, hv1 = decoderune(ha, hv1)
    }
    v1, v2 = hv1t, hv2
}
```

**针对于Map**：编译时会插入一个随机数，来决定开始遍历的起点

**针对Channel** ：

```go
for v := range ch {} 

// 展开
ha := a
hv1, hb := <-ha
for ; hb != false; hv1, hb = <-ha {
    v1 := hv1
    hv1 = nil
    ...
}
```

#### defer & panic & recover

![golang-new-defer](/Users/xingzheng/Note/part-time Job/img/2020-01-19-15794017184614-golang-new-defer.png)

`defer` 关键字的实现主要依靠编译器和运行时的协作，我们总结一下本节提到的三种机制：

- 堆上分配 · 1.1 ~ 1.12
  - 编译期将 `defer` 关键字被转换 [`runtime.deferproc`](https://draveness.me/golang/tree/runtime.deferproc) 并在调用 `defer` 关键字的函数返回之前插入 [`runtime.deferreturn`](https://draveness.me/golang/tree/runtime.deferreturn)；
  - 运行时调用 [`runtime.deferproc`](https://draveness.me/golang/tree/runtime.deferproc) 会将一个新的 [`runtime._defer`](https://draveness.me/golang/tree/runtime._defer) 结构体追加到当前 Goroutine 的链表头；
  - 运行时调用 [`runtime.deferreturn`](https://draveness.me/golang/tree/runtime.deferreturn) 会从 Goroutine 的链表中取出 [`runtime._defer`](https://draveness.me/golang/tree/runtime._defer) 结构并依次执行；
- 栈上分配 · 1.13
  - 当该关键字在函数体中最多执行一次时，编译期间的 [`cmd/compile/internal/gc.state.call`](https://draveness.me/golang/tree/cmd/compile/internal/gc.state.call) 会将结构体分配到栈上并调用 [`runtime.deferprocStack`](https://draveness.me/golang/tree/runtime.deferprocStack)；
- 开放编码 · 1.14 ~ 现在
  - 编译期间判断 `defer` 关键字、`return` 语句的个数确定是否开启开放编码优化；
  - 通过 `deferBits` 和 [`cmd/compile/internal/gc.openDeferInfo`](https://draveness.me/golang/tree/cmd/compile/internal/gc.openDeferInfo) 存储 `defer` 关键字的相关信息；
  - 如果 `defer` 关键字的执行可以在编译期间确定，会在函数返回前直接插入相应的代码，否则会由运行时的 [`runtime.deferreturn`](https://draveness.me/golang/tree/runtime.deferreturn) 处理；

我们在本节前面提到的两个现象在这里也可以解释清楚了：

- 后调用的defer函数会先执行：
  - 后调用的 `defer` 函数会被追加到 Goroutine `_defer` 链表的最前面；
  - 运行 [`runtime._defer`](https://draveness.me/golang/tree/runtime._defer) 时是从前到后依次执行；
- 函数的参数会被预先计算；
  - 调用 [`runtime.deferproc`](https://draveness.me/golang/tree/runtime.deferproc) 函数创建新的延迟调用时就会立刻拷贝函数的参数，函数的参数不会等到真正执行时计算；

**panic & recover**

分析程序的崩溃和恢复过程比较棘手，代码不是特别容易理解。我们在本节的最后还是简单总结一下程序崩溃和恢复的过程：

1. 编译器会负责做转换关键字的工作；
   1. 将 `panic` 和 `recover` 分别转换成 [`runtime.gopanic`](https://draveness.me/golang/tree/runtime.gopanic) 和 [`runtime.gorecover`](https://draveness.me/golang/tree/runtime.gorecover)；
   2. 将 `defer` 转换成 [`runtime.deferproc`](https://draveness.me/golang/tree/runtime.deferproc) 函数；
   3. 在调用 `defer` 的函数末尾调用 [`runtime.deferreturn`](https://draveness.me/golang/tree/runtime.deferreturn) 函数；
2. 在运行过程中遇到 [`runtime.gopanic`](https://draveness.me/golang/tree/runtime.gopanic) 方法时，会从 Goroutine 的链表依次取出 [`runtime._defer`](https://draveness.me/golang/tree/runtime._defer) 结构体并执行；
3. 如果调用延迟执行函数时遇到了runtime.gorecover就会将_panic.recovered标记成 true 并返回panic的参数；
   1. 在这次调用结束之后，[`runtime.gopanic`](https://draveness.me/golang/tree/runtime.gopanic) 会从 [`runtime._defer`](https://draveness.me/golang/tree/runtime._defer) 结构体中取出程序计数器 `pc` 和栈指针 `sp` 并调用 [`runtime.recovery`](https://draveness.me/golang/tree/runtime.recovery) 函数进行恢复程序；
   2. [`runtime.recovery`](https://draveness.me/golang/tree/runtime.recovery) 会根据传入的 `pc` 和 `sp` 跳转回 [`runtime.deferproc`](https://draveness.me/golang/tree/runtime.deferproc)；
   3. 编译器自动生成的代码会发现 [`runtime.deferproc`](https://draveness.me/golang/tree/runtime.deferproc) 的返回值不为 0，这时会跳回 [`runtime.deferreturn`](https://draveness.me/golang/tree/runtime.deferreturn) 并恢复到正常的执行流程；
4. 如果没有遇到 [`runtime.gorecover`](https://draveness.me/golang/tree/runtime.gorecover) 就会依次遍历所有的 [`runtime._defer`](https://draveness.me/golang/tree/runtime._defer)，并在最后调用 [`runtime.fatalpanic`](https://draveness.me/golang/tree/runtime.fatalpanic) 中止程序、打印 `panic` 的参数并返回错误码 2；

分析的过程涉及了很多语言底层的知识，源代码阅读起来也比较晦涩，其中充斥着反常规的控制流程，通过程序计数器来回跳转，不过对于我们理解程序的执行流程还是很有帮助。

#### make & new

- `make` 的作用是初始化内置的数据结构，也就是我们在前面提到的切片、哈希表和 Channel；
- `new` 的作用是根据传入的类型分配一片内存空间并返回指向这片内存空间的指针]；
- 

### 进阶

#### Context



#### GC

### 标准库

#### math

##### rand：

使用rand进行负载均衡的时候，如果多个go routine使用的是同一个随机数种子，那么生成的随机数是一样的。



### 进阶

#### golang 的GMP模型

#### 线程和协程的堆栈的异同

#### GOROUTINE 的优势，它的轻量级体现在哪

#### channel的实现

#### goroutine 多核模型下是如何分配

#### golang闭包



### 框架

#### 介绍一下gin框架并且与原生的net/http比较



### 其他

#### 为什么要选择GO

#### Go的优缺点

#### Go语言与C语言的优缺点

#### 说一说docker如何映射端口的，docker网络模型





### [GDB调试](https://github.com/astaxie/build-web-application-with-golang/blob/master/zh/11.2.md)

编译Go程序的时候需要注意以下几点

1. 传递参数-ldflags "-s"，忽略debug的打印信息
2. 传递-gcflags "-N -l" 参数，这样可以忽略Go内部做的一些优化，聚合变量和函数等优化，这样对于GDB调试来说非常困难，所以在编译的时候加入这两个参数避免这些优化。 

gdb插件

1. 生成.gdbinit 文件
2. 添加：add-auto-load-safe-path <your-goroot>/src/runtime/runtime-gdb.py

### 常用命令

GDB的一些常用命令如下所示

- list

	简写命令`l`，用来显示源代码，默认显示十行代码，后面可以带上参数显示的具体行，例如：`list 15`，显示十行代码，其中第15行在显示的十行里面的中间，如下所示。

		10	        time.Sleep(2 * time.Second)
		11	        c <- i
		12	    }
		13	    close(c)
		14	}
		15	
		16	func main() {
		17	    msg := "Starting main"
		18	    fmt.Println(msg)
		19	    bus := make(chan int)

- break

	简写命令 `b`,用来设置断点，后面跟上参数设置断点的行数，例如`b 10`在第十行设置断点。
	
- delete
	简写命令 `d`,用来删除断点，后面跟上断点设置的序号，这个序号可以通过`info breakpoints`获取相应的设置的断点序号，如下是显示的设置断点序号。

		Num     Type           Disp Enb Address            What
		2       breakpoint     keep y   0x0000000000400dc3 in main.main at /home/xiemengjun/gdb.go:23
		breakpoint already hit 1 time

- backtrace
	
	简写命令 `bt`,用来打印执行的代码过程，如下所示：

		#0  main.main () at /home/xiemengjun/gdb.go:23
		#1  0x000000000040d61e in runtime.main () at /home/xiemengjun/go/src/pkg/runtime/proc.c:244
		#2  0x000000000040d6c1 in schedunlock () at /home/xiemengjun/go/src/pkg/runtime/proc.c:267
		#3  0x0000000000000000 in ?? ()
	
- info

	info命令用来显示信息，后面有几种参数，我们常用的有如下几种：
		
	- `info locals`

		显示当前执行的程序中的变量值
	- `info breakpoints`

		显示当前设置的断点列表
	- `info goroutines`

		显示当前执行的goroutine列表，如下代码所示,带*的表示当前执行的

			* 1  running runtime.gosched
			* 2  syscall runtime.entersyscall
			  3  waiting runtime.gosched
			  4 runnable runtime.gosched
	
- print

	简写命令`p`，用来打印变量或者其他信息，后面跟上需要打印的变量名，当然还有一些很有用的函数$len()和$cap()，用来返回当前string、slices或者maps的长度和容量。

- whatis 
	
	用来显示当前变量的类型，后面跟上变量名，例如`whatis msg`,显示如下：

		type = struct string
	
- next

	简写命令 `n`,用来单步调试，跳到下一步，当有断点之后，可以输入`n`跳转到下一步继续执行
	
- continue

	简称命令 `c`，用来跳出当前断点处，后面可以跟参数N，跳过多少次断点

- set variable

	该命令用来改变运行过程中的变量值，格式如：`set variable <var>=<value>`







