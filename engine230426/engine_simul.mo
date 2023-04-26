model engine_simul
  wheel Wheel_1 annotation(
    Placement(visible = true, transformation(origin = {-66, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  starstream_g1_6 Starstream_g1_6(equation_1(start = 1000))  annotation(
    Placement(visible = true, transformation(origin = {0, 6}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  wheel Wheel_2 annotation(
    Placement(visible = true, transformation(origin = {64, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Final_Reduction_Gear final_Reduction_Gear annotation(
    Placement(visible = true, transformation(origin = {0, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Gear_ratio gear_ratio annotation(
    Placement(visible = true, transformation(origin = {0, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant constant1(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-48, 82}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  RPM_box rPM_box annotation(
    Placement(visible = true, transformation(origin = {-6, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant2(k = 0.2) annotation(
    Placement(visible = true, transformation(origin = {10, 82}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(final_Reduction_Gear.Torque_output, Wheel_2.Torque_input) annotation(
    Line(points = {{12, -80}, {32, -80}, {32, -42}, {52, -42}}, color = {0, 0, 127}));
  connect(final_Reduction_Gear.Torque_output_2, Wheel_1.Torque_input) annotation(
    Line(points = {{-12, -80}, {-33, -80}, {-33, -42}, {-54, -42}}, color = {0, 0, 127}));
  connect(gear_ratio.Torque_output, final_Reduction_Gear.Torque_input) annotation(
    Line(points = {{0, -42}, {0, -68}}, color = {0, 0, 127}));
  connect(Starstream_g1_6.Engine_Torque, gear_ratio.Torque_input) annotation(
    Line(points = {{0, -4}, {0, -18}}, color = {0, 0, 127}));
  connect(constant1.y, gear_ratio.Gear_input) annotation(
    Line(points = {{-48, 72}, {-48, -30}, {-12, -30}}, color = {0, 0, 127}));
  connect(Wheel_2.wheel_RPM, rPM_box.RPM_input_2) annotation(
    Line(points = {{76, -42}, {82, -42}, {82, 42}, {6, 42}}, color = {0, 0, 127}));
  connect(Wheel_1.wheel_RPM, rPM_box.RPM_input_1) annotation(
    Line(points = {{-78, -42}, {-86, -42}, {-86, 42}, {-18, 42}}, color = {0, 0, 127}));
  connect(constant1.y, rPM_box.Gear_input) annotation(
    Line(points = {{-48, 72}, {-48, 60}, {-6, 60}, {-6, 54}}, color = {0, 0, 127}));
  connect(rPM_box.RPM_output, Starstream_g1_6.RPM_input) annotation(
    Line(points = {{-6, 30}, {-6, 18}}, color = {0, 0, 127}));
  connect(constant2.y, Starstream_g1_6.Accel_input) annotation(
    Line(points = {{10, 72}, {6, 72}, {6, 18}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "4.0.0")));
end engine_simul;
