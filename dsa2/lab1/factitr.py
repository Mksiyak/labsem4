def main():
    n = int(input('enter a positive number :'))
    fact=1
    for x in range(1,n+1):
        fact*=x
    print('factorial is :',fact)
main()