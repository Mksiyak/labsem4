def main():
    str1,str2,str3 = input('enter strings : ').split(' ')
    print(str1,str2,str3)
    ans = ''
    for i in range(0,len(str1)):
    	if(len(str1)-i>=len(str2) and str1[i:i+len(str2)]==str2):
    		ans=ans+str3
    		i=i+len(str2)
    	else:
    		ans=ans+str1[i]
    print(ans)
main()