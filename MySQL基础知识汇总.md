# MySQL查询语句
## 基础查询
语法：

```
select 查询列表 from 表名;
```


特点：
1. 查询的结果集 是一个虚拟表
2. select 查询列表  类似于System.out.println(打印内容);

select后面跟的查询列表，可以有多个部分组成，中间用逗号隔开
例如：select 字段1,字段2,表达式 from 表;

3. 执行顺序

① from子句
② select子句

4. 查询列表可以是：**字段、表达式、常量、函数**等

5. 查询函数（调用函数，获取返回值）

```
SELECT DATABASE();  #查询当前所在数据库
SELECT VERSION();   #查询数据库版本号
SELECT USER();      #查询当前数据库用户名称
```
6. 起别名

①使用as关键字
②使用空格

7. +的作用

**Java中+的作用：**

1、加法运算
	100+1.5      'a'+2    1.3+'2'
	
2、拼接符
	至少有一个操作数为字符串
	"hello"+'a'
	
**mysql中+的作用：**

1、加法运算

①两个操作数都是数值型
100+1.5

②其中一个操作数为字符型
将字符型数据强制转换成数值型,如果无法转换，则直接当做0处理

'张无忌'+100===>100

③其中一个操作数为null

null+null====》null

null+100====》 null

8. distinct的使用

去掉重复的查询结果

9. 查看表结构

```
DESC 表名;
SHOW COLUMNS FROM 表名;
```
## 条件查询
语法：

```
select 查询列表
from  表名
where 筛选条件;
```
执行顺序：

①from子句
②where子句
③select子句

特点：
1. 按关系表达式筛选

关系运算符：

```
>   <    >=   <=     =   <>
补充：<>也可以使用!=,但不建议
```

2. 按逻辑表达式筛选

逻辑运算符：

```
and    or   not
补充：也可以使用&&  ||   !  ，但不建议
```

3. 模糊查询

```
like
in
between and
is null
```
like

```
功能：一般和通配符搭配使用，对字符型数据进行部分匹配查询
常见的通配符：
_ 任意单个字符
% 任意多个字符,支持0-多个
like/not like
```
in

```
功能：查询某字段的值是否属于指定的列表之内

a  in(常量值1,常量值2,常量值3,...)
a not in(常量值1,常量值2,常量值3,...)
in/not in
```
between and

```
功能：判断某个字段的值是否介于xx之间
between and/not between and
```
is null/is not null

对比 =  IS  <=>

```
=		只能判断普通的内容
IS              只能判断NULL值
<=>             安全等于，既能判断普通内容，又能判断NULL值
```

## 排序查询
语法：
```
select 查询列表
from 表名
【where 筛选条件】
order by 排序列表
```
执行顺序

```
①from子句
②where子句
③select子句
④order by 子句
```

特点
```
1. 排序列表可以是单个字段、多个字段、表达式、函数、列数、以及以上的组合
2. 升序 ，通过 asc   ，默认行为
   降序 ，通过 desc
```

## 常见函数
函数：类似于java中学过的“方法”，

为了解决某个问题，将编写的一系列的命令集合封装在一起，对外仅仅暴露方法名，供外部调用

1、自定义方法(函数)

2、调用方法(函数)★
	叫什么  ：函数名
	干什么  ：函数功能

**常见函数**：
```
字符函数
	concat
	substr
	length（str）
	char_length
	upper
	lower
	trim
	left
	right
	lpad
	rpad
	instr
	strcmp
数学函数
	abs
	ceil
	floor
	round
	truncate
	mod
	
日期函数
	now 
	curtime
	curdate
	datediff
	date_format
	str_to_date
	
流程控制函数
	if
	case
```
	
## 分组函数

说明：分组函数往往用于实现将一组数据进行统计计算，最终得到一个值，又称为聚合函数或统计函数

分组函数清单：

```
sum(字段名)：求和
avg(字段名)：求平均数
max(字段名)：求最大值
min(字段名)：求最小值
count(字段名)：计算非空字段值的个数

统计结果集的行数，推荐使用count(*)
搭配distinct实现去重的统计
```
## 分组查询
语法：
```
select 查询列表
from 表名
where 筛选条件
group by 分组列表
having 分组后筛选
order by 排序列表;
```

执行顺序：

```
①from子句
②where子句
③group by 子句
④having子句
⑤select子句
⑥order by子句
```
特点：

```
①查询列表往往是  分组函数和被分组的字段 ★
②分组查询中的筛选分为两类
			筛选的基表	使用的关键词		位置
分组前筛选		原始表		where			group by 的前面

分组后筛选		分组后的结果集  having			group by的后面

where——group by ——having

问题：分组函数做条件只可能放在having后面！！！
```
## 连接查询
说明：又称多表查询，当查询语句涉及到的字段来自于多个表时，就会用到连接查询

