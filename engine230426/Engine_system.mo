model Engine_system
  Vehicle_engine vehicle_engine annotation(
    Placement(visible = true, transformation(origin = {0, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  wheel Wheel annotation(
    Placement(visible = true, transformation(origin = {50, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  wheel Wheel1 annotation(
    Placement(visible = true, transformation(origin = {-50, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Constant const(k = 1) annotation(
    Placement(visible = true, transformation(origin = {4, 86}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant constant1(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-46, 84}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(vehicle_engine.RPM_output, wheel.Torque_input) annotation(
    Line(points = {{0, -9}, {0, -50}, {38, -50}}, color = {0, 0, 127}));
  connect(Wheel.wheel_RPM, vehicle_engine.Rear_Wheel_RPM_2) annotation(
    Line(points = {{62, -50}, {80, -50}, {80, -6}, {12, -6}}, color = {0, 0, 127}));
  connect(Wheel1.wheel_RPM, vehicle_engine.Rear_Wheel_RPM_1) annotation(
    Line(points = {{-62, -50}, {-80, -50}, {-80, -6}, {-12, -6}}, color = {0, 0, 127}));
  connect(const.y, vehicle_engine.Accel_input) annotation(
    Line(points = {{4, 75}, {4, 14}}, color = {0, 0, 127}));
  connect(constant1.y, vehicle_engine.Gear_input) annotation(
    Line(points = {{-46, 74}, {-44, 74}, {-44, 38}, {-4, 38}, {-4, 14}}, color = {0, 0, 127}));
  connect(vehicle_engine.RPM_output, Wheel1.Torque_input) annotation(
    Line(points = {{0, -8}, {0, -50}, {-38, -50}}, color = {0, 0, 127}));
  connect(vehicle_engine.RPM_output, Wheel.Torque_input) annotation(
    Line(points = {{0, -8}, {0, -50}, {38, -50}}, color = {0, 0, 127}));

annotation(
    uses(Modelica(version = "4.0.0")));
end Engine_system;
