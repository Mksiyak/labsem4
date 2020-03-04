import heapq
class graph:
    def __init__(self,g,ln):
        self.Graph = g
        self.vis = [False]*ln
        self.heap = []
    def primes(self,src):
        self.vis[src] = True
        for adj in self.Graph[src]:
            if(not self.vis[adj[0]]):
                heapq.heappush(self.heap,(adj[1],adj[0],src))
        while(len(self.heap)>0):
            tup = heapq.heappop(self.heap)
            if(not self.vis[tup[1]]):
                print(tup[2],tup[1],tup[0],sep="  ")
                self.primes(tup[1])
def main():
    G = []
    len = 0
    file = open("input.txt","r")
    for line in file:
        line = line.strip()
        adjcentvertices = []
        first = True
        for edge in line.split(' '):
            if first:
                first = False
                continue
            node,weight =  edge.split(',')
            adjcentvertices.append((int(node),int(weight)))
        G.append(adjcentvertices)
        len+=1
    file.close()
    pm = graph(G,len)
    pm.primes(0)
main()