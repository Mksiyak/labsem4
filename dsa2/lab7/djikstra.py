import heapq
class graph():
    def __init__(self,vertices,ln):
        self.Graph = vertices
        self.vis = [False]*ln
        self.heap = []
    def djikstra(self,src):
        self.vis[src] = True
        for adj in self.Graph[src]:
            if(not self.vis[adj[0]]):
                heapq.heappush(self.heap,(adj[1],adj[0]))
        while(len(self.heap)>0):
            tup = heapq.heappop(self.heap)
            if(not self.vis[tup[1]]):
                print(tup[1],tup[0],sep="  ")
                self.djikstra(tup[1])
def main():
    G = []
    file=open('input.txt','r')
    for line in file:
        line=line.strip()
        adjacentVertices = []
        first=True
        for edge in line.split(' '):
            if first:
                first=False
                continue
            node,weight =  edge.split(',')
            adjacentVertices.append((int(node),int(weight)))
        G.append(adjacentVertices)
    file.close()
    dj = graph(G)
    print(G)
main()