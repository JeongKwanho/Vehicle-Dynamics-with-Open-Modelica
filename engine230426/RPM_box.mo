model RPM_box
  parameter Real first_dan = 4.4;
  parameter Real second_dan = 2.726;
  parameter Real third_dan = 1.834;
  parameter Real forth_dan = 1.392;
  parameter Real fifth_dan = 1;
  parameter Real sixth_dan = 0.774;
  parameter Real back_dan = 3.440;
  parameter Real Gear_ratio = 3.612;
  
  Real sum_RPM;
  
  Modelica.Blocks.Interfaces.RealInput RPM_input_1 annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput RPM_input_2 annotation(
    Placement(visible = true, transformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 180), iconTransformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 180)));
  Modelica.Blocks.Interfaces.RealOutput RPM_output annotation(
    Placement(visible = true, transformation(origin = {0, -120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, -120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput Gear_input annotation(
    Placement(visible = true, transformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
equation
  sum_RPM = (RPM_input_1 + RPM_input_2)/2;
  
  if (Gear_input == 1) then
    RPM_output = first_dan*sum_RPM;
  elseif (Gear_input == 2) then
    RPM_output = second_dan*sum_RPM;
  elseif (Gear_input == 3) then
    RPM_output = third_dan*sum_RPM;
  elseif (Gear_input == 4) then
    RPM_output = forth_dan*sum_RPM;
  elseif (Gear_input == 5) then
    RPM_output = fifth_dan*sum_RPM;
  elseif (Gear_input == 6) then
    RPM_output = sixth_dan*sum_RPM;
  elseif (Gear_input == 7) then
    RPM_output = back_dan*sum_RPM;
  else
    RPM_output = 0;
  end if
 
annotation(
    uses(Modelica(version = "4.0.0")));
annotation(
    uses(Modelica(version = "4.0.0")));
end RPM_box;
