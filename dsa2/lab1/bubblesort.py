def main():
    n = int(input('enter size of List :'))
    arr = []
    for x in range(n):
    	arr.append(int(input()))
    for i in range(0,n):
    	for j in range(1,n-i):
    		if(arr[j]<arr[j-1]):
    			arr[j],arr[j-1] = arr[j-1],arr[j]
    print(arr)
main()