import collections 
time = 0
startvertex = 0
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
main()