import re

kens = [r'^[a-zA-Z]{2}-[\d]{2}-[\d]{2}$', # 0 XX-99-99
r'^[\d]{2}-[\d]{2}-[a-zA-Z]{2}$', # 1 99-99-XX
r'^[\d]{2}-[a-zA-Z]{2}-[\d]{2}$', # 2 99-XX-99
r'^[a-zA-Z]{2}-[\d]{2}-[a-zA-Z]{2}$', # 3 XX-99-XX
r'^[a-zA-Z]{2}-[a-zA-Z]{2}-[\d]{2}$', # 4 XX-XX-99
r'^[\d]{2}-[a-zA-Z]{2}-[a-zA-Z]{2}$', # 5 99-XX-XX
r'^[\d]{2}-[a-zA-Z]{3}-[\d]{1}$', # 6 99-XXX-9
r'^[\d]{1}-[a-zA-Z]{3}-[\d]{2}$', # 7 9-XXX-99
r'^[a-zA-Z]{2}-[\d]{3}-[a-zA-Z]{1}$', # 8 XX-999-X
r'^[a-zA-Z]{1}-[\d]{3}-[a-zA-Z]{2}$', # 9 X-999-XX
r'^[a-zA-Z]{3}-[\d]{2}-[a-zA-Z]{1}$', # 10 XXX-99-X
r'^[a-zA-Z]{1}-[\d]{2}-[a-zA-Z]{3}$', # 11 X-99-XXX
r'^[\d]{1}-[a-zA-Z]{2}-[\d]{3}$', # 12 9-XX-999
r'^[\d]{3}-[a-zA-Z]{2}-[\d]{1}$', # 13 999-XX-9
r'^C\d[ABFJNST][0-9]{1,3}$',]


line = '21-snz-2'
gotMatch = False
for regex in kens:
    s = re.search(regex,line)
    if s:
         gotMatch = True
         print(line)
         break
