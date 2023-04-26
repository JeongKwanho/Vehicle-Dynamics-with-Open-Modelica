model ackermann_steering
  parameter Real Wheel_base = 2.946;
  parameter Real Reartrack = 1.5;
  parameter Real Rad2Deg = 180/3.141592;
  parameter Real Radius = 5;
  
  Real Left_angle(start = 0);
  Real Right_angle(start = 0);

  Modelica.Blocks.Interfaces.RealInput Handle_input annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-98, 22}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));

equation
  if Handle_input > 0 then // turn Right
    Left_angle = Rad2Deg*atan(Wheel_base/(Radius + Reartrack/2)) * Handle_input;
    Right_angle = Rad2Deg*atan(Wheel_base/(Radius - Reartrack/2)) * Handle_input;
  elseif Handle_input < 0 then // turn Left
    Left_angle = Rad2Deg*atan(Wheel_base/(Radius - Reartrack/2)) * Handle_input;
    Right_angle = Rad2Deg*atan(Wheel_base/(Radius + Reartrack/2)) * Handle_input;
  else
    Left_angle = 0;
    Right_angle = 0;
  end if;
  
annotation(
    uses(Modelica(version = "4.0.0")));
end ackermann_steering;
