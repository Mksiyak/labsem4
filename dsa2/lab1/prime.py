def prime(n):
	for x in range(2,n):
		if(n%x==0):
			return False
	return True
def main():
    n = int(input('enter a number :'))
    print(prime(n))
main()