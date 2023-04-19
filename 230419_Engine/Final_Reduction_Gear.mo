model Final_Reduction_Gear
  parameter Real Gear_ratio = 3.612;
  
  Modelica.Blocks.Interfaces.RealInput RPM_input annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput RPM_output annotation(
    Placement(visible = true, transformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {0, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealInput RPM_input_2 annotation(
    Placement(visible = true, transformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 180), iconTransformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 180)));
equation
  RPM_output = (RPM_input + RPM_input_2)/2*Gear_ratio;
  
annotation(
    uses(Modelica(version = "4.0.0")));
end Final_Reduction_Gear;
