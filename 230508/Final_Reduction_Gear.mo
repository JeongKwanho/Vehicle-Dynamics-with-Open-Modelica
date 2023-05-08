model Final_Reduction_Gear
  parameter Real Gear_ratio = 3.612;
  
  Modelica.Blocks.Interfaces.RealInput Torque_input annotation(
    Placement(visible = true, transformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput Torque_output annotation(
    Placement(visible = true, transformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Torque_output_2 annotation(
    Placement(visible = true, transformation(origin = {-121, -1}, extent = {{-21, -21}, {21, 21}}, rotation = 180), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 180)));
    
equation
  Torque_output = Torque_input*Gear_ratio/2;
  Torque_output_2 = Torque_input*Gear_ratio/2;
  
annotation(
    uses(Modelica(version = "4.0.0")));
end Final_Reduction_Gear;
