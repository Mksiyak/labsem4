#include<bits/stdc++.h>
using namespace std;
#define deb(x) cout<<#x<<' '<<x<<endl;

bool sortbysec(const tuple<int, int, int>& a,  
               const tuple<int, int, int>& b) 
{ 
    return (get<1>(a) < get<1>(b)); 
}

bool sortbyth(const tuple<int, int, int>& a,  
              const tuple<int, int, int>& b) 
{ 
    return (get<2>(a) < get<2>(b)); 
} 
int main()
{
	int no_of_process,no_of_total_cycles_used=0;

	cout<<"enter number of processes : ";
	
	cin>>no_of_process;
	
	tuple<int,int,int>t[no_of_process];

	std::map<int, int> originalBt;
	
	for (int i = 0; i < no_of_process; ++i)
	{
	
		int pid,brust_time,arrival_time;
	
		cout<<"enter pid (INT) :";
	
		cin>>pid;
	
		cout<<"enter brust time for pid "<<pid<<" : ";
	
		cin>>brust_time;
		
		cout<<"enter arrival time for pid "<<pid<<" : ";
	
		cin>>arrival_time;
	
		t[i] = make_tuple(brust_time,arrival_time,pid);

		originalBt[pid] = brust_time;
	}
	
	sort(t,t+no_of_process,sortbysec);

	no_of_total_cycles_used=0;
	
	for (int i = 0; i < no_of_process; ++i)
	{
		no_of_total_cycles_used=max(no_of_total_cycles_used,get<0>(t[i]))+get<1>(t[i]);
	}

	int total_waiting_time = 0,cycle_timer = 0;
		
	std::map<int, int> tat,wt;
	
	for (int i = 0; i <= no_of_total_cycles_used+1; ++i)
	{
		sort(t,t+no_of_process);
		
		int j=0;

		while(1)
		{
			if(j<no_of_process and get<0>(t[j])!=0 and get<1>(t[j])<=i)
			{
				get<0>(t[j])--;
				break;
			}
			j++;
		}
		
		if(  get<0>(t[j])==0)
		{
			tat[get<2>(t[j])]=i+1-get<1>(t[j]);

			wt[get<2>(t[j])]=tat[get<2>(t[j])]-originalBt[get<2>(t[j])];

	    	total_waiting_time += wt[get<2>(t[j])];

			cout<<"for pid "<<get<2>(t[j])<<" tat is "<<tat[get<2>(t[j])]<<" and waiting time is "<<wt[get<2>(t[j])]<<endl;
		}
	}

	cout<<"avg waiting time is : "<<(double)total_waiting_time/no_of_process<<endl;
}
