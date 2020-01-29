#include <bits/stdc++.h> 
#include <unistd.h> 
#include <sys/wait.h> 
#include <sys/types.h> 
#include <string.h> 
#include <stdlib.h>
using namespace std;
int main()
{
	int num,anss=1;
	bool flag = false;
	cout<<"enter number"<<' ';
	cin>>num;
	int * ptr = &num,*ans=&anss;
	bool *fptr = &flag;
    while(!(*fptr))
    {
    	pid_t pid = fork();
    	if(pid != 0)
    	{
    		(*ans)*=(*ptr);
    		(*ptr)--;
    	}
    	else
    	{
    		// wait(0);
    		cout<<(*ans)<<' ';
    		if(*ptr==0){*fptr=true;exit(0);}
    	}
    }
    }