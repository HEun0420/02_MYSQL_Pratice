-- EMPLOYEE 테이블에서 '해외영업1부'에 속한 모든 직원의 이름, 직급, 급여를 조회하시오.
select
    emp_name,
    job_code,
    salary
from employee
where
     dept_code in (select
        dept_id
    from department
    where
        dept_title = '해외영업1부'
      );

-- EMPLOYEE 테이블에서 모든 직원의 평균 급여보다 높은 급여를 받는 직원의 이름과 급여를 조회하시오.
select
    emp_name,
    salary
from employee
where salary > all
    (select
     avg(salary)
     from employee
         );


-- EMPLOYEE 테이블에서 각 부서의 평균 급여보다 높은 급여를 받는 직원의 이름, 부서명, 급여를 조회하시오.
select
    a.emp_name,
    b.dept_title,
    a.salary
from employee a
inner join department b
on a.dept_code = b.dept_id
where salary > (
    select
        avg(salary)
    from employee
    where dept_code = a.dept_code
    );


-- 상관서브쿼리문제
-- EMPLOYEE 테이블에서 각 부서별로 가장 높은 급여를 받는 직원의 이름, 부서명, 급여를 조회하시오.
select
    a.emp_name,
    b.dept_title,
    a.salary
from employee a
         inner join department b
                    on a.dept_code = b.dept_id
where salary =  (
    select
        max(salary)
from employee
where dept_code =a.dept_code
    );


-- EMPLOYEE 테이블에서 각 직급별 평균 급여보다 높은 급여를 받는 직원의 이름, 직급, 급여를 조회하시오.
select
    a.emp_name,
    b.job_name,
    a.salary
from employee a
inner join job b
on a.job_code = b.job_code
where salary > all(
    select
        avg(salary)
    from employee
    where job_code = a.job_code
);

-- EXISTS 절 문제
-- DEPARTMENT 테이블에서 직원이 있는 부서의 부서명을 조회하시오.
select
    dept_title
from department a
where exists(
    select
        count(*)
    from employee
    where dept_code= a.dept_title
          );

-- EMPLOYEE 테이블에서 급여가 가장 높은 직원의 이름과 급여를 조회하시오. (NOT EXISTS 사용)
select
    emp_name,
    salary
from employee a
where not exists(
    select
      *
    from employee b
    where b.salary > a.salary -- 우리가 뽑을 자
);


-- CTE 문제
-- EMPLOYEE 테이블에서 각 부서별 평균 급여를 계산하고,
-- 평균 급여가 4000000 이상인 부서의 부서명과 평균 급여를 조회하시오.
with menucate as (
    select
        avg(salary),
        b.dept_title
    from employee a
    inner join department b
    on b.dept_id= a.dept_code
    group by dept_title
    having avg(salary) >= 4000000
)
select
    *
from menucate;
