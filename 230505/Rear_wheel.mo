model Rear_Wheel
  parameter Real pi = 3.141592;
  parameter Real wheel_radius = 0.4572/2; //m
  parameter Real wheel_mass = 382.343;
  parameter Real rad2rev = 30/pi;
  parameter Real tire_width = 0.235; //m
  parameter Real tire_natural = 0.4;
  parameter Real g = 9.81;
  
  Real Moment_of_Inertia;
  Real Angle_acc;
  Real Wheel_vel(start=0);
  
  Modelica.Blocks.Interfaces.RealInput Torque_input annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Traction_Force annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Velocity(start = 0) annotation(
    Placement(visible = true, transformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput RPM_output annotation(
    Placement(visible = true, transformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  Moment_of_Inertia = (wheel_mass*wheel_radius*wheel_radius)/2;
  Angle_acc = Torque_input/Moment_of_Inertia;
  der(Wheel_vel) = Angle_acc;
  
  RPM_output = Wheel_vel*rad2rev;
  
  Traction_Force = Torque_input/wheel_radius;
  
  Velocity = 2*pi*wheel_radius*RPM_output;
  
annotation(
    uses(Modelica(version = "4.0.0")));
end Rear_Wheel;
