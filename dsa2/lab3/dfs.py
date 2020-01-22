import collections 

def dfs(adjlist,src,vis):
    vis[src] = True
    print(src)
    for i in adjlist[src]:
        if(vis[i]==False):
            dfs(adjlist,i,vis)
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
    vis = []
    dist = []
    for i in range(6):
        vis.append(False)
    src = int(input('enter source vertex : '))
    dfs(G,src,vis)
main()