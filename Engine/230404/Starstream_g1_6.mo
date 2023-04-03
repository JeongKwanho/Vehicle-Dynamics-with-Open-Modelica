model starstream_g1_6
  parameter Real Max_Torque_RPM = 4500;
  parameter Real Max_Power_RPM = 6300;
  parameter Real Max_Torque = 15.7;
  parameter Real Max_power = 123;
  parameter Real Min_Torque = 12;
  parameter Real Max_RPM_Torque = 14;
  parameter Real Min_RPM = 1000;
  
  Real equation_1(start = Min_Torque);
  Real equation_2(start = Max_Torque);
  
  Modelica.Blocks.Interfaces.RealInput RPM_input annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-116, 6}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Engine_Torque annotation(
    Placement(visible = true, transformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {108, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  equation_1 = ((Max_Torque - Min_Torque)/(Max_Torque_RPM - Min_RPM))*(RPM_input - Min_RPM) + Min_Torque;
  equation_2 = ((Max_RPM_Torque - Max_Torque)/(Max_Torque_RPM - Max_Power_RPM))*(RPM_input - Max_Torque_RPM) + Max_Torque;
  
  if (RPM_input <= Max_Torque_RPM) then
    Engine_Torque = equation_1;
  else
    Engine_Torque = equation_2;
  end if
    
annotation(
    uses(Modelica(version = "4.0.0")));
end starstream_g1_6;
