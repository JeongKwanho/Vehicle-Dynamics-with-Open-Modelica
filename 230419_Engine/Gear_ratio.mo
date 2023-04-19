model Gear_ratio
  parameter Real first_dan = 4.4;
  parameter Real second_dan = 2.726;
  parameter Real third_dan = 1.834;
  parameter Real forth_dan = 1.392;
  parameter Real fifth_dan = 1;
  parameter Real sixth_dan = 0.774;
  parameter Real back_dan = 3.440;
  
  Modelica.Blocks.Interfaces.RealOutput RPM_output annotation(
    Placement(visible = true, transformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput RPM_input annotation(
    Placement(visible = true, transformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {0, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealInput Gear_input annotation(
    Placement(visible = true, transformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
    
equation
 if (Gear_input == 1) then
  RPM_output = first_dan*RPM_input;
 elseif (Gear_input == 2) then
  RPM_output = second_dan*RPM_input;
 elseif (Gear_input == 3) then
  RPM_output = third_dan*RPM_input;
 elseif (Gear_input == 4) then
  RPM_output = forth_dan*RPM_input;
 elseif (Gear_input == 5) then
  RPM_output = fifth_dan*RPM_input;
 elseif (Gear_input == 6) then
  RPM_output = sixth_dan*RPM_input;
 elseif (Gear_input == 7) then
  RPM_output = back_dan*RPM_input;
 else
  RPM_output = 0;
 end if

annotation(
    uses(Modelica(version = "4.0.0")));
end Gear_ratio;
