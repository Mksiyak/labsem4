class Node:
    def __init__(self,x):
        self.val = x
        self.parent = self
        self.rank = 0

    def __str__(self):
        return str(self.val)

class DisjointSets: 
    def makeset(self,i):
       node = Node(i)
       return node
    def union(self,node1,node2):
        set1 = self.findset(node2)
        set2 = self.findset(node1)
        if(set1 == set2):
            return False
        if(set1.rank==set2.rank):
            set1.rank+=1
            set2.parent = set1
        elif(set1.rank>set2.rank):
            set2.parent = set1
        else:
            set1.parent = set2
        return True
    def findset(self,node):
        if(node.parent==node):
            return node
        else:
            node.parent =  self.findset(node.parent)
            return node.parent
def main():
    ds = DisjointSets()
    
    nodes = []
    for i in range(10):
        node = ds.makeset(i)
        nodes.append(node)

    ds.union(nodes[0],nodes[1])
    print(ds.findset(nodes[0]))  # Should print 1
    ds.union(nodes[0],nodes[2])
    print(ds.findset(nodes[2]))   # Should print 1
    ''' Add more tests!'''

if __name__ == '__main__':
    main()