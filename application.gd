extends Control

var cal =Calculator.new()

@onready var label_current_number=$PanelContainer/MarginContainer/VBoxContainer/Label_currentnum
@onready var label_result=$PanelContainer/MarginContainer/VBoxContainer/Label_result
func _ready():
	cal.current_number_changed.connect(_on_current_number_changed)
	cal.result_changed.connect(_on_result_changed)
func _on_result_changed():
	label_result.text=cal.result
func _on_current_number_changed():
	label_current_number.text=cal.current_num

func _on_button_pressed() -> void:
	cal.input_number(7)


func _on_button_2_pressed() -> void:
	cal.input_number(8)


func _on_button_3_pressed() -> void:
	cal.input_number(9)


func _on_button_4_pressed() -> void:
	cal.input_number(4)


func _on_button_5_pressed() -> void:
	cal.input_number(5)


func _on_button_6_pressed() -> void:
	cal.input_number(6)


func _on_button_7_pressed() -> void:
	cal.input_number(1)


func _on_button_8_pressed() -> void:
	cal.input_number(2)


func _on_button_9_pressed() -> void:
	cal.input_number(3)


func _on_button_0_pressed() -> void:
	cal.input_number(0)


func _on_buttondivide_pressed() -> void:
	cal.calculate_function("/")
	

func _on_buttonmul_pressed() -> void:
	cal.calculate_function("*")
	

func _on_buttonadd_pressed() -> void:
	cal.calculate_function("+")


func _on_buttonmin_pressed() -> void:
	cal.calculate_function("-")

func _on_buttonequal_pressed() -> void:
	cal.equal()
	label_result.text=cal.result
	label_current_number.text=cal.current_num


func _on_clear_pressed() -> void:
	cal.current_num=""
	cal.num1=""
	cal.num2=""
	label_result.text=cal.result
	label_current_number.text=cal.current_num


func _on_delete_pressed() -> void:
	cal.delete_number()
	label_current_number.text=cal.current_num
