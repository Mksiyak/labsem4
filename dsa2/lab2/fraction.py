class fraction:
		def __init__(self,num,den):
			self.numerator=num
			self.denominator = den
		def __str__(self):
			return str(self.numerator)+"/"+str(self.denominator)
		def __add__(self,other):
			return fraction(self.numerator*other.denominator+self.denominator*other.numerator,self.denominator*other.denominator).solve()
		def __mul__(self,other):
			return fraction(self.numerator*other.numerator,self.denominator*other.denominator).solve()
		def solve(self):
			i=2
			while(i<=min(self.numerator,self.denominator)):
				if(self.numerator%i==0 and self.denominator%i==0):
					self.numerator/=i
					self.denominator/=i
				else:
					i+=1
			return self
		def __eq__(self,other):
			self = self.solve()
			other = other.solve()
			return (self.numerator==other.numerator) and (self.denominator==other.denominator)
		
def main():
	fra1 = fraction(3,5)
	fra2 = fraction(4,5)
	print(fra1,fra2)
	print(fra1+fra2)
	print(fra1*fra2)
	print(fra1==fra2)
main()