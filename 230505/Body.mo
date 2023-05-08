model Body
  parameter Real Vehicle_mass = 1400;
  parameter Real Dxf = 1.100;
  parameter Real Dxr = 1.324;
  parameter Real Cf = 130000;
  parameter Real Cr = 130000;
  parameter Real Iz = 1200;
  parameter Real Friction_Force = (317.567*9.81*2 + 382.343*9.81*2)*0.8;
  
  Real Drag_Force;
  Real Velocity;
  Real Vx;
  Real Vy;
  Real Wz;
  Real Ax;
  Real Ay;
  Real Wz_dot;
  Real angle;
  
  Modelica.Blocks.Interfaces.RealInput Traction_Force annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Traction_Force2 annotation(
    Placement(visible = true, transformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 180), iconTransformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 180)));
  Modelica.Blocks.Interfaces.RealInput Angle_Input2 annotation(
    Placement(visible = true, transformation(origin = {40, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {40, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput Angle_Input1 annotation(
    Placement(visible = true, transformation(origin = {-40, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-40, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput Velocity_input annotation(
    Placement(visible = true, transformation(origin = {-60, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {-40, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealInput Velocity_input2 annotation(
    Placement(visible = true, transformation(origin = {60, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {40, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
equation
  angle = (Angle_Input1 + Angle_Input2)/2;
  Velocity = (Velocity_input + Velocity_input2)/2;
  Drag_Force = 0.5*1.420*1.759*1.225*Velocity*Velocity;
  
  Vehicle_mass*Ax = Traction_Force + Traction_Force2 - Drag_Force - Friction_Force + Wz*Vy;
  Vehicle_mass*Ay = (-Dxf*Cf + Dxr*Cr)*Wz/Vx - (Cf + Cr)*Vy/Vx + Cf*angle - Wz*Vx;
  Iz*Wz_dot = (-Dxf*Dxf*Cf - Dxr*Dxr*Cr)*Wz/Vx - (Dxf*Cf - Dxr*Cr) + Dxf*Cf*angle;
  
  der(Vx) = Ax;
  der(Vy) = Ay;
  der(Wz) = Wz_dot;
  
  
annotation(
    uses(Modelica(version = "4.0.0")));
end Body;
