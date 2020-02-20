import collections
class heap():
    def __init__(self,lst):
        self.hep = [(0,0)]*len(lst)
        self.ref = self.hep
        for i in range(len(lst)):
            self.hep[i][0] = i
            self.hep[i][1] = 1000000000
        
class graph():
    def __init__(self,vertices):
        self.v = vertices
    def djikstra(self,src):
        pass
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
    hp = heap(G)
    print(G)
main()