笛卡尔乘积现象：表1 有m行，表2有n行，结果=m*n行


```
发生原因：没有有效的连接条件
如何避免：添加有效的连接条件
```


分类：
```
	按年代分类：
	1、sql92标准:仅仅支持内连接
		内连接：
			等值连接
			非等值连接
			自连接
	2、sql99标准【推荐】：支持内连接+外连接（左外和右外）+交叉连接
	
	按功能分类：
		内连接：
			等值连接
			非等值连接
			自连接
		外连接：
			左外连接
			右外连接
			全外连接
		
		交叉连接
```

### 内连接
语法:

```
select 查询列表
from 表1 别名,表2 别名
where 连接条件
and 筛选条件
group by 分组列表
having 分组后筛选
order by 排序列表
```
执行顺序：

```
1、from子句
2、where子句
3、and子句
4、group by子句
5、having子句
6、select子句
7、order by子句
```
### 等值连接

```
① 多表等值连接的结果为多表的交集部分
②n表连接，至少需要n-1个连接条件
③ 多表的顺序没有要求
④一般需要为表起别名
⑤可以搭配前面介绍的所有子句使用，比如排序、分组、筛选
```
①简单连接

案例：查询员工名和部门名

```
SELECT last_name,department_name
FROM departments d 
 JOIN  employees e 
ON e.department_id =d.department_id;
```
②添加筛选条件

案例1：查询部门编号>100的部门名和所在的城市名

```
SELECT department_name,city
FROM departments d
JOIN locations l
ON d.`location_id` = l.`location_id`
WHERE d.`department_id`>100;
```
③添加分组+筛选

案例1：查询每个城市的部门个数

```
SELECT COUNT(*) 部门个数,l.`city`
FROM departments d
JOIN locations l
ON d.`location_id`=l.`location_id`
GROUP BY l.`city`;
```
④添加分组+筛选+排序

案例1：查询部门中员工个数>10的部门名，并按员工个数降序

```
SELECT COUNT(*) 员工个数,d.department_name
FROM employees e
JOIN departments d
ON e.`department_id`=d.`department_id`
GROUP BY d.`department_id`
HAVING 员工个数>10
ORDER BY 员工个数 DESC;
```
### 非等值连接
案例：查询部门编号在10-90之间的员工的工资级别，并按级别进行分组

```
SELECT * FROM sal_grade;

SELECT COUNT(*) 个数,grade
FROM employees e
JOIN sal_grade g
ON e.`salary` BETWEEN g.`min_salary` AND g.`max_salary`
WHERE e.`department_id` BETWEEN 10 AND 90
GROUP BY g.grade;
```
### 自连接
案例：查询员工名和对应的领导名
```
SELECT e.`last_name`,m.`last_name`
FROM employees e
JOIN employees m
ON e.`manager_id`=m.`employee_id`;
```

## 子查询
说明：当一个查询语句中又嵌套了另一个完整的select语句，则被嵌套的select语句称为子查询或内查询

外面的select语句称为主查询或外查询。

分类：


```
按子查询出现的位置进行分类：

1、select后面
	要求：子查询的结果为单行单列（标量子查询）
2、from后面
	要求：子查询的结果可以为多行多列
3、where或having后面 ★
	要求：子查询的结果必须为单列
		单行子查询
		多行子查询
4、exists后面
	要求：子查询结果必须为单列（相关子查询）
```

特点：

```
    1、子查询放在条件中，要求必须放在条件的右侧
	2、子查询一般放在小括号中
	3、子查询的执行优先于主查询
	4、单行子查询对应了 单行操作符：> < >= <= = <>
	   多行子查询对应了 多行操作符：any/some  all in
```

## 多行子查询

```
in:判断某字段是否在指定列表内  
x in(10,30,50)


any/some:判断某字段的值是否满足其中任意一个

x>any(10,30,50)
x>min()

x=any(10,30,50)
x in(10,30,50)


all:判断某字段的值是否满足里面所有的

x >all(10,30,50)
x >max()
```

## 分页查询
应用场景：当页面上的数据，一页显示不全，则需要分页显示

分页查询的sql命令请求数据库服务器——>服务器响应查询到的多条数据——>前台页面



语法：

```
select 查询列表
from 表1 别名
join 表2 别名
on 连接条件
where 筛选条件
group by 分组
having 分组后筛选
order by 排序列表
limit 起始条目索引,显示的条目数
```

执行顺序：

