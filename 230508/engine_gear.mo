model engine_gear
  parameter Real Max_Torque_RPM = 4500;
  parameter Real Max_Power_RPM = 6300;
  parameter Real Max_Torque = 15.7;
  parameter Real Max_power = 123;
  parameter Real Min_Torque = 12;
  parameter Real Max_RPM_Torque = 14;
  parameter Real Min_RPM = 1000;
  
  parameter Real first_dan = 4.4;
  parameter Real second_dan = 2.726;
  parameter Real third_dan = 1.834;
  parameter Real forth_dan = 1.392;
  parameter Real fifth_dan = 1;
  parameter Real sixth_dan = 0.774;
  parameter Real back_dan = 3.440;
  
  parameter Real Final_reduction = 3.612;
  
  Real equation_1(start = Min_Torque);
  Real equation_2;
  Real Engine_Torque;
  
  Modelica.Blocks.Interfaces.RealInput Accel_input annotation(
    Placement(visible = true, transformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput RPM_input annotation(
    Placement(visible = true, transformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Torque_output2 annotation(
    Placement(visible = true, transformation(origin = {0, -110}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {0, -110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput Torque_output1 annotation(
    Placement(visible = true, transformation(origin = {0, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 90), iconTransformation(origin = {0, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealInput Gear_input annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  equation_1 = ((Max_Torque - Min_Torque)/(Max_Torque_RPM - Min_RPM))*(RPM_input - Min_RPM) + Min_Torque;
  equation_2 = ((Max_RPM_Torque - Max_Torque)/(Max_Power_RPM - Max_Torque_RPM))*(RPM_input - Max_Torque_RPM) + Max_Torque;
  
  if(RPM_input <= Max_Torque_RPM) then
    Engine_Torque = equation_1*Accel_input;
  elseif((RPM_input < 700) or (RPM_input > 7000)) then
    Engine_Torque = 0;
  else
    Engine_Torque = equation_2*Accel_input;
  end if;
  
  if (Gear_input == 1) then
    Torque_output1 = Final_reduction*first_dan*Engine_Torque/2;
    Torque_output2 = Final_reduction*first_dan*Engine_Torque/2;
  elseif (Gear_input == 2) then
    Torque_output1 = Final_reduction*second_dan*Engine_Torque/2;
    Torque_output2 = Final_reduction*first_dan*Engine_Torque/2;
  elseif (Gear_input == 3) then
    Torque_output1 = Final_reduction*third_dan*Engine_Torque/2;
    Torque_output2 = Final_reduction*first_dan*Engine_Torque/2;
  elseif (Gear_input == 4) then
    Torque_output1 = Final_reduction*forth_dan*Engine_Torque/2;
    Torque_output2 = Final_reduction*first_dan*Engine_Torque/2;
  elseif (Gear_input == 5) then
    Torque_output1 = Final_reduction*fifth_dan*Engine_Torque/2;
    Torque_output2 = Final_reduction*first_dan*Engine_Torque/2;
  elseif (Gear_input == 6) then
    Torque_output1 = Final_reduction*sixth_dan*Engine_Torque/2;
    Torque_output2 = Final_reduction*first_dan*Engine_Torque/2;
  elseif (Gear_input == 7) then
    Torque_output1 = Final_reduction*back_dan*Engine_Torque/2;
    Torque_output2 = Final_reduction*first_dan*Engine_Torque/2;
  else
    Torque_output1 = 0;
    Torque_output2 = 0;
 end if
  
annotation(
    uses(Modelica(version = "4.0.0")));
end engine_gear;
