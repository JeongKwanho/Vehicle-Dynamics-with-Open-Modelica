model Front_Right_Wheel
  parameter Real Wheel_base = 2.946;
  parameter Real Reartrack = 1.5;
  parameter Real Rad2Deg = 180/3.141592;
  parameter Real Radius = 5;

  Real Right_angle(start = 0);
  Real Right_angle_vel;
  Real Right_angle_acc;
  
  Modelica.Blocks.Interfaces.RealInput Handle_input annotation(
    Placement(visible = true, transformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput RPM_input annotation(
    Placement(visible = true, transformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Angle annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  if (Handle_input > 0) then
// turn Right
    Right_angle = Rad2Deg*atan(Wheel_base/(Radius - Reartrack/2))*Handle_input;
  elseif (Handle_input < 0) then
// turn Left
    Right_angle = Rad2Deg*atan(Wheel_base/(Radius + Reartrack/2))*Handle_input;
  else
    Right_angle = 0;
  end if;
  Right_angle_vel = der(Right_angle);
  Right_angle_acc = der(Right_angle_vel);
  
  Angle = Right_angle;
  
  annotation(
    uses(Modelica(version = "4.0.0")));
end Front_Right_Wheel;
