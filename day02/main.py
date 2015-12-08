import re
Data = list(map(lambda x : sorted(list(map(lambda n: int(n), re.compile('x').split(x)))), open('data.txt', 'r').read().split("\n")))

print('Task 1: %d' % sum(map(lambda l: 3*l[0]*l[1] + 2*l[0]*l[2] + 2*l[1]*l[2], Data)))
print('Task 2: %d' % sum(map(lambda l: 2*l[0]+2*l[1] + l[0]*l[1]*l[2], Data)))