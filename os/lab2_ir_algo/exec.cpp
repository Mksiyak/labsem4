#include <bits/stdc++.h> 
#include <sys/types.h> 
#include <unistd.h> 
using namespace std;
int main() 
{ 
	cout<<"parent pid "<<getpid()<<endl;
	
	char * argv_list[] = {"ls","-lart","/home",NULL}; 
  
      // the execv() only return if error occured. 
      // The return value is -1 
      execv("ls",argv_list); 
    return 0; 
} 