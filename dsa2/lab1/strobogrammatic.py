def getstrobogrammatic(len,l,lis):
	print(len)
	newl = []
	if(len==1):
		for x in lis:
			newl.append(l[1]+x+l[1])
			newl.append(l[2]+x+l[4])
			newl.append(l[3]+x+l[3])
			newl.append(l[4]+x+l[2])
		return newl
	else:
		for x in lis:
			newl.append(l[0]+x+l[0])
			newl.append(l[1]+x+l[1])
			newl.append(l[2]+x+l[4])
			newl.append(l[3]+x+l[3])
			newl.append(l[4]+x+l[2])
		return (getstrobogrammatic(len-1,l,newl))

def main():
    n = int(input('enter size:'))
    arr = []
    l = ['0','1','6','8','9']
    if(n%2==0):
    	print(getstrobogrammatic(n/2,l,['']))
    else:
    	print(getstrobogrammatic((n-1)/2,l,['0','1','8']))
main()