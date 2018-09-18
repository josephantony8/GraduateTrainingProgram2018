You are given two sets, A and B . 
Your job is to find whether set A is a subset of set B .

If set A is subset of set B , print True.
If set A is not a subset of set B , print False.


c=int(raw_input("Enter the test cases"))
out=[]
li=[]
pri=[]
if c>0 and c<5:
	#print(c)
	for i in range(c):
		j=0
		while j<2:
			inte=[]
			elcount=input("Enter the number of elements")
			el=raw_input("Enter the elemets")
			li=el.split(' ')
			#print(len(li))
			if (elcount==len(li)):
				for k in li:
					if li.count(k)==1:
						inte.append(k)
				#print(inte)
				if (len(li)==len(inte)):
					out.append(li)
					j+=1
				else:
					print("Enter only distinct elements")
					exit()
			else:
				print("Enter correct number of elements")
				exit()
		b=set(out[0]).issubset(set(out[1]))
		pri.append(b)
	for i in pri:
		print(i)
else:
	print("Test case count exceeds the boundary value")
		
		
			

	
