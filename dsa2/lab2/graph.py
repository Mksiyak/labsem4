def main():
	 print("Enter the number of vertices: ")
	 verticese = int(input())
	 print("Enter the number of edges: ")
	 edges = int(input())
	 adj_mat = [[0]*verticese]*verticese
	 adj_lis = [[]]*verticese
	 i=0
	 while(i<edges):
	 	a,b = input().split(' ')
	 	print(a,b)
	 	a = int(a)
	 	b = int(b)
	 	adj_mat[a][b]=1
	 	adj_mat[b][a]=1
	 	adj_lis[a].append(b)
	 	adj_lis[b].append(a)
	 	i+=1
	 print(adj_mat)
main()