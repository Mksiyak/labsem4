#include<iostream>
#include<vector>
#include<cstring>
#include<stack>
#include<cstdio>
 
#define max 1000
#define INF 100000000
using namespace std;
 
vector<int> adj[max];
int s[max],f[max],nodes[max];
int time_count,n,e;
char visited[max];
stack<int> st;
int tim,m=0;
 
void createAdjecenyList(int u,int v){
     adj[u].push_back(v);
       adj[v].push_back(u);
}
 
void print_st(stack<int> ps){
 while(!ps.empty()){
  printf("%d  ",ps.top());
  ps.pop();
 }
 printf("\n");
}
 
void printnodes(){
 int i;
 for(i=1;i<=n;i++)
  printf("node: %d   st_time: %d   end_time: %d\n",i,s[i],f[i]);
}
 
void dfs(int v){
//     int u,i,count;
	 tim = 0;
	 st.push(v);
     s[v] = tim++;
	 visited[v]=1;
	 while(!st.empty()) {
		printf("Printing stack: "); print_st(st);
		int u = st.top(); st.pop();
		f[u] = tim++;
//		nodes[m++]=u;
		for( int i=0; i<adj[u].size(); i++)
			if( !visited[adj[u][i]] ) {
				st.push(adj[u][i]);
                s[adj[u][i]] = tim++;
				visited[adj[u][i]] = 1;
			}
	}
} 
int main(){
    int u,v,i;
    memset(visited,0,sizeof(visited));  // 0  is for new node and 1 is for visited node
    scanf("%d",&n);  // number of nodes
    scanf("%d",&e); // number of edges
    while(e--) {
       scanf("%d %d",&u,&v);
       createAdjecenyList(u,v);
    }
    dfs(1);
    printnodes();
    cout<<endl;
    return 0;
}