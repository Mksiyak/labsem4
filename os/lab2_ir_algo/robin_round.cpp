#include<bits/stdc++.h>
using namespace std;
#define deb(x) cout<<#x<<' '<<x<<endl;
int main()
{
	int no_of_process,no_of_total_cycles_used=0,robine_time;

	cout<<"enter number of processes : ";
	
	cin>>no_of_process;
	
	tuple<int,int,int>t[no_of_process];

	cout<<"enter time";

	cin>>robine_time;
	
	map<int,int>original_brust_time;

	for (int i = 0; i < no_of_process; ++i)
	{
	
		int pid,brust_time,arrival_time;
	
		cout<<"enter pid (INT) :";
	
		cin>>pid;
	
		cout<<"enter brust time for pid "<<pid<<" : ";
	
		cin>>brust_time;
		
		cout<<"enter arrival time for pid "<<pid<<" : ";
	
		cin>>arrival_time;
	
		t[i] = make_tuple(arrival_time,pid,brust_time);

		original_brust_time[pid] = brust_time;
	
	}
	
	int total_waiting_time = 0,cycle_timer = 0;
	
	sort(t,t+no_of_process);
	
	std::map<int, int> tat,wt;
	
	int itr = 0,clock=0;

	queue<tuple<int,int,int>>robine_que;
	while(1)
	{
		int cycle_time = robine_time;
		while(itr<no_of_process and cycle_timer >=get<1>(t[itr]))
		{
			robine_que.push(t[itr]);
			itr++;
		}
		if(robine_que.size()==0 and itr >= no_of_process)break;
		while(robine_que.size()!=0 and get<2>(robine_que.front())<=cycle_time)
		{
			cycle_timer += get<2>(robine_que.front());
			// deb(cycle_timer)
			int tat = cycle_timer-get<0>(robine_que.front());
			int wt = tat - original_brust_time[get<1>(robine_que.front())];
			total_waiting_time+=wt;
		    cout<<"for pid "<<get<1>(robine_que.front())<<"tat is "<<tat<<" and waiting time is "<<wt<<endl;
		    cycle_time -= get<2>(robine_que.front());
		    robine_que.pop();
		}
		if(cycle_time>0)
		{
			auto temp = robine_que.front();
			robine_que.pop();
			get<2>(temp)-=cycle_time;
			robine_que.push(temp);
			cycle_timer+=cycle_time;
		}
	}
	cout<<"\n\naverage waiting time : "<<(double)total_waiting_time/no_of_process<<endl;
}
/*
5
10
0 10 0
1 29 1
2 3 2
3 7 3
4 12 4
*/