DROP TABLE IF EXISTS employees, departments, dept_emp, manager, salaries, titles;
CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" VARCHAR(30)   NOT NULL,
    "last_name" VARCHAR(30)   NOT NULL,
    "gender" VARCHAR(30)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "manager" (
    "id" serial   NOT NULL,
    "dept_no" VARCHAR(10)   NOT NULL,
    "emp_no" int   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL,
    CONSTRAINT "pk_manager" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "dept_emp" (
    "id" serial   NOT NULL,
    "emp_no" int   NOT NULL,
    "dept_no" VARCHAR(10)   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "departments" (
    "dept_no" VARCHAR(10)   NOT NULL,
    "dept_name" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "salaries" (
    "id" serial   NOT NULL,
    "emp_no" int   NOT NULL,
    "salary" money   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "titles" (
    "id" serial   NOT NULL,
    "emp_no" int   NOT NULL,
    "title" VARCHAR(30)   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "manager" ADD CONSTRAINT "fk_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "manager" ADD CONSTRAINT "fk_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

