# Python

## 基本语法

### 类型

动态类型，包含类型推断。可以通过类型指示来提高可读性，提示编辑器。

### 流程控制

#### 条件判断

- if

- elif

- else

#### 循环

- for

- while

- range

- continue / break

### 函数定义

- def

##### 装饰器/闭包

Timer装饰器示例：

```python
# 装饰器定义
def measure_time(func):
    """Given a func, Test the run time. Note this functoion
    copy from modern programming language slice of ACSE
    in Imperial college london.
    Parameters
    ------------
    func : the signature of a function.
    Examples
    --------
    Notes
    -----
    see https://github.com/ese-msc-2021/modern-programming-methods for
    further details.
    """

    def closure(*args, **kwargs):
        start = time.time()
        func(*args, **kwargs)
        end = time.time()
        return end - start

    return closure

# 装饰器使用
@measure_time
def gauss_test(matrix, i):
    """record run time for gauss function, using measure_time decorator.
    Parameters
    ------------
    matrix : np.array or list of lists
        'n x n' array
    i : np. array or list of lists
        'm x n' array
    Examples
    --------
    Notes
    -----
    """
    gauss(matrix, i)
```

### 类

- 定义

- 接口

## 性能优化

## 实现原理