model Handle
  Real Handle_angle(start = 0);

  Modelica.Blocks.Interfaces.RealOutput Handle_output annotation(
    Placement(visible = true, transformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {118, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Human_input annotation(
    Placement(visible = true, transformation(origin = {-122, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-116, 8}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    
equation
  Handle_angle = Human_input;
  
  if (Human_input < -540) then
    Handle_output = -540;
  elseif (Human_input > 540) then
    Handle_output = 540;
  else
    Handle_output = Handle_angle;
  end if
  
annotation(
    uses(Modelica(version = "4.0.0")));
    
end Handle;
