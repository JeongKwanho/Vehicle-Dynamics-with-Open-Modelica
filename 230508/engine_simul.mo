model engine_simul
  wheel Wheel_1 annotation(
    Placement(visible = true, transformation(origin = {-56, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  starstream_g1_6 Starstream_g1_6(equation_1(start = 1000))  annotation(
    Placement(visible = true, transformation(origin = {0, -6}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  wheel Wheel_2 annotation(
    Placement(visible = true, transformation(origin = {62, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Final_Reduction_Gear final_Reduction_Gear annotation(
    Placement(visible = true, transformation(origin = {-2, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Gear_ratio gear_ratio annotation(
    Placement(visible = true, transformation(origin = {-2, -38}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant constant1(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-42, 64}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  RPM_box rPM_box annotation(
    Placement(visible = true, transformation(origin = {-12, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant2(k = 0.2) annotation(
    Placement(visible = true, transformation(origin = {6, 78}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Front_Left_Wheel front_Left_Wheel annotation(
    Placement(visible = true, transformation(origin = {-70, 78}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Front_Right_Wheel front_Right_Wheel annotation(
    Placement(visible = true, transformation(origin = {68, 78}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Body body annotation(
    Placement(visible = true, transformation(origin = {26, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant3(k = 0) annotation(
    Placement(visible = true, transformation(origin = {-28, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(final_Reduction_Gear.Torque_output, Wheel_2.Torque_input) annotation(
    Line(points = {{10, -78}, {32, -78}, {32, -56}, {50, -56}}, color = {0, 0, 127}));
  connect(final_Reduction_Gear.Torque_output_2, Wheel_1.Torque_input) annotation(
    Line(points = {{-14, -78}, {-33, -78}, {-33, -58}, {-44, -58}}, color = {0, 0, 127}));
  connect(gear_ratio.Torque_output, final_Reduction_Gear.Torque_input) annotation(
    Line(points = {{-2, -50}, {-2, -66}}, color = {0, 0, 127}));
  connect(Starstream_g1_6.Engine_Torque, gear_ratio.Torque_input) annotation(
    Line(points = {{0, -17}, {0, -20.5}, {-2, -20.5}, {-2, -26}}, color = {0, 0, 127}));
  connect(constant1.y, gear_ratio.Gear_input) annotation(
    Line(points = {{-42, 53}, {-42, -38}, {-14, -38}}, color = {0, 0, 127}));
  connect(Wheel_2.wheel_RPM, rPM_box.RPM_input_2) annotation(
    Line(points = {{73.9, -59.9}, {81.9, -59.9}, {81.9, 30}, {0, 30}}, color = {0, 0, 127}));
  connect(Wheel_1.wheel_RPM, rPM_box.RPM_input_1) annotation(
    Line(points = {{-67.9, -54.1}, {-85.9, -54.1}, {-85.9, 30}, {-24, 30}}, color = {0, 0, 127}));
  connect(constant1.y, rPM_box.Gear_input) annotation(
    Line(points = {{-42, 53}, {-42, 42}, {-12, 42}}, color = {0, 0, 127}));
  connect(rPM_box.RPM_output, Starstream_g1_6.RPM_input) annotation(
    Line(points = {{-12, 18}, {-12, 15.5}, {-6, 15.5}, {-6, 5}}, color = {0, 0, 127}));
  connect(constant2.y, Starstream_g1_6.Accel_input) annotation(
    Line(points = {{6, 67}, {6, 5}}, color = {0, 0, 127}));
  connect(Wheel_2.wheel_RPM, front_Right_Wheel.RPM_input) annotation(
    Line(points = {{73.9, -59.9}, {81.9, -59.9}, {81.9, 40.1}, {62, 40.1}, {62, 66}}, color = {0, 0, 127}));
  connect(Wheel_1.wheel_RPM, front_Left_Wheel.RPM_input) annotation(
    Line(points = {{-67.9, -54.1}, {-76, -54.1}, {-76, 66}}, color = {0, 0, 127}));
  connect(Wheel_2.Traction_Force, body.Traction_Force2) annotation(
    Line(points = {{74, -52}, {90, -52}, {90, 44}, {38, 44}}, color = {0, 0, 127}));
  connect(Wheel_1.Traction_Force, body.Traction_Force) annotation(
    Line(points = {{-68, -62}, {-90, -62}, {-90, 44}, {14, 44}}, color = {0, 0, 127}));
  connect(rPM_box.RPM_output, body.RPM_input) annotation(
    Line(points = {{-12, 18}, {11, 18}, {11, 32}, {26, 32}}, color = {0, 0, 127}));
  connect(front_Right_Wheel.Angle, body.Angle_Input2) annotation(
    Line(points = {{68, 89}, {28, 89}, {28, 55}, {30, 55}}, color = {0, 0, 127}));
  connect(front_Left_Wheel.Angle, body.Angle_Input1) annotation(
    Line(points = {{-70, 89}, {-16, 89}, {-16, 55}, {22, 55}}, color = {0, 0, 127}));
  connect(constant3.y, front_Right_Wheel.Handle_input) annotation(
    Line(points = {{-28, 1}, {-28, 13}, {74, 13}, {74, 66}}, color = {0, 0, 127}));
  connect(constant3.y, front_Left_Wheel.Handle_input) annotation(
    Line(points = {{-28, 1}, {-36, 1}, {-36, 19}, {-64, 19}, {-64, 66}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "4.0.0")));
end engine_simul;
