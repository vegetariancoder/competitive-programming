emp_list=[('Ankit',10000),('Rahul',12000),('Sumit',14000),('Dheeraj',21000),('Pavan',11000),('Mohit',13000)]




answer = [x for x in emp_list if x[1]>sum([x[1] for x in emp_list])/len([x[1] for x in emp_list])]
print(answer)