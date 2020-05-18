# 练习一（基本SELECT语句的使用）
# 1.  下面的语句是否可以执行成功
select last_name , job_id , salary as sal
from employees;
# 2.  下面的语句是否可以执行成功
select * from employees;
# 3.  找出下面语句中的错误
select employee_id , last_name,
salary * 12 "ANNUAL SALARY" from employees;
from employees;
# 4.  显示表 departments 的结构，并查询其中的全部数据

# 5.  显示出表 employees 中的全部 job_id（不能重复）

# 6.  显示出表 employees 的全部列，各个列之间用逗号连接，列头显示成 OUT_PUT


#练习二（过滤数据）
# 1.  查询工资大于 12000 的员工姓名和工资

# 2.  查询员工号为 176 的员工的姓名和部门号和年薪

# 3.  选择工资不在 5000 到 12000 的员工的姓名和工资

# 4.  选择在 20 或 50 号部门工作的员工姓名和部门号

# 5.  选择公司中没有管理者的员工姓名及 job_id

# 6.  选择公司中有奖金的员工姓名，工资和奖金级别

# 7.  选择员工姓名的第三个字母是 a 的员工姓名

# 8.  选择姓名中有字母 a 和 e 的员工姓名

# 9.  显示出表 employees 表中 first_name 以 'e'结尾的员工信息

# 10. 显示出表 employees 部门编号在 80-100 之间 的姓名、职位

# 11. 显示出表 employees 的 manager_id 是 100,101,110 的员工姓名、职位




# 练习三（排序数据）
# 1.  查询员工的姓名和部门号和年薪，按年薪降序 按姓名升序

# 2.  选择工资不在 8000 到 17000 的员工的姓名和工资，按工资降序

# 3.  查询邮箱中包含 e 的员工信息，并先按邮箱的字节数降序，再按部门号升序

