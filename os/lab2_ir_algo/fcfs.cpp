#include<bits/stdc++.h>
using namespace std;
#define deb(x) cout<<#x<<' '<<x<<endl;
int main()
{
	int no_of_process,no_of_total_cycles_used=0;

	cout<<"enter number of processes : ";
	
	cin>>no_of_process;
	
	tuple<int,int,int>t[no_of_process];
	
	for (int i = 0; i < no_of_process; ++i)
	{
	
		int pid,brust_time,arrival_time;
	
		cout<<"enter pid (INT) :";
	
		cin>>pid;
	
		cout<<"enter brust time for pid "<<pid<<" : ";
	
		cin>>brust_time;
		
		cout<<"enter arrival time for pid "<<pid<<" : ";
	
		cin>>arrival_time;
	
		t[i] = make_tuple(arrival_time,brust_time,pid);
	
	}
	
	int total_waiting_time = 0,cycle_timer = 0,total_around_time=0;
	
	sort(t,t+no_of_process);
	
	std::map<int, int> tat,wt;
	
	for (int i = 0; i < no_of_process; ++i)
	{
		cycle_timer=max(cycle_timer,get<0>(t[i]))+get<1>(t[i]);

		// deb(cycle_timer)
	
		tat[get<2>(t[i])] = cycle_timer-get<0>(t[i]);

		total_around_time+=cycle_timer-get<0>(t[i]);
	
		wt[get<2>(t[i])] = cycle_timer-get<0>(t[i])-get<1>(t[i]);
	
		total_waiting_time += wt[get<2>(t[i])];
	
		deb(total_waiting_time);
	
		cout<<"for pid "<<get<2>(t[i])<<"tat is "<<tat[get<2>(t[i])]<<" and waiting time is "<<wt[get<2>(t[i])]<<endl;
	}

	cout<<"avg waiting time is : "<<(double)total_waiting_time/no_of_process<<endl;
	cout<<"avg turn around time is :"<<(double)total_around_time/no_of_process<<endl;
}
/*
5
0 1 3
1 4 1
2 2 4
3 6 0
4 3 2
*/