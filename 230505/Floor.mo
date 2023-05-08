model Floor
  parameter Real Friction_cofficient = 0.8;
  
  Modelica.Blocks.Interfaces.RealOutput Friction_output annotation(
    Placement(visible = true, transformation(origin = {120, -1.77636e-15}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation
  Friction_output = Friction_cofficient;
  
  
annotation(
    uses(Modelica(version = "4.0.0")));
end Floor;