```
1》from子句
2》join子句
3》on子句
4》where子句
5》group by子句
6》having子句
7》select子句
8》order by子句
9》limit子句
```

特点：

```
①起始条目索引如果不写，默认是0
②limit后面支持两个参数
参数1：显示的起始条目索引
参数2：条目数
```


公式：

```
假如要显示的页数是page，每页显示的条目数为size

select *
from employees
limit (page-1)*size,size;

page	    size=10
1           limit 0,10
2			limit 10,10
3			limit 20,10
4			limit 30,10
```
## 联合查询
说明：当查询结果来自于多张表，但多张表之间没有关联，这个时候往往使用联合查询，也称为union查询

语法：

```
select 查询列表 from 表1  where 筛选条件  
	union
select 查询列表 from 表2  where 筛选条件
```

特点：

```
1、多条待联合的查询语句的查询列数必须一致，查询类型、字段意义最好一致
2、union实现去重查询
   union all 实现全部查询，包含重复项
```
## DDL
说明：Data Define Language数据定义语言,用于对数据库和表的管理和操作

库的管理

```
#一、创建数据库
CREATE DATABASE stuDB;
CREATE DATABASE IF NOT EXISTS stuDB;


#二、删除数据库

DROP DATABASE stuDB;

DROP DATABASE IF EXISTS stuDB;
```
表的管理

```
#一、创建表 ★
语法：
CREATE TABLE [IF NOT EXISTS] 表名(
	字段名  字段类型  【字段约束】,
	字段名  字段类型  【字段约束】,
	字段名  字段类型  【字段约束】,
	字段名  字段类型  【字段约束】,
	字段名  字段类型  【字段约束】
	

);


案例：没有添加约束


CREATE TABLE IF NOT EXISTS stuinfo(
	stuid INT ,
	stuname VARCHAR(20),
	stugender CHAR(1),
	email VARCHAR(20),
	borndate DATETIME

);


案例：添加约束
DROP TABLE IF EXISTS stuinfo;
CREATE TABLE IF NOT EXISTS stuinfo(
	stuid INT PRIMARY KEY,#添加了主键约束
	stuname VARCHAR(20) UNIQUE NOT NULL,#添加了唯一约束+非空
	stugender CHAR(1) DEFAULT '男',#添加了默认约束
	email VARCHAR(20) NOT NULL,
	age INT CHECK( age BETWEEN 0 AND 100),#添加了检查约束，mysql不支持
	majorid INT,
	CONSTRAINT fk_stuinfo_major FOREIGN KEY (majorid) REFERENCES major(id)#添加了外键约束

);
```
数据类型

```
1、整型
TINYINT SMALLINT  INT  BIGINT 

2、浮点型
FLOAT(m,n)
DOUBLE(m,n) 
DECIMAL(m,n)
m和n可选



3、字符型

CHAR(n):n可选
VARCHAR(n)：n必选
TEXT
n表示最多字符个数



4、日期型

DATE TIME  DATETIME TIMESTAMP


5、二进制型

BLOB 存储图片数据
```
常见约束

说明：用于限制表中字段的数据的，从而进一步保证数据表的数据是一致的、准确的、可靠的！


```
NOT NULL 非空：用于限制该字段为必填项
DEFAULT 默认：用于限制该字段没有显式插入值，则直接显式默认值
PRIMARY KEY 主键：用于限制该字段值不能重复，设置为主键列的字段默认不能为空
	一个表只能有一个主键，当然可以是组合主键
	
UNIQUE 唯一：用于限制该字段值不能重复
		字段是否可以为空		一个表可以有几个
		
	主键	×				1个
	唯一    √				n个
CHECK检查：用于限制该字段值必须满足指定条件
	CHECK(age BETWEEN 1 AND 100)
	
	
FOREIGN KEY 外键:用于限制两个表的关系,要求外键列的值必须来自于主表的关联列
	要求：
	①主表的关联列和从表的关联列的类型必须一致，意思一样，名称无要求
	②主表的关联列要求必须是主键
```
修改表
语法：

```
ALTER TABLE 表名 ADD|MODIFY|CHANGE|DROP COLUMN 字段名 字段类型 【字段约束】;
```

```
#1.修改表名

ALTER TABLE stuinfo RENAME TO students;

#2.添加字段
ALTER TABLE students ADD COLUMN borndate TIMESTAMP NOT NULL;

DESC students;

#3.修改字段名

ALTER TABLE students CHANGE COLUMN borndate birthday DATETIME NULL;

#4.修改字段类型

ALTER TABLE students MODIFY COLUMN birthday TIMESTAMP ;

#5.删除字段

ALTER TABLE students DROP COLUMN birthday;

DESC students;
```

