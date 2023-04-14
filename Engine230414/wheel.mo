model wheel
  parameter Real wheel_radius = 0.4572/2;
  parameter Real wheel_mass = 20;
  parameter Real rad2rev = 30/3.141592;
  
  Real Moment_of_Inertia;
  Real alpha;
  Real Wheel_vel;
  
  Modelica.Blocks.Interfaces.RealInput Torque_input annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-122, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput wheel_RPM annotation(
    Placement(visible = true, transformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {119, -1}, extent = {{-19, -19}, {19, 19}}, rotation = 0)));
    
equation
  Moment_of_Inertia = (wheel_mass*(wheel_radius)*(wheel_radius))/2;
  alpha = Torque_input/Moment_of_Inertia;
  der(Wheel_vel) = alpha;
  
  wheel_RPM = Wheel_vel*rad2rev;
  
annotation(
    uses(Modelica(version = "4.0.0")));
end wheel;
