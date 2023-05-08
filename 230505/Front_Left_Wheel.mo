model Front_Left_Wheel
  parameter Real Wheel_base = 2.946;
  parameter Real Reartrack = 1.5;
  parameter Real Rad2Deg = 180/3.141592;
  parameter Real Radius = 5;
  parameter Real Wheel_mass = 317.657;
  parameter Real g = 9.81;
  
  Real Left_angle(start = 0);
  
  Modelica.Blocks.Interfaces.RealInput Handle_input annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Angle_output annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  if (Handle_input > 0) then
// turn Right
    Left_angle = Rad2Deg*atan(Wheel_base/(Radius + Reartrack/2))*Handle_input;
  elseif (Handle_input < 0) then
// turn Left
    Left_angle = Rad2Deg*atan(Wheel_base/(Radius - Reartrack/2))*Handle_input;
  else
    Left_angle = 0;
  end if;
  
  Angle_output = Left_angle;
  annotation(
    uses(Modelica(version = "4.0.0")));
end Front_Left_Wheel;
