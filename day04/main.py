import hashlib

def Solve(n):
	for x in range(1, 999999999999):
		hex = hashlib.md5(('yzbqklnj%d' % x).encode('utf-8')).hexdigest()
		if hex[0:n] == '0' * n:
			return x

print('Task 1: %d' % Solve(5))
print('Task 2: %d' % Solve(6))