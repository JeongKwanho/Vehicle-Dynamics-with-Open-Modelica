model Gear_ratio
  parameter Real first_dan = 4.4;
  parameter Real second_dan = 2.726;
  parameter Real third_dan = 1.834;
  parameter Real forth_dan = 1.392;
  parameter Real fifth_dan = 1;
  parameter Real sixth_dan = 0.774;
  parameter Real back_dan = 3.440;
  
  Modelica.Blocks.Interfaces.RealInput Gear_input annotation(
    Placement(visible = true, transformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {0, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealInput Torque_input annotation(
    Placement(visible = true, transformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Torque_output annotation(
    Placement(visible = true, transformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    
equation
 if (Gear_input == 1) then
  Torque_output = first_dan*Torque_input;
 elseif (Gear_input == 2) then
  Torque_output = second_dan*Torque_input;
 elseif (Gear_input == 3) then
  Torque_output = third_dan*Torque_input;
 elseif (Gear_input == 4) then
  Torque_output = forth_dan*Torque_input;
 elseif (Gear_input == 5) then
  Torque_output = fifth_dan*Torque_input;
 elseif (Gear_input == 6) then
  Torque_output = sixth_dan*Torque_input;
 elseif (Gear_input == 7) then
  Torque_output = back_dan*Torque_input;
 else
  Torque_output = 0;
 end if

annotation(
    uses(Modelica(version = "4.0.0")));
annotation(
    uses(Modelica(version = "4.0.0")));
end Gear_ratio;
