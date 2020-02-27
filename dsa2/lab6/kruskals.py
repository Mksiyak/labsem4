from disjointsets import Node,DisjointSets
from heapq import heappop, heappush, heapify 
def main():
    heap = []
    length = 0
    file=open('input.txt','r')
    for line in file:
        line=line.strip()
        length+=1
        first=True
        i = 0
        for edge in line.split(' '):
            if first:
                first=False
                continue
            node,weight =  edge.split(',')
            heap.append((int(weight),int(node),i))
            print(i,node,weight)
            i+=1
    file.close()

    ds = DisjointSets()
    
    nodes = []

    for i in range(length):
        node = ds.makeset(i)
        nodes.append(node)
    
    heap.sort()
    ans = 0
    for edgetuple in heap:
        weight = edgetuple[0]
        node0 = nodes[edgetuple[1]]
        node1 = nodes[edgetuple[2]]
        if(ds.union(node0,node1)):
            ans+=weight
            print(edgetuple[1],edgetuple[2],weight)
    print(ans)
if __name__ == '__main__':
    main()
    