model Handle_Gear
  parameter Real Rack_Length = 0.6;
  parameter Real change_graph = 0.13/540;
  
  Modelica.Blocks.Interfaces.RealInput Handle_input annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-126, 6}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Gear_output annotation(
    Placement(visible = true, transformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    
equation
  Gear_output = change_graph*Handle_input;
  
annotation(
    uses(Modelica(version = "4.0.0")));
end Handle_Gear;
