def main():
    n = int(input('enter a positive number :'))
    fib = [1,1]
    for i in range(2,n+1):
        fib.append(fib[i-2]+fib[i-1])
    print(n,'th fibbonassi number is :',fib[n])
main()