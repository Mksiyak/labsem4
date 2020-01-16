def main():
    n = int(input('enter size of List :'))
    arr = []
    for x in range(n):
    	arr.append(int(input()))
    for i in range(0,n):
    	for j in range(i,n):
    		if(arr[i]>arr[j]):
    			arr[j],arr[i] = arr[i],arr[j]
    print(arr)
main()