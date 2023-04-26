model Front_Left_Wheel
  parameter Real Wheel_base = 2.946;
  parameter Real Reartrack = 1.5;
  parameter Real Rad2Deg = 180/3.141592;
  parameter Real Radius = 5;
  
  Real Left_angle(start = 0);
  Real Position_x(start = -1.579/2);
  Real Position_y(start = 0);

  Modelica.Blocks.Interfaces.RealInput Vel_input annotation(
    Placement(visible = true, transformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Handle_input annotation(
    Placement(visible = true, transformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  if (Handle_input > 0) then // turn Right
    Left_angle = Rad2Deg*atan(Wheel_base/(Radius + Reartrack/2)) * Handle_input;
  elseif (Handle_input < 0) then // turn Left
    Left_angle = Rad2Deg*atan(Wheel_base/(Radius - Reartrack/2)) * Handle_input;
  else
    Left_angle = 0;
  end if;
  
annotation(
    uses(Modelica(version = "4.0.0")));
end Front_Left_Wheel;
