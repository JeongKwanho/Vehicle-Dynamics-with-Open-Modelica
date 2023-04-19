model engine_simul
  wheel Wheel_1 annotation(
    Placement(visible = true, transformation(origin = {-50, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  starstream_g1_6 Starstream_g1_6 annotation(
    Placement(visible = true, transformation(origin = {0, 6}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant const(k = 1)  annotation(
    Placement(visible = true, transformation(origin = {6, 82}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  wheel Wheel_2 annotation(
    Placement(visible = true, transformation(origin = {50, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Final_Reduction_Gear final_Reduction_Gear annotation(
    Placement(visible = true, transformation(origin = {-22, -86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Gear_ratio gear_ratio annotation(
    Placement(visible = true, transformation(origin = {-48, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant1(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-48, 82}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(const.y, Starstream_g1_6.Accel_input) annotation(
    Line(points = {{6, 72}, {6, 18}}, color = {0, 0, 127}));
  connect(Starstream_g1_6.Engine_Torque, Wheel_1.Torque_input) annotation(
    Line(points = {{0, -4}, {0, -42}, {-38, -42}}, color = {0, 0, 127}));
  connect(Starstream_g1_6.Engine_Torque, Wheel_2.Torque_input) annotation(
    Line(points = {{0, -4}, {0, -42}, {38, -42}}, color = {0, 0, 127}));
  connect(Wheel_2.wheel_RPM, final_Reduction_Gear.RPM_input_2) annotation(
    Line(points = {{62, -42}, {72, -42}, {72, -86}, {-10, -86}}, color = {0, 0, 127}));
  connect(Wheel_1.wheel_RPM, final_Reduction_Gear.RPM_input) annotation(
    Line(points = {{-62, -42}, {-80, -42}, {-80, -86}, {-34, -86}}, color = {0, 0, 127}));
  connect(final_Reduction_Gear.RPM_output, gear_ratio.RPM_input) annotation(
    Line(points = {{-22, -75}, {-22, 8}, {-48, 8}, {-48, 26}}, color = {0, 0, 127}));
  connect(constant1.y, gear_ratio.Gear_input) annotation(
    Line(points = {{-48, 72}, {-48, 50}}, color = {0, 0, 127}));
  connect(gear_ratio.RPM_output, Starstream_g1_6.RPM_input) annotation(
    Line(points = {{-36, 38}, {-6, 38}, {-6, 18}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "4.0.0")));
end engine_simul;
