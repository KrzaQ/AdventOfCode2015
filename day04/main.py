import hashlib

def Solve(n, x = 0):
	while not hashlib.md5(('yzbqklnj%d' % x).encode('utf-8')).hexdigest().startswith('0' * n):
		x += 1
	return x

print('Task 1: %d' % Solve(5))
print('Task 2: %d' % Solve(6))