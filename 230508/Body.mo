model Body
  parameter Real pi = 3.141592;
  parameter Real wheel_radius = 0.4572/2; //m
  parameter Real rad2rev = 30/pi;
  
  parameter Real Vehicle_mass = 1400;
  parameter Real Dxf = 1.100;
  parameter Real Dxr = 1.324;
  parameter Real Cf = 130000;
  parameter Real Cr = 130000;
  parameter Real Iz = 1200;
  //parameter Real Friction_Force = (317.567*9.81*2 + 382.343*9.81*2)*0.8;
  
  Real Drag_Force;
  Real Velocity;
  Real Vx;
  Real Vy;
  Real Wz;
  Real Ax;
  Real Ay;
  Real Wz_dot;
  Real angle;
  //Real Vehicle_vel;
  
  Modelica.Blocks.Interfaces.RealInput Traction_Force annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Traction_Force2 annotation(
    Placement(visible = true, transformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 180), iconTransformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 180)));
  Modelica.Blocks.Interfaces.RealInput Angle_Input2 annotation(
    Placement(visible = true, transformation(origin = {40, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {40, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput Angle_Input1 annotation(
    Placement(visible = true, transformation(origin = {-40, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-40, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput RPM_input annotation(
    Placement(visible = true, transformation(origin = {0, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {0, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
equation
  angle = (Angle_Input1 + Angle_Input2)/2*pi/180;
  Velocity = 2*pi*wheel_radius*RPM_input/(4.4*3.612)*(60/1000)*(10/36); // m/s
  Drag_Force = 0.5*1.420*1.759*1.225*Velocity*Velocity;
  
  Vehicle_mass*Ax = (Traction_Force + Traction_Force2)*9.8 - Drag_Force + Wz*Vy;
  Vehicle_mass*Ay = (-Dxf*Cf + Dxr*Cr)*Wz/Vx - (Cf + Cr)*Vy/Vx + Cf*angle - Wz*Vx;
  Iz*Wz_dot = (-Dxf*Dxf*Cf - Dxr*Dxr*Cr)*Wz/Vx - (Dxf*Cf - Dxr*Cr) + Dxf*Cf*angle;
  
  der(Vx) = Ax;
  der(Vy) = Ay;
  der(Wz) = Wz_dot;
  
  
annotation(
    uses(Modelica(version = "4.0.0")));
end Body;