删除表 
语法：

```
DROP TABLE IF EXISTS students;
```
复制表

```
#仅仅复制表的结构

CREATE TABLE newTable2 LIKE major;

#复制表的结构+数据

CREATE TABLE newTable3 SELECT * FROM girls.`beauty`;


#案例：复制employees表中的last_name,department_id,salary字段到新表 emp表，但不复制数据

CREATE TABLE emp 
SELECT last_name,department_id,salary 
FROM myemployees.`employees`
WHERE 1=2;
```
## DML
说明：DML(Data Manipulation Language)数据操纵语言：insert update delete

对表中的数据的增删改

**数据插入**

语法：

```
插入单行：
	insert into 表名(字段名1,字段名2 ,...) values (值1，值2,...);
插入多行：
	insert into 表名(字段名1,字段名2 ,...) values
	 (值1，值2,...),(值1，值2,...),(值1，值2,...);
```


特点：


```
①字段和值列表一一对应
包含类型、约束等必须匹配

②数值型的值，不用单引号
非数值型的值，必须使用单引号

③字段顺序无要求
```
**数据的修改**
语法：

```
update 表名 set 字段名 = 新值,字段名=新值,...
where 筛选条件;
```

```
#案例1：修改年龄<20的专业编号为3号，且邮箱更改为 xx@qq.com

UPDATE stuinfo SET majorid = 3,email='xx@qq.com'
WHERE age<20;
```
**数据的删除**

```
方式1：delete语句

	语法：delete from 表名 where 筛选条件;
方式2：truncate语句
	语法：truncate table 表名;
```

```
#案例1：删除姓李所有信息

DELETE FROM stuinfo WHERE stuname LIKE '李%';

#案例2：删除表中所有数据
TRUNCATE TABLE stuinfo ;
```
【面试题】delete和truncate的区别

```
1.delete可以添加WHERE条件
  TRUNCATE不能添加WHERE条件，一次性清除所有数据
2.truncate的效率较高
3.如果删除带自增长列的表，
  使用DELETE删除后，重新插入数据，记录从断点处开始
  使用TRUNCATE删除后，重新插入数据，记录从1开始
  
  SELECT * FROM gradeinfo;

  TRUNCATE TABLE gradeinfo;
  
  INSERT INTO gradeinfo(gradename)VALUES('一年级'),('2年级'),('3年级');
  
4.delete 删除数据，会返回受影响的行数
  TRUNCATE删除数据，不返回受影响的行数
  
5.delete删除数据，可以支持事务回滚
  TRUNCATE删除数据，不支持事务回滚
```
## 设置自增长列

```
1、自增长列要求必须设置在一个键上，比如主键或唯一键
2、自增长列要求数据类型为数值型
3、一个表至多有一个自增长列
```

```
CREATE TABLE gradeinfo(
	gradeID INT PRIMARY KEY AUTO_INCREMENT,
	gradeName VARCHAR(20)
);

SELECT * FROM gradeinfo;

INSERT INTO gradeinfo VALUES(NULL,'一年级'),(NULL,'2年级'),(NULL,'3年级');


INSERT INTO gradeinfo(gradename)VALUES('一年级'),('2年级'),('3年级');
```
## 事务
概念：由一条或多条sql语句组成，要么都成功，要么都失败

特性：ACID

	原子性
	一致性
	隔离性
	持久性


分类：

隐式事务：没有明显的开启和结束标记
	比如dml语句的insert、update、delete语句本身就是一条事务
	
	insert into stuinfo values(1,'john','男','ert@dd.com',12);
	
显式事务：具有明显的开启和结束标记

	一般由多条sql语句组成，必须具有明显的开启和结束标记
	
	
	步骤：
	取消隐式事务自动开启的功能
	
	1、开启事务
	2、编写事务需要的sql语句（1条或多条）
		insert into stuinfo values(1,'john','男','ert@dd.com',12);
		insert into stuinfo values(1,'john','男','ert@dd.com',12);
	3、结束事务

```
SHOW VARIABLES LIKE '%auto%'

#演示事务的使用步骤

#1、取消事务自动开启
SET autocommit = 0;

#2、开启事务
START TRANSACTION;

#3、编写事务的sql语句

#将张三丰的钱-5000
UPDATE stuinfo SET balance=balance-5000 WHERE stuid = 1;

#将灭绝的钱+5000
UPDATE stuinfo SET balance=balance+5000 WHERE stuid = 2;


#4、结束事务

#提交
#commit;

#回滚
ROLLBACK;



SELECT * FROM stuinfo;
```
