#include <bits/stdc++.h> 
#include <sys/types.h> 
#include <unistd.h> 
using namespace std;
int main() 
{ 
	cout<<"parent pid "<<getpid()<<endl;
	int x = 32876;
    x = fork(); 
    fork();
    if(x<0)cout<<"fork failed"<<endl;
    else cout<<"child proccess id is "<<x<<endl;
    return 0; 
} 