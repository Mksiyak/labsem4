import heapq
class Node:
    def __init__(self,key):
        self.key =  key
        self.weight = 55555555555555
    def __lt__(self,other):
        return self.weight<other.weight
class graph():
    def __init__(self,adjlist):
        self.adjlist = adjlist
    def djikstra(self,src):
        heap = []
        for i in range(len(self.adjlist)):
            heap.append(Node(i))
        mp = {}
        for i in range(len(heap)):
            mp[i] = heap[i]
        mp[src].weight = 0
        while(len(heap)>0):
            src = heapq.heappop(heap).key
            for i in self.adjlist[src]:
                if(mp[i[0]].weight>mp[src].weight+i[1]):
                    mp[i[0]].weight=mp[src].weight+i[1]
                    heapq.heapify(heap)
            print(src)
        
def main():
    G = []
    file=open('input.txt','r')
    for line in file:
        line=line.strip()
        adjacentVertices = []
        first=True
        for edge in line.split(' '):
            if first:
                first = False
                continue
            node, weight = edge.split(',')
            adjacentVertices.append((int(node),int(weight)))
        G.append(adjacentVertices)
    file.close()
    print(G)
    newgraph = graph(G)
    newgraph.djikstra(0)
main()