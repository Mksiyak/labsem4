import collections 
time = 0
startvertex = 0
def dfs(adjlist,src,vis,start,stop,parent):
    vis[src] = 1
    global time
    start[src] = time
    time+=1
    for i in adjlist[src]:
        if(vis[i]==-1):
            print("tree edge",src,i)
            dfs(adjlist,i,vis,start,stop,src)
        elif(vis[i]==1 and stop[i]==-1 and parent!=i):
            print("back edge",src,i)
    time+=1
    stop[src] = time
    print("source",src,"start",start[src],"stop",stop[src])
def main():
    ''' Adjacency List representation. G is a list of lists. '''
    G = [] 
    file=open('input.txt','r')
    for line in file:
        line=line.strip()
        adjacentVertices = []
        first=True
        for node in line.split(' '):
            if first:
                first=False
                continue
            adjacentVertices.append(int(node))
        G.append(adjacentVertices)
    file.close()
    print(G)
    vis = [-1]*6
    start = [-1]*6
    stop = [-1]*6
    src = int(input('enter source vertex : '))
    dfs(G,src,vis,start,stop,-1)
    dq = collections.deque()
    dq.append(src)
    vis[src] = 1
    time = 0
    while(len(dq)!=0):
        start[src] = time
        time+=1
        src = dq.pop()
        for i in G[src]:
            if(vis[i]==-1):
                dq.append(i)
                vis[i]=1
        print(src)
main()