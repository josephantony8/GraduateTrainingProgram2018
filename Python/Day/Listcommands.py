Consider a list (list = []). You can perform the following commands:

insert i e: Insert integer e at position i.
print: Print the list.
remove e: Delete the first occurrence of integer e.
append e: Insert integer e at the end of the list.
sort: Sort the list.
pop: Pop the last element from the list.
reverse: Reverse the list.

Initialize your list and read in the value of  followed by  lines of commands where each command will be of the 7 types listed above.
Iterate through each command in order and perform the corresponding operation on your list.

comlist=[]
comcount=int(raw_input("Enter the number of commands"))
for i in range(comcount):
	cmd=raw_input("enter the  command and values")
	ins=cmd.split(' ')
	if(ins[0]=='insert'):
		try:
			if(ins[1].isdigit()==True and ins[2].isdigit()==True and len(ins)==3):
				comlist.insert(int(ins[1]),int(ins[2]))
			else:
				print("Enter proper integer values")
		except Exception as error:
			print(error)
	elif(ins[0]=='print'):
		print(comlist)
	elif(ins[0]=='remove' and len(ins)==2):
		try:
			comlist.remove(int(ins[1]))
		except Exception as error:
			print(error)
	elif(ins[0]=='append' ):
		if(ins[1].isdigit()==True and len(ins)==2):
			comlist.append(int(ins[1]))
		else:
			print("Enter proper integer values")
	elif(ins[0]=='sort'):
		if(len(ins)==1):
			comlist.sort()
		else:
			comlist.sort()
			print("Sort doesn't need any arguments")
	elif(ins[0]=='pop'):
		try:
			if(len(ins)==1 and ins[1].isdigit()==True):
				comlist.pop()
			elif(len(ins)==2 and ins[1].isdigit()==True):
				comlist.pop(int(ins[1]))
			elif(len(ins)>2):
				comlist.pop(int(ins[1]),int(ins[2]))
		except Exception as error:
			print(error)
	elif(ins[0]=='reverse'):
		if(len(ins)==1):
			comlist.reverse()
		else:
			comlist.sort()
			print("reverse doesn't need any arguments")
		
