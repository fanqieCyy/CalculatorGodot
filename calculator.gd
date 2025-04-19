class_name Calculator extends RefCounted
var result:String=""
var num1:String=""
var num2:String=""
var sign:String=""
var current_num:String=""
var new_number:=true
signal current_number_changed
signal result_changed
func _init():
	pass

func input_number(value:int):
	if new_number:
		current_num=""
		new_number=false
	current_num+=str(value) #输入的数值作为字符串
	current_number_changed.emit()
func delete_number():
	if current_num=="":
		current_num=""
	else:
		current_num=current_num.substr(0,current_num.length()-1)
	
func calculate_function(_sign:String):
	new_number=true
	if not num1:
		num1=current_num
		sign=_sign
		get_result()
		current_number_changed.emit()
		result_changed.emit()
		return
	var res_num=calculate()
	sign=_sign
	num1=res_num
	current_num=res_num
	get_result()
	current_number_changed.emit()
	result_changed.emit()
	
func add():
	calculate_function("+")
func sub():
	calculate_function("-")
func mul():
	calculate_function("*")
func div():
	calculate_function("/")
func equal():
	if not current_num:
		return
	if not num1:
		num1=current_num
		return
	if not num2:
		num2=current_num
	var res_num= calculate()
	current_num=res_num
	new_number=true
	get_result()
	num2=""
	num1=current_num
func get_result():
	result=num1+sign#计算的形式过程
	if num2:
		result+=num2+"="
func calculate():#计算结果
	var res_num
	if sign=="+":
		res_num=float(num1)+float(num2)
	elif sign=="-":
		res_num=float(num1)-float(num2)
	elif sign=="*":
		res_num=float(num1)*float(num2)
	elif sign=="/":
		res_num=float(num1)/float(num2)
	return str(res_num)
	
		
	
