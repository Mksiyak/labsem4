def fib(n):
	if(n==0 or n==1):
		return 1
	else:
		return fib(n-2)+fib(n-1)
def main():
    n = int(input('enter a positive number :'))
    print(n,'th fibbonassi number is :',fib(n))
main()