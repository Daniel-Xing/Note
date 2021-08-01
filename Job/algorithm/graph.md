<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [图](#%E5%9B%BE)
  - [图的存储（优点缺点）](#%E5%9B%BE%E7%9A%84%E5%AD%98%E5%82%A8%E4%BC%98%E7%82%B9%E7%BC%BA%E7%82%B9)
    - [邻接矩阵](#%E9%82%BB%E6%8E%A5%E7%9F%A9%E9%98%B5)
    - [邻接表](#%E9%82%BB%E6%8E%A5%E8%A1%A8)
  - [图的遍历算法](#%E5%9B%BE%E7%9A%84%E9%81%8D%E5%8E%86%E7%AE%97%E6%B3%95)
    - [狄杰斯特拉算法](#%E7%8B%84%E6%9D%B0%E6%96%AF%E7%89%B9%E6%8B%89%E7%AE%97%E6%B3%95)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

<!--

 * @Author: xingzheng
 * @Date: 2021-07-18 23:41:53
 * @LastEditTime: 2021-07-18 23:43:45
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /Job/algorithm/graph.md
-->


# 图

## [图的存储（优点缺点](https://oi-wiki.org/graph/save/)


## 图的遍历算法

### 深度优先DFS



### 广度优先BFS

### 狄杰斯特拉算法

1. 初始时，S只包含起点s；U包含除s外的其他顶点，且U中顶点的距离为”起点s到该顶点的距离”[例如，U中顶点v的距离为(s,v)的长度，然后s和v不相邻，则v的距离为∞]。
2. 从U中选出”距离最短的顶点k”，并将顶点k加入到S中；同时，从U中移除顶点k。
3. 更新U中各个顶点到起点s的距离。之所以更新U中顶点的距离，是由于上一步中确定了k是求出最短路径的顶点，从而可以利用k来更新其它顶点的距离；例如，(s,v)的距离可能大于(s,k)+(k,v)的距离。
4. 重复步骤(2)和(3)，直到遍历完所有顶点。

**正确性**

- 对于距离最短的顶点K，路径中不存在未被遍历的节点
- 为什么当前值一定是最短的？对于已经遍历的节点，可能存在条可达的路径，但对于其中的每一个节点来说，都是最短的，在算法运行的过程中，已经进行了n次比较（可达路径）得到的最小值，因此此为当前节点的最小值。



### 弗洛伊德算法



## reference

[1] [oi-wiki-graph](https://oi-wiki.org/graph/save/)
