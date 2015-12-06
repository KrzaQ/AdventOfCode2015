data = [0] + list(map(lambda c: 1 if c == '(' else -1 if c == ')' else 0, open('data.txt', 'r').read()))

temp = 0;
for i, v in enumerate(data[1:]):
	data[i+1] = data[i] + v

print('Task 1: %d' % data[-1])
print('Task 1: %d' % data.index(-1))
