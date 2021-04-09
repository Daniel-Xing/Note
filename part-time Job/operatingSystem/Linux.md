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



## 进程和线程

- fork 和 clone的实现原理

### 死锁

### 通信

#### 进程间通信

#### 线程间通信

## 网络

### IO模型

[**Linux IO模式及 select、poll、epoll详解**](https://segmentfault.com/a/1190000003063859)

阻塞调用，非阻塞调用，IO模型

[**Linux下的I/O复用与epoll详解**](https://www.cnblogs.com/lojunren/p/3856290.html)

[**select、poll、epoll之间的区别总结**](https://www.cnblogs.com/Anker/p/3265058.html)

select/poll : 每次都会将fd列表拷贝进入内存，内核检查是否有就绪的fd并返回

epoll ： 内核维护一个事件列表，不需要每次copy所有的fd

## Docker

### NameSpace

用作命名空间的隔离，主要隔离进程的pid、网络等等

### Cgroup

用作物理资源的隔离，通过在/sys/fs/cgroup/*下的文件夹内创建文件加，实现对进程的资源隔离

### AUFS

将多个目录mount到一个挂载点下，只对第一个目录具有写权限，对任意只读文件夹下任意一个文件进行写操作，都会将文件copy到最上层。删除只读层文件的时候，在最上层创建.wh文件来隐藏

### 博客

- [docker核心技术和实现原理](https://draveness.me/docker/)

- [理解docker系列](https://www.cnblogs.com/sammyliu/default.html?page=8)

