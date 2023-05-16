model Body
  
  //starstream g1.6 engine
  parameter Real Max_Torque_RPM = 4500;
  parameter Real Max_Power_RPM = 6300;
  parameter Real Max_Torque = 15.7;
  parameter Real Min_Torque = 12;
  parameter Real Max_RPM_Torque = 14;
  parameter Real Min_RPM = 1000;
  
  //gear parameter
  parameter Real first_dan = 4.4;
  parameter Real second_dan = 2.726;
  parameter Real third_dan = 1.834;
  parameter Real forth_dan = 1.392;
  parameter Real fifth_dan = 1;
  parameter Real sixth_dan = 0.774;
  parameter Real back_dan = 3.440;
  parameter Real final_reduction = 3.612;
  
  //Torque equation
  Real Torque_equation1;
  Real Torque_equation2;
  Real Engine_Torque;
  
  //gear output
  Real Gear_output;
  Real Final_Torque;
  
  //Body information
  parameter Real body_mass = 1400; //kg
  parameter Real wheel_base = 2.424; //m
  parameter Real Track = 1.59; //m
  parameter Real Dxf = 1.1;
  parameter Real Dxr = 1.324;
  parameter Real Cf = 130000;
  parameter Real Cr = 130000;
  parameter Real Iz = 1200;
  
  //Steering System
  parameter Real Rad2Deg = 180/3.141592;
  parameter Real Radius = 5;
  parameter Real Deg2Rad = 3.141592/180;
  Real Left_angle(start = 0);
  Real Right_angle(start = 0);
  Real steering_angle;
  
  //Body
  Real Vx;
  Real Vy;
  Real Wz;
  Real Ax;
  Real Ay;
  Real dWz;
  
  Modelica.Blocks.Interfaces.RealInput RPM_input annotation(
    Placement(visible = true, transformation(origin = {40, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {40, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealInput Accel_Input annotation(
    Placement(visible = true, transformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, 110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput Gear_input annotation(
    Placement(visible = true, transformation(origin = {-60, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-60, 110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput Torque_output_left annotation(
    Placement(visible = true, transformation(origin = {-110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 180), iconTransformation(origin = {-110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Interfaces.RealOutput Torque_output_right annotation(
    Placement(visible = true, transformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput mass_r_l annotation(
    Placement(visible = true, transformation(origin = {-110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 180), iconTransformation(origin = {-110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Interfaces.RealOutput mass_r_r annotation(
    Placement(visible = true, transformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Traction_l annotation(
    Placement(visible = true, transformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Traction_r annotation(
    Placement(visible = true, transformation(origin = {120, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 180), iconTransformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Interfaces.RealInput Handle_input annotation(
    Placement(visible = true, transformation(origin = {60, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {60, 110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput R_angle annotation(
    Placement(visible = true, transformation(origin = {110, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput L_angle annotation(
    Placement(visible = true, transformation(origin = {-110, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 180), iconTransformation(origin = {-110, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Interfaces.RealOutput current_gear annotation(
    Placement(visible = true, transformation(origin = {-40, -110}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {-40, -110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  mass_r_l = 450;
  mass_r_r = 450;
  
  current_gear = Gear_input;
  
  //Engine torque give to wheel
  Torque_equation1 = ((Max_Torque - Min_Torque)/(Max_Torque_RPM - Min_RPM))*(RPM_input - Min_RPM) + Min_Torque;
  Torque_equation2 = ((Max_RPM_Torque - Max_Torque)/(Max_Power_RPM - Max_Torque_RPM))*(RPM_input - Max_Torque_RPM) + Max_Torque;
  
  if(RPM_input <= Max_Torque_RPM) then
    Engine_Torque = Torque_equation1*Accel_Input;
  elseif(RPM_input > 7000) then
    Engine_Torque = 0;
  else
    Engine_Torque = Torque_equation2*Accel_Input;
  end if;
  
  if (Gear_input == 1) then
    Gear_output = first_dan*Engine_Torque;
  elseif (Gear_input == 2) then
    Gear_output = second_dan*Engine_Torque;
  elseif (Gear_input == 3) then
    Gear_output = third_dan*Engine_Torque;
  elseif (Gear_input == 4) then
    Gear_output = forth_dan*Engine_Torque;
  elseif (Gear_input == 5) then
    Gear_output = fifth_dan*Engine_Torque;
  elseif (Gear_input == 6) then
    Gear_output = sixth_dan*Engine_Torque;
  elseif (Gear_input == 7) then
    Gear_output = back_dan*Engine_Torque;
  else
    Gear_output = 0;
  end if;
  
  Final_Torque = final_reduction*Gear_output/2;
  
  Torque_output_left = Final_Torque;
  Torque_output_right = Final_Torque;
  
  //Steering System
  if (Handle_input > 0) then //turn right
    Left_angle = Rad2Deg*atan(wheel_base/(Radius + Track/2))*Handle_input;
    Right_angle = Rad2Deg*atan(wheel_base/(Radius - Track/2))*Handle_input;
  elseif (Handle_input < 0) then // turn left
    Left_angle = Rad2Deg*atan(wheel_base/(Radius - Track/2))*Handle_input;
    Right_angle = Rad2Deg*atan(wheel_base/(Radius + Track/2))*Handle_input;
  else
    Left_angle = 0;
    Right_angle = 0;
  end if;
  
  R_angle = Right_angle;
  L_angle = Left_angle;
  
  steering_angle = (Left_angle + Right_angle)/2*Deg2Rad;
  
  //body 운동
  body_mass*Ax = (Traction_l + Traction_r)*9.8 + Wz*Vy;
  body_mass*Ay = ((-Dxf*Cf + Dxr*Cr)*Wz)/Vx - ((Cf + Cr)*Vy)/Vx + Cf*steering_angle - Wz*Vx;
  Iz*dWz = ((-Dxf^2*Cf - Dxr^2*Cr)*Wz)/Vx - (Dxf*Cf - Dxr*Cr)*Vy/Vx + Dxf*Cf*steering_angle;
  
  Ax = der(Vx);
  Ay = der(Vy);
  dWz = der(Wz);
  
annotation(
    uses(Modelica(version = "4.0.0")));
annotation(
    uses(Modelica(version = "4.0.0")));
end Body;
