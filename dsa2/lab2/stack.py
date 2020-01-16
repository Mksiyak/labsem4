class stack:
	def __init__(self):
		self.lis = []
	def push(self,val):
		self.lis.append(val)
	def pop(self):
		self.lis.pop()
	def print(self):
		return self.lis
def main():
	st = stack()
	while(1):
		print("1.push","2.pop","3.print",end="\n")
		choice = int(input())
		if(choice==1):
			st.push(int(input()))
		elif(choice==2):
			st.pop()
		if(choice==3):
			print(st.print())
		

main()