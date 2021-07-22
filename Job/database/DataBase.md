<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

  - [DataBase](#database)
- [原理](#%E5%8E%9F%E7%90%86)
  - [数据库范式](#%E6%95%B0%E6%8D%AE%E5%BA%93%E8%8C%83%E5%BC%8F)
    - [第一范式](#%E7%AC%AC%E4%B8%80%E8%8C%83%E5%BC%8F)
    - [第二范式](#%E7%AC%AC%E4%BA%8C%E8%8C%83%E5%BC%8F)
    - [第三范式](#%E7%AC%AC%E4%B8%89%E8%8C%83%E5%BC%8F)
    - [为什么需要这三个范式](#%E4%B8%BA%E4%BB%80%E4%B9%88%E9%9C%80%E8%A6%81%E8%BF%99%E4%B8%89%E4%B8%AA%E8%8C%83%E5%BC%8F)
- [Mysql](#mysql)
    - [MySQL一次sql查询的执行流程。](#mysql%E4%B8%80%E6%AC%A1sql%E6%9F%A5%E8%AF%A2%E7%9A%84%E6%89%A7%E8%A1%8C%E6%B5%81%E7%A8%8B)
    - [Mysql存储引擎](#mysql%E5%AD%98%E5%82%A8%E5%BC%95%E6%93%8E)
      - [Innodb](#innodb)
      - [MyISAM](#myisam)
      - [Memory](#memory)
    - [mysql索引类型（深度赋智）](#mysql%E7%B4%A2%E5%BC%95%E7%B1%BB%E5%9E%8B%E6%B7%B1%E5%BA%A6%E8%B5%8B%E6%99%BA)
      - [聚集索引和非聚集索引（二级索引）](#%E8%81%9A%E9%9B%86%E7%B4%A2%E5%BC%95%E5%92%8C%E9%9D%9E%E8%81%9A%E9%9B%86%E7%B4%A2%E5%BC%95%E4%BA%8C%E7%BA%A7%E7%B4%A2%E5%BC%95)
    - [mysql Join](#mysql-join)
    - [mysql 如何存储数据](#mysql-%E5%A6%82%E4%BD%95%E5%AD%98%E5%82%A8%E6%95%B0%E6%8D%AE)
    - [mysql事务](#mysql%E4%BA%8B%E5%8A%A1)
    - [ACID](#acid)
      - [原子性](#%E5%8E%9F%E5%AD%90%E6%80%A7)
      - [持久性](#%E6%8C%81%E4%B9%85%E6%80%A7)
      - [隔离性](#%E9%9A%94%E7%A6%BB%E6%80%A7)
        - [**基本概念**](#%E5%9F%BA%E6%9C%AC%E6%A6%82%E5%BF%B5)
        - [**事务隔离级别**](#%E4%BA%8B%E5%8A%A1%E9%9A%94%E7%A6%BB%E7%BA%A7%E5%88%AB)
        - [隔离性的实现](#%E9%9A%94%E7%A6%BB%E6%80%A7%E7%9A%84%E5%AE%9E%E7%8E%B0)
      - [一致性](#%E4%B8%80%E8%87%B4%E6%80%A7)
    - [三大log](#%E4%B8%89%E5%A4%A7log)
      - [BingLog](#binglog)
      - [RedoLog](#redolog)
      - [UndoLog](#undolog)
- [redis](#redis)
  - [基本数据结构及实现](#%E5%9F%BA%E6%9C%AC%E6%95%B0%E6%8D%AE%E7%BB%93%E6%9E%84%E5%8F%8A%E5%AE%9E%E7%8E%B0)
  - [redis key很多](#redis-key%E5%BE%88%E5%A4%9A)
  - [和memcache的区别](#%E5%92%8Cmemcache%E7%9A%84%E5%8C%BA%E5%88%AB)
- [MemCache](#memcache)
- [Hbase](#hbase)
- [面经](#%E9%9D%A2%E7%BB%8F)
  - [mysql](#mysql)
    - [mysql的索引有哪些](#mysql%E7%9A%84%E7%B4%A2%E5%BC%95%E6%9C%89%E5%93%AA%E4%BA%9B)
    - [乐观锁悲观锁](#%E4%B9%90%E8%A7%82%E9%94%81%E6%82%B2%E8%A7%82%E9%94%81)
    - [事务的ACID及实现](#%E4%BA%8B%E5%8A%A1%E7%9A%84acid%E5%8F%8A%E5%AE%9E%E7%8E%B0)
    - [mysql慢查询及其优化](#mysql%E6%85%A2%E6%9F%A5%E8%AF%A2%E5%8F%8A%E5%85%B6%E4%BC%98%E5%8C%96)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

### DataBase

## 原理

### 数据库范式

#### 第一范式

数据表中的每一列(字段)，必须是不可拆分的最小单元，也就是确保每一列的原子性。满足第一范式是关系模式规范化的最低要求，否则，将有很多基本操作在这样的关系模式中实现不了。

#### 第二范式

两列的属性相近或相似或一样，尽量合并属性一样的列，确保不产生冗余数据。

#### 第三范式

满足2NF后，要求：表中的每一列都要与主键直接相关，而不是间接相关（表中的每一列只能依赖于主键）。数据不能存在传递关系，即没个属性都跟主键有直接关系而不是间接关系。像：a-->b-->c  属性之间含有这样的关系，是不符合第三范式的

#### 为什么需要这三个范式

## Mysql

#### MySQL一次sql查询的执行流程。

#### Mysql存储引擎

##### Innodb



##### MyISAM

- 不支持表锁和事务
- 支持全文索引

##### Memory

- 表的数据存放在内存中，因此速度非常快
- 默认使用hash索引而不是b+树
- 只支持表锁，性能比较差

#### mysql索引类型（深度赋智）

##### 聚集索引和非聚集索引（二级索引）

- 块按照主键顺序存放
- 块可能分散，mysql中存储的指向数据的索引

#### mysql Join

Mysql只支持Nested Loop Join，不支持其他数据库提供的Hash Join & sort- Merge Join

因此，在多表进行Join的过程中，对于被驱动表的Join的列建立索引可以有效的优化开销 

#### mysql 如何存储数据

#### mysql事务

#### ACID

##### 原子性

事务要么全部执行，要么全部不执行

实现：通过undo log来实现事务的原子性

##### 持久性

事务一旦提交，数据一定会被写入到数据库并持久的存储下来

通过redo log 来实现

![image-20210411145824647](/Users/xingzheng/Note/part-time Job/img/image-20210411145824647.png)

##### 隔离性

事务和事务之间是相互隔离的，引入事务的隔离级别

**[mysql事务隔离级别和实现原理](https://zhuanlan.zhihu.com/p/117476959)**

###### **基本概念**

**脏读**

脏读指的是读到了其他事务未提交的数据，未提交意味着这些数据可能会回滚，也就是可能最终不会存到数据库中，也就是不存在的数据。读到了并一定最终存在的数据，这就是脏读。

**可重复读**

可重复读指的是在一个事务内，最开始读到的数据和事务结束前的任意时刻读到的同一批数据都是一致的。通常针对数据**更新（UPDATE）**操作。

**不可重复读**

对比可重复读，不可重复读指的是在同一事务内，不同的时刻读到的同一批数据可能是不一样的，可能会受到其他事务的影响，比如其他事务改了这批数据并提交了。通常针对数据**更新（UPDATE）**操作。

**幻读**

幻读是针对数据**插入（INSERT）**操作来说的。假设事务A对某些行的内容作了更改，但是还未提交，此时事务B插入了与事务A更改前的记录相同的记录行，并且在事务A提交之前先提交了，而这时，在事务A中查询，会发现好像刚刚的更改对于某些数据未起作用，但其实是事务B刚插入进来的，让用户感觉很魔幻，感觉出现了幻觉，这就叫幻读。

###### **事务隔离级别**

SQL 标准定义了四种隔离级别，MySQL 全都支持。这四种隔离级别分别是：

1. 读未提交（READ UNCOMMITTED）
2. 读提交 （READ COMMITTED）
3. 可重复读 （REPEATABLE READ）
4. 串行化 （SERIALIZABLE）

从上往下，隔离强度逐渐增强，性能逐渐变差。采用哪种隔离级别要根据系统需求权衡决定，其中，**可重复读**是 MySQL 的默认级别。

事务隔离其实就是为了解决上面提到的脏读、不可重复读、幻读这几个问题，下面展示了 4 种隔离级别对这三个问题的解决程度。

![img](../img/v2-2e1a7203478165890e2d09f36cb39857_1440w.png)

只有串行化的隔离级别解决了全部这 3 个问题，其他的 3 个隔离级别都有缺陷。

###### 隔离性的实现

隔离性的实现主要靠锁来实现

- 解决不可重复读，通过加行锁来解决
- 解决幻读，通过行锁和间隙锁来进行

##### 一致性

如果一个事务原子地在一个一致地数据库中独立运行，那么在它执行之后，数据库的状态一定是一致的。

#### 三大log

##### BingLog

- BingLog 在Mysql数据库上层产生，不仅仅针对于InnoDB
- BingLog是一种逻辑日志，存储的是sql语句
- Binglog是在commit之后一次生成的

##### RedoLog

- redolog是在InnoDB存储引擎层产生的
- 重做日志是物理格式日志，针对的是对每个页的更改
- 写入时间，在事务执行的过程中，默认redolog是周期性的持久化的，表现为对于多个事务来说，redolog不是按顺序存储的

##### UndoLog

undoLog 也是逻辑日志，记录的每个操作的相反的操作。可以通过UndoLog来实现MVCC

## redis

### 基本数据结构及实现

### redis key很多

### 和memcache的区别



## MemCache



## Hbase





## 面经

### mysql

#### mysql的索引有哪些

#### 乐观锁悲观锁

#### 事务的ACID及实现

#### mysql慢查询及其优化

