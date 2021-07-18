# Linux

## 常用命令

### 文件基本属性

![img](https://www.runoob.com/wp-content/uploads/2014/06/file-llls22.jpg)

在 Linux 中第一个字符代表这个文件是目录、文件或链接文件等等。

- 当为 **d** 则是目录
- 当为 **-** 则是文件；
- 若是 **l** 则表示为链接文档(link file)；
- 若是 **b** 则表示为装置文件里面的可供储存的接口设备(可随机存取装置)；
- 若是 **c** 则表示为装置文件里面的串行端口设备，例如键盘、鼠标(一次性读取装置)。

![363003_1227493859FdXT](https://www.runoob.com/wp-content/uploads/2014/06/363003_1227493859FdXT.png)

#### chgrp

语法：

```
chgrp [-R] 属组名 文件名
```

参数选项

- -R：递归更改文件属组，就是在更改某个目录文件的属组时，如果加上-R的参数，那么该目录下的所有文件的属组都会更改。

#### chown

语法：

```sh
chown [–R] 属主名 文件名
chown [-R] 属主名：属组名 文件名
```

进入 /root 目录（~）将install.log的拥有者改为bin这个账号：

```sh
[root@www ~] cd ~
[root@www ~]# chown bin install.log
[root@www ~]# ls -l
-rw-r--r--  1 bin  users 68495 Jun 25 08:53 install.log
```

将install.log的拥有者与群组改回为root：

```sh
[root@www ~]# chown root:root install.log
[root@www ~]# ls -l
-rw-r--r--  1 root root 68495 Jun 25 08:53 install.log
```

####   chmod

各权限的分数对照表如下：

- r:4
- w:2
- x:1

```sh
 chmod [-R] xyz 文件或目录
```

选项与参数：

- xyz : 就是刚刚提到的数字类型的权限属性，为 rwx 属性数值的相加。
- -R : 进行递归(recursive)的持续变更，亦即连同次目录下的所有文件都会变更



### 目录基本操作

#### ls

常用参数

- -l ： list
- -a：所有的文件
- -h：显示文件大小

#### cd

```sh
 cd [相对路径或绝对路径]
```

#### pwd

pwd 是 **Print Working Directory** 的缩写，也就是显示目前所在目录的命令。

```
[root@www ~]# pwd [-P]
```

选项与参数：

- **-P** ：显示出确实的路径，而非使用连结 (link) 路径。

#### mkdir

```
mkdir [-mp] 目录名称
```

选项与参数：

- -m ：配置文件的权限喔！直接配置，不需要看默认权限 (umask) 的脸色～
- -p ：帮助你直接将所需要的目录(包含上一级目录)递归创建起来

#### rmdir

```
 rmdir [-p] 目录名称
```

选项与参数：

- **-p ：**连同上一级『空的』目录也一起删除

#### cp

cp 即拷贝文件和目录。

语法:

```
[root@www ~]# cp [-adfilprsu] 来源档(source) 目标档(destination)
[root@www ~]# cp [options] source1 source2 source3 .... directory
```

选项与参数：

- **-a：**相当於 -pdr 的意思，至於 pdr 请参考下列说明；(常用)
- **-d：**若来源档为连结档的属性(link file)，则复制连结档属性而非文件本身；
- **-f：**为强制(force)的意思，若目标文件已经存在且无法开启，则移除后再尝试一次；
- **-i：**若目标档(destination)已经存在时，在覆盖时会先询问动作的进行(常用)
- **-l：**进行硬式连结(hard link)的连结档创建，而非复制文件本身；
- **-p：**连同文件的属性一起复制过去，而非使用默认属性(备份常用)；
- **-r：**递归持续复制，用於目录的复制行为；(常用)
- **-s：**复制成为符号连结档 (symbolic link)，亦即『捷径』文件；
- **-u：**若 destination 比 source 旧才升级 destination 

#### rm

```
 rm [-fir] 文件或目录
```

选项与参数：

- -f ：就是 force 的意思，忽略不存在的文件，不会出现警告信息；
- -i ：互动模式，在删除前会询问使用者是否动作
- -r ：递归删除啊！最常用在目录的删除了！这是非常危险的选项！！！

#### mv

```
[root@www ~]# mv [-fiu] source destination
[root@www ~]# mv [options] source1 source2 source3 .... directory
```

选项与参数：

- -f ：force 强制的意思，如果目标文件已经存在，不会询问而直接覆盖；
- -i ：若目标文件 (destination) 已经存在时，就会询问是否覆盖！
- -u ：若目标文件已经存在，且 source 比较新，才会升级 (update)

#### ln

**硬连接与软连接**：

![preview](https://pic3.zhimg.com/v2-9abd33350e3bcb401f379752874f9b52_r.jpg)

**补充**：

- 软链接可以跨文件系统而硬链接不可以
- 软链接可以对目录进行链接而硬链接不可以

```sh
 ln [参数][源文件或目录][目标文件或目录]
```

**必要参数**：

- -b 删除，覆盖以前建立的链接
- -d 允许超级用户制作目录的硬链接
- -f 强制执行
- -i 交互模式，文件存在则提示用户是否覆盖
- -n 把符号链接视为一般目录
- -s 软链接(符号链接)
- -v 显示详细的处理过程

### 文件内容查看

Linux系统中使用以下命令来查看文件的内容：

- cat 由第一行开始显示文件内容
- tac 从最后一行开始显示，可以看出 tac 是 cat 的倒着写！
- nl  显示的时候，顺道输出行号！
- more 一页一页的显示文件内容
- less 与 more 类似，但是比 more 更好的是，他可以往前翻页！
- head 只看头几行
- tail 只看尾巴几行

### 网络

#### netstat

```
netstat [-acCeFghilMnNoprstuvVwx][-A<网络类型>][--ip]
```

**参数说明**：

- -a或--all   显示所有连线中的Socket。
- -A<网络类型>或--<网络类型>   列出该网络类型连线中的相关地址。
- -c或--continuous   持续列出网络状态。
- -C或--cache   显示路由器配置的快取信息。
- -e或--extend   显示网络其他相关信息。
- -F或--fib   显示路由缓存。
- -g或--groups   显示多重广播功能群组组员名单。
- -h或--help   在线帮助。
- -i或--interfaces   显示网络界面信息表单。
- -l或--listening   显示监控中的服务器的Socket。
- -M或--masquerade   显示伪装的网络连线。
- -n或--numeric   直接使用IP地址，而不通过域名服务器。
- -N或--netlink或--symbolic   显示网络硬件外围设备的符号连接名称。
- -o或--timers   显示计时器。
- -p或--programs   显示正在使用Socket的程序识别码和程序名称。
- -r或--route   显示Routing Table。
- -s或--statistics   显示网络工作信息统计表。
- -t或--tcp   显示TCP传输协议的连线状况。
- -u或--udp   显示UDP传输协议的连线状况。
- -v或--verbose   显示指令执行过程。
- -V或--version   显示版本信息。
- -w或--raw   显示RAW传输协议的连线状况。
- -x或--unix   此参数的效果和指定"-A unix"参数相同。
- --ip或--inet   此参数的效果和指定"-A inet"参数相同。

### 磁盘管理

#### df

df命令参数功能：检查文件系统的磁盘空间占用情况。可以利用该命令来获取硬盘被占用了多少空间，目前还剩下多少空间等信息。

```sh
df [-ahikHTm] [目录或文件名]
```

选项与参数：

- -a ：列出所有的文件系统，包括系统特有的 /proc 等文件系统；
- -k ：以 KBytes 的容量显示各文件系统；
- -m ：以 MBytes 的容量显示各文件系统；
- -h ：以人们较易阅读的 GBytes, MBytes, KBytes 等格式自行显示；
- -H ：以 M=1000K 取代 M=1024K 的进位方式；
- -T ：显示文件系统类型, 连同该 partition 的 filesystem 名称 (例如 ext3) 也列出；
- -i ：不用硬盘容量，而以 inode 的数量来显示

#### du

Linux du命令也是查看使用空间的，但是与df命令不同的是Linux du命令是对文件和目录磁盘使用的空间的查看，还是和df命令有一些区别的，这里介绍Linux du命令。

```
du [-ahskm] 文件或目录名称
```

选项与参数：

- -a ：列出所有的文件与目录容量，因为默认仅统计目录底下的文件量而已。
- -h ：以人们较易读的容量格式 (G/M) 显示；
- -s ：列出总量而已，而不列出每个各别的目录占用容量；
- -S ：不包括子目录下的总计，与 -s 有点差别。
- -k ：以 KBytes 列出容量显示；
- -m ：以 MBytes 列出容量显示；

#### fdisk

fdisk 是 Linux 的磁盘分区表操作工具。

```
fdisk [-l] 装置名称
```

选项与参数：

- -l ：输出后面接的装置所有的分区内容。若仅有 fdisk -l 时， 则系统将会把整个系统内能够搜寻到的装置的分区均列出来。

#### mkfs

```
mkfs [-t 文件系统格式] 装置文件名
```

选项与参数：

- -t ：可以接文件系统格式，例如 ext3, ext2, vfat 等(系统有支持才会生效)

#### fsck 

fsck（file system check）用来检查和维护不一致的文件系统。

若系统掉电或磁盘发生问题，可利用fsck命令对文件系统进行检查。

语法：

```shell
fsck [-t 文件系统] [-ACay] 装置名称
```

#### mount & umount

Linux 的磁盘挂载使用 `mount` 命令，卸载使用 `umount` 命令。

磁盘挂载语法：

```sh
mount [-t 文件系统] [-L Label名] [-o 额外选项] [-n]  装置文件名  挂载点
```

磁盘卸载命令 `umount` 语法：

```sh
umount [-fn] 装置文件名或挂载点
```

选项与参数：

- -f ：强制卸除！可用在类似网络文件系统 (NFS) 无法读取到的情况下；
- -n ：不升级 /etc/mtab 情况下卸除。

#### 初始化外置磁盘

```sh
fdisk -l // list disks
 
fdisk <disk_ID>  // make a new partion

mkfs.ext4 <disk_ID> // init filesystem
```



### 系统设置

#### cronbtab

设置定时任务

```sh
cronbtab -l // 列出定时任务 

cronbtab -e // 编写定时任务，默认使用vi
EDITOR=vim crontab -e // 指定编辑器为vim，使用export导入环境变量
```

![image-20210303133240816](/Users/xingzheng/Library/Application Support/typora-user-images/image-20210303133240816.png)

## 虚拟内存

#### 概念

#### 为什么要使用虚拟内存

## 进程和线程

### 进程

#### fork

fork 系统调用创建新的进程，有以下几种特点：

- 返回两次：在父进程中返回的是子进程的pid，在子进程中返回的是0，若失败返回-1，并设置erron
- 从内核的的角度说，会在内核进程表项中创建新的项，并且与原进程大部分相同
- 完全拷贝父进程代码和数据，使用写时复制
- 父进程文件描述符在子进程中默认打卡

#### exec

在进程中执行新的程序，替换进程印象。exec下的原代码不会执行

#### 僵尸进程

- 多进程程序中，为了满足父进程对子进程的状态的判断，在子进程退出之后，内核并不立即释放进程表项，此时，子进程处于僵尸状态
- 父进程退出之后，子进程退出之前。父进程异常/退出，子进程仍在执行，此时子进程的父进程被设置为init进程

### 线程

#### 基本概念

linux中目前由NPTL来实现线程，

- 内核线程不是一个进程
- 终止线程、回收线程堆栈等等工作由内核来构成
- 一个进程的线程可以运许在不同的cpu核心上
- 线程的同步由内核来完成，不同进程的线程也可以共享互斥锁



### 区别

[区别](https://www.cnblogs.com/yunleijava/p/11545513.html)

- 进程是资源分配的最小单位，线程是程序执行的最小单位。
- 进程有自己的独立地址空间，每启动一个进程，系统就会为它分配地址空间，建立数据表来维护代码段、堆栈段和数据段，这种操作非常昂贵。而线程是共享进程中的数据的，使用相同的地址空间，因此CPU切换一个线程的花费远比进程要小很多，同时创建一个线程的开销也比进程要小很多。
- 线程之间的通信更方便，同一进程下的线程共享全局变量、静态变量等数据，而进程之间的通信需要以通信的方式（IPC)进行。不过如何处理好同步与互斥是编写多线程程序的难点。
- 但是多进程程序更健壮，多线程程序只要有一个线程死掉，整个进程也死掉了，而一个进程死掉并不会对另外一个进程造成影响，因为进程有自己独立的地址空间。

### 通信

#### 进程

- 管道：本质上是一种特殊的文件，有着固定的大小的缓冲区：普通的管道，父子进程之间通信；有名管道，进程间通信
- 共享内存：共享内存就是映射一段能被其他进程所访问的内存，**这段共享内存由一个进程创建**，但多个进程都可以访问。共享内存是最快的 IPC 方式，它是针对其他进程间通信方式运行效率低而专门设计的。它往往与其他通信机制，如信号量，配合使用，来实现进程间的同步和通信。
- 套接字：套接口也是一种进程间通信机制，与其他通信机制不同的是，它可用于不同设备及其间的进程通信。
- 消息队列：**消息队列是由消息的链表**，存放在内核中并由消息队列标识符标识。消息队列克服了信号传递信息少、管道只能承载无格式字节流以及缓冲区大小受限等缺点。

##### 管道（正常的管道和FIFO）

管道被看作是一种特殊的文件，在已安装的文件系统里面没有相映的文件。可以使用pipe()系统调用来创建新的管道，内核会一个索引节点以及两个文件描述符，第一个可读，第二个可写。

- 由于管道是作为一组vfs对象来实现的，所以不存在磁盘映像，这些文件对象被组织为 *pipefs*的特殊文件系统，也不挂载在系统目录树下。因此，只能通过fork类型的函数将文件描述符传递到子进程中，其他没有血缘关系的进程无法打开。
- 管道的索引节点中的i_pipe字段指向一个pipe_inode_info字段，其中有自己的管道缓冲区（ *事实上是一个单独的页* ）2.6版本的linux中，每个管道可以使用16个管道缓冲区。
  - 这些管道缓冲区可以被看错是一个环形缓冲区，写进程不断向这个大缓冲区追加数据，读进程不断移出数据。当无数据时，读进程会被阻塞，当数据写满时，写进程会被阻塞
- 当所有使用当前管道的进程都调用 *close()* 时，引用计数器归0，调用release() 方法释放资源

**FIFO**

与正常的管道的最主要区别有如下：

- FIFO索引节点是出现在系统目录树上的而不是在特殊文件系统 *pipefs* 中
- FIFO是双向通信通道，可以以读/写模式来打开一个FIFO

##### SystemV IPC

- 通过信号量与其他进程进行同步
- 向其他进程发送消息或从其他进程接收消息
- 和其他进程共享内存区域

IPC资源都是持久的，除非被进程显式的释放，否则永远驻留在内存中。每个IPC资源都有32位IPC标识符，当多个进程需要进程通信的时候，引用相同的标识符。

**多个进程共享IPC**

- 进程之间使用预先定义的IPC关键字，但是可能有其他无关的进程错误的使用了这个
- 指定 *IPC_PRIVATE* 作为IPC关键字，但是需要通过其他的通信方式(*非IPC*)来告知其他需要使用的进程

##### IPC 信号量

本质上说是一个计数器，为多个进程共享的数据结构提供受控访问

IPC信号量比内核信号量更加复杂的原因：

- 是多个信号量的集合
- 提供的时效安全机制，用于取消错误退出进程对于信号量的修改

![image-20210417212520529](/Users/xingzheng/Note/part-time Job/img/image-20210417212520529.png)

- 可取消的信号量操作
- 被挂起的请求队列

##### IPC消息队列

消息由固定大小的首部和可变长度的正文组成，可以使用一个整数数值来标识消息，允许有选择的获取消息，当一个进程从IPC消息队列中获得一个消息，内核就从队列中删除。

![image-20210417212949687](/Users/xingzheng/Note/part-time Job/img/image-20210417212949687.png)

##### IPC共享内存

这种机制允许多个进程将公共数据结构放在共享内存区。如果一个进程要访问这个共享内存区，就必须在自己的地址空间中增加一个新的内存区，他将映射与这个共享内存区相关的页框。

![image-20210417213609099](/Users/xingzheng/Note/part-time Job/img/image-20210417213609099.png)

##### Socket 函数

[参考博客](https://www.cnblogs.com/skynet/archive/2010/12/12/1903949.html)

#### 线程

- 线程共享同一个进程的内存因此主要是控制好并发就好
- 锁：互斥锁，读写锁
- 信号量：

##### POSIX 信号量

##### POSIX 互斥锁

同步对共享变量的访问

##### 条件变量

在线程之间同步共享数据的值，提供了一种线程间通讯机制：当共享数据达到某个值当时候，唤醒等待这个共享数据的线程

### 调度

### 死锁

#### 死锁发生的条件

- 资源互斥：资源在某一时刻只能被一个进程所占用，其他进程不可以使用
- 占用并等待：进程必须占用分配给他的内存，并申请和等待其他资源
- 不可剥夺：资源被某个进程占用的时候，不可以被强制性剥夺出来
- 环路等待：进程和资源分配图中间存在环路

#### 死锁预防

预防的目的在于破坏上述四个条件之一

- 互斥条件难以破除
- 进程在执行之前一次申请完所有的资源，否则便进入等待：效率低
- 第一种方法在进程得不到后续资源时，释放已有资源，并在下一次执行的过程中，一次性申请所有的资源； 第二种是设置优先级，优先级高的进程能够剥夺优先级低的进程的资源
- 对资源进程排序，申请资源必须按照顺序来。：系统效率降低，不必要的资源申请被拒绝。

#### 死锁避免

- 拒绝创建线程：当新的进程申请的各项资源加上其他进程申请的各项资源的总和中，若有一项超过系统对应资源的总和，则拒绝创建线程。
- 拒绝分配资源：判断是否处于安全状态：至少存在一个资源分配序列，使得系统不会处于死锁状态

#### 死锁的检测

#### 死锁的恢复

- 终止所有发生死锁的进程：简单常见
- 设置检查点并回滚：可能会再次陷入死锁
- 依次终止进程，并检测是否存在死锁：终止顺序应该有最小系统开销来决定
- 依次抢占进程资源：按照优先级

#### 生产者消费者

```go
var lenMessage int = 10
func main(){
  ch := make(chan int)
  var wg sync.WaitGroup
  wg.Add(2)
  go producor(&wg, ch)
  go consumer(&wg, ch)
  wg.Wait()
}

func producor(wg *sync.WaitGroup, ch chan int) {
  for i:= 0 ; i< lenMessage ; i ++{
    fmt.Println(i)
    ch <- i
  }
  close(ch)
  wg.Done()
}

func consumer(wg *sync.WaitGroup, ch chan int) {
  for v := range ch {
    fmt.Println("rec:", v)
  }
  wg.Done()
}
```

#### 读写锁的实现 - 读优先 & 写优先

### 锁

TODO：每种锁的优缺点以及应用场景

## 网络

### IO模型

#### 阻塞IO

#### 非阻塞IO

#### IO多路复用

##### select

在一段时间内，监听用户感兴趣的文件描述符上的可读、可写和异常等事件

**API**

```c
#include<sys/select.h>

int select (int nfds, fd_set *readfds, fd_set *writefds, fd_set *exceptfds, struct timeval *timeout);
```

- nfds 描述文件描述符总数
- 后面三个参数描述可读、可写和异常文件描述符
- timeout指定超时时间

**文件描述符就绪状态**

![image-20210419211139783](/Users/xingzheng/Note/part-time Job/img/image-20210419211139783.png)

##### poll

**API**

```c
int poll (struct pollfd *fds, unsigned int nfds, int timeout);
```

**特点**

不同与select使用三个位图来表示三个fdset的方式，poll使用一个 pollfd的指针实现。

```c
struct pollfd {
    int fd; /* file descriptor */
    short events; /* requested events to watch */
    short revents; /* returned events witnessed */
};
```

pollfd结构包含了要监视的event和发生的event，不再使用select“参数-值”传递的方式。同时，pollfd并没有最大数量限制（但是数量过大后性能也是会下降）。 和select函数一样，poll返回后，需要轮询pollfd来获取就绪的描述符。

##### epoll

- epoll 使用一组函数而不是一个函数
- epoll将用户感兴趣的文件描述符的事件放在内核维护的一个事件表内
  - 用户无需每次都将所有的文件描述符传入内核
  - 需要一个单独的文件描述符来描述这个事件表
  - 实现使用红黑树

**API**

```c
int epoll_create(int size)；//创建一个epoll的句柄，size用来告诉内核这个监听的数目一共有多大
int epoll_ctl(int epfd, int op, int fd, struct epoll_event *event)；
int epoll_wait(int epfd, struct epoll_event * events, int maxevents, int timeout);
```

- Epoll_wait 返回就绪的文件描述符个数
  - epoll_wait 如果检测到事件，就将就绪事件从内核事件表拷贝到event指向数组中

**LT & ET 模式**

LT模式下，epoll_wait返回的就绪事件可以不被立即处理，在下次调用时仍然会返回。但是在ET模式下，用户程序必须立即处理，下次调用不会返回。

##### 三者的对比

![image-20210420155739230](/Users/xingzheng/Note/part-time Job/img/image-20210420155739230.png)

##### 参考文献

[**Linux IO模式及 select、poll、epoll详解**](https://segmentfault.com/a/1190000003063859)

[**Linux下的I/O复用与epoll详解**](https://www.cnblogs.com/lojunren/p/3856290.html)

[**select、poll、epoll之间的区别总结**](https://www.cnblogs.com/Anker/p/3265058.html)



## Docker

### 解决的问题

- 后端开发环境与生产环境不一致的问题

### NameSpace

用作命名空间的隔离，主要隔离进程的pid、网络等等

### Cgroup

[cgroup实现原理](https://cloud.tencent.com/developer/article/1684499)

用作物理资源的隔离，通过在/sys/fs/cgroup/*下的文件夹内创建文件加，实现对进程的资源隔离

### AUFS

将多个目录mount到一个挂载点下，只对第一个目录具有写权限，对任意只读文件夹下任意一个文件进行写操作，都会将文件copy到最上层。删除只读层文件的时候，在最上层创建.wh文件来隐藏

### 博客

- [docker核心技术和实现原理](https://draveness.me/docker/)

- [理解docker系列](https://www.cnblogs.com/sammyliu/default.html?page=8)

## 面经

### 进程和线程

#### 进程间的通信方式，线程间的通信方式、具体实现？

#### 死锁的判断和预防

### 网络

### 其他

#### 一个指令从软件到操作系统到硬件执行？整个过程做了哪些？

