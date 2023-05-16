model RPM_box
  //gear parameter
  parameter Real first_dan = 4.4;
  parameter Real second_dan = 2.726;
  parameter Real third_dan = 1.834;
  parameter Real forth_dan = 1.392;
  parameter Real fifth_dan = 1;
  parameter Real sixth_dan = 0.774;
  parameter Real back_dan = 3.440;
  parameter Real final_reduction = 3.612;
  
  Real Gear_output;
  
  Modelica.Blocks.Interfaces.RealInput right_RPM annotation(
    Placement(visible = true, transformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 180), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Interfaces.RealInput left_RPM annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput RPM_output annotation(
    Placement(visible = true, transformation(origin = {40, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 90), iconTransformation(origin = {40, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealInput Gear_input annotation(
    Placement(visible = true, transformation(origin = {-40, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-40, 110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  if (Gear_input == 1) then
    Gear_output = first_dan;
  elseif (Gear_input == 2) then
    Gear_output = second_dan;
  elseif (Gear_input == 3) then
    Gear_output = third_dan;
  elseif (Gear_input == 4) then
    Gear_output = forth_dan;
  elseif (Gear_input == 5) then
    Gear_output = fifth_dan;
  elseif (Gear_input == 6) then
    Gear_output = sixth_dan;
  elseif (Gear_input == 7) then
    Gear_output = back_dan;
  else
    Gear_output = 0;
  end if;
  
  RPM_output = ((right_RPM + left_RPM)/2)*Gear_output*final_reduction;
annotation(
    uses(Modelica(version = "4.0.0")));
end RPM_box;
