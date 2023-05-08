model Engine_sumul_2
  engine_gear Engine_gear(equation_1(start = 12))  annotation(
    Placement(visible = true, transformation(origin = {0, -60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  wheel wheel1 annotation(
    Placement(visible = true, transformation(origin = {60, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  wheel wheel2 annotation(
    Placement(visible = true, transformation(origin = {-60, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Floor floor annotation(
    Placement(visible = true, transformation(origin = {-82, -86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant2(k = 0.2) annotation(
    Placement(visible = true, transformation(origin = {28, -2}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant constant1(k = 1) annotation(
    Placement(visible = true, transformation(origin = {0, 36}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  RPM_box rPM_box annotation(
    Placement(visible = true, transformation(origin = {-32, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Engine_gear.Torque_output1, wheel1.Torque_input) annotation(
    Line(points = {{12, -60}, {48, -60}}, color = {0, 0, 127}));
  connect(Engine_gear.Torque_output2, wheel2.Torque_input) annotation(
    Line(points = {{-10, -60}, {-48, -60}}, color = {0, 0, 127}));
  connect(floor.Friction_output, wheel2.Friction_input) annotation(
    Line(points = {{-70, -86}, {-60, -86}, {-60, -72}}, color = {0, 0, 127}));
  connect(floor.Friction_output, wheel1.Friction_input) annotation(
    Line(points = {{-70, -86}, {40, -86}, {40, -36}, {60, -36}, {60, -48}}, color = {0, 0, 127}));
  connect(constant2.y, Engine_gear.Accel_input) annotation(
    Line(points = {{28, -13}, {28, -32}, {6, -32}, {6, -48}}, color = {0, 0, 127}));
  connect(constant1.y, Engine_gear.Gear_input) annotation(
    Line(points = {{0, 25}, {0, -48}}, color = {0, 0, 127}));
  connect(wheel2.wheel_RPM, rPM_box.RPM_input_1) annotation(
    Line(points = {{-72, -60}, {-84, -60}, {-84, -2}, {-44, -2}}, color = {0, 0, 127}));
  connect(wheel1.wheel_RPM, rPM_box.RPM_input_2) annotation(
    Line(points = {{72, -60}, {80, -60}, {80, -2}, {-20, -2}}, color = {0, 0, 127}));
  connect(rPM_box.RPM_output, Engine_gear.RPM_input) annotation(
    Line(points = {{-32, -14}, {-32, -32}, {-6, -32}, {-6, -48}}, color = {0, 0, 127}));
  connect(constant1.y, rPM_box.Gear_input) annotation(
    Line(points = {{0, 26}, {-32, 26}, {-32, 10}}, color = {0, 0, 127}));

annotation(
    uses(Modelica(version = "4.0.0")));
end Engine_sumul_2;
