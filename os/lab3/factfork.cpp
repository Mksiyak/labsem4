#include<bits/stdc++.h>
#include <stdio.h> 
#include <unistd.h> 
#include <sys/wait.h> 
#include <sys/types.h> 
#include <string.h> 
#include <stdlib.h> 
using namespace std;
int main(int argc ,char *argv[]) 
{ 
	int pipefd[2];
	pid_t pid = fork(); 
	 if ( pid==0 ) 
	{ 
		int ans = 0, i, j, k = 2, n; 
		n = atoi(argv[1]); 
		if(n<0)
		{
			cout<<"not exist"<<endl;
		}
		else{ 
		int ans=1;
		for (i=1 ; i<=n; i++) 
		{ 
			ans*=i; 
		}
		cout<<ans<<endl;
	} 
		exit(0); 
	}
	else
	{ 
		wait(NULL); 
		printf("Done\n"); 
	} 
} 
