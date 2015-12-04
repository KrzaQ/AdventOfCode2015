import hashlib

def Solve(n):
	x = 0
	while True:
		hex = hashlib.md5(('yzbqklnj%d' % x).encode('utf-8')).hexdigest()
		if hex[0:n] == '0' * n:
			return x
		x = x+1

print('Task 1: %d' % Solve(5))
print('Task 2: %d' % Solve(6))