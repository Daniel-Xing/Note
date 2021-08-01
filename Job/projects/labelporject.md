<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [推荐项目目录](#%E6%8E%A8%E8%8D%90%E9%A1%B9%E7%9B%AE%E7%9B%AE%E5%BD%95)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# 标注平台

#### 推荐项目目录

```sh
├── src         

│   ├── view/handler/service #入口函数层，api或rpc的入口     

│   ├── biz                #业务逻辑层，核心业务逻辑编写

│   ├── manager            #非必须，如果业务逻辑复杂，可以在biz与facade/repository之间增加一层

│   ├── facade             #外观层，RPC调用的外观

│   │   └── rpc_init.go   #RPC服务的初始化收拢到这里

│   ├── repository         #仓储层，集中管理sql和nosql存储

│   │   ├── dal           #数据库访问层

│   │   ├── cache         #本地缓存层

│   │   ├── redis         #Redis

│   │   ├── abase         #abase

│   │   └── bytesql       #bytesql

│   ├── common             #通用组件

│   │   ├── util          #跟业务无关的util方法

│   │   ├── constant      #常量

│   │   ├── helper        #跟业务有关的util方法

│   │   ├── converter     #转换器，比如DTO与DO之间转换、模板与实例的转换

│   │   └── error         #错误和异常处理

│   ├── model              #模型层

│   │   ├── do            #do

│   │   ├── dto           #dto

│   │   ├── bo            #bo

│   │   ├── vo            #vo

│   │   └── context       #上下文

│   ├── middleware         #中间件层

│   │   ├── mq            #消息队列

│   │   ├── tcc           #tcc配置

│   │   ├── metric        #metric打点

│   │   ├── abtest        #abtest

│   │   └── middleware_init.go #中间件的初始化收拢到这里

│   └── job                #定时任务
```