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






## MemCache



## Hbase





## 面经

### mysql

#### mysql的索引有哪些

#### 乐观锁悲观锁

#### 事务的ACID及实现

#### mysql慢查询及其优化

