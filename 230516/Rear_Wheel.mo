model Rear_Wheel
  //tire basic information
  parameter Real pi = 3.141592;
  parameter Real rear_mass = 20;
  parameter Real wheel_radius = 0.4572/2;
  parameter Real tire_width = 0.235;
  parameter Real g = 9.81;
  
  //tire RPM information
  parameter Real rad2rev = 30/pi;
  
  //tire spring information
  parameter Real wheel_spring_stiff = 1000000;
  parameter Real wheel_damper_stiff = 10000;
  
  //tire traction force
  Real moment;
  Real trac_force;
  Real angle_acc;
  Real wheel_vel;
  
  //tire position
  Real z(start = 1);
  Real dz, ddz;
  Real tire_normal_force;
  Real dray;
  
  Modelica.Blocks.Interfaces.RealInput Body_mass_input annotation(
    Placement(visible = true, transformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Torque_input annotation(
    Placement(visible = true, transformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Floor_position annotation(
    Placement(visible = true, transformation(origin = {120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 180), iconTransformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    
  Modelica.Blocks.Interfaces.RealOutput Traction_force annotation(
    Placement(visible = true, transformation(origin = {-110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 180), iconTransformation(origin = {-110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Interfaces.RealOutput Tire_position annotation(
    Placement(visible = true, transformation(origin = {-110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 180), iconTransformation(origin = {-110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Interfaces.RealOutput wheel_RPM annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  //tire traction force
  moment = (rear_mass + Body_mass_input)*wheel_radius^2/2;
  Torque_input = angle_acc*moment;
  der(wheel_vel) = angle_acc;
  wheel_RPM = wheel_vel*rad2rev;
  wheel_radius*trac_force = Torque_input;
  
  //tire position
  dz = der(z);
  ddz = der(dz);
  dray = der(Floor_position);
  
  if(z - Floor_position < wheel_radius) then
    tire_normal_force = -wheel_damper_stiff*(dz - dray) - wheel_spring_stiff*(z - Floor_position - wheel_radius);
  else
    tire_normal_force = 0;
  end if;
  
  rear_mass * ddz = tire_normal_force + rear_mass * (-9.81);
  
  Traction_force = trac_force;
  Tire_position = z;
  
annotation(
    uses(Modelica(version = "4.0.0")));
end Rear_Wheel;
