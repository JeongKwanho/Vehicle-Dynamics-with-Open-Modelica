model All_simulation
  Body body annotation(
    Placement(visible = true, transformation(origin = {-1, -1}, extent = {{-43, -43}, {43, 43}}, rotation = 0)));
  Rear_Wheel rear_Wheel_r annotation(
    Placement(visible = true, transformation(origin = {112, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Rear_Wheel rear_Wheel_l annotation(
    Placement(visible = true, transformation(origin = {-104, -16}, extent = {{-20, -20}, {20, 20}}, rotation = 180)));
  RPM_box rPM_box annotation(
    Placement(visible = true, transformation(origin = {-2, -80}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 0)  annotation(
    Placement(visible = true, transformation(origin = {0, -122}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Constant constant1(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-40, 82}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant constant2(k = 0.2) annotation(
    Placement(visible = true, transformation(origin = {-2, 82}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant constant3(k = 0.2) annotation(
    Placement(visible = true, transformation(origin = {40, 82}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Front_Wheel front_Wheel_r annotation(
    Placement(visible = true, transformation(origin = {90, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Front_Wheel front_Wheel_l annotation(
    Placement(visible = true, transformation(origin = {-90, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
equation
  connect(body.mass_r_r, rear_Wheel_r.Body_mass_input) annotation(
    Line(points = {{46, -18}, {68, -18}, {68, -24}, {90, -24}}, color = {0, 0, 127}));
  connect(body.Torque_output_right, rear_Wheel_r.Torque_input) annotation(
    Line(points = {{46, -27}, {67.25, -27}, {67.25, -28}, {90, -28}}, color = {0, 0, 127}));
  connect(rear_Wheel_r.Traction_force, body.Traction_r) annotation(
    Line(points = {{90, -32}, {64, -32}, {64, -35}, {46, -35}}, color = {0, 0, 127}));
  connect(body.mass_r_l, rear_Wheel_l.Body_mass_input) annotation(
    Line(points = {{-48, -35}, {-65, -35}, {-65, -32}, {-82, -32}}, color = {0, 0, 127}));
  connect(body.Torque_output_left, rear_Wheel_l.Torque_input) annotation(
    Line(points = {{-48, -27}, {-65, -27}, {-65, -28}, {-82, -28}}, color = {0, 0, 127}));
  connect(rear_Wheel_l.Traction_force, body.Traction_l) annotation(
    Line(points = {{-82, -24}, {-65.5, -24}, {-65.5, -18}, {-48, -18}}, color = {0, 0, 127}));
  connect(rPM_box.RPM_output, body.RPM_input) annotation(
    Line(points = {{5, -60}, {5, -48}, {16, -48}}, color = {0, 0, 127}));
  connect(body.current_gear, rPM_box.Gear_input) annotation(
    Line(points = {{-18, -48}, {-9, -48}, {-9, -60}}, color = {0, 0, 127}));
  connect(rear_Wheel_r.wheel_RPM, rPM_box.right_RPM) annotation(
    Line(points = {{134, -40}, {148, -40}, {148, -80}, {18, -80}}, color = {0, 0, 127}));
  connect(rear_Wheel_l.wheel_RPM, rPM_box.left_RPM) annotation(
    Line(points = {{-126, -16}, {-144, -16}, {-144, -80}, {-22, -80}}, color = {0, 0, 127}));
  connect(const.y, rear_Wheel_r.Floor_position) annotation(
    Line(points = {{0, -111}, {140, -111}, {140, -52}, {134, -52}}, color = {0, 0, 127}));
  connect(const.y, rear_Wheel_l.Floor_position) annotation(
    Line(points = {{0, -111}, {-154, -111}, {-154, -4}, {-126, -4}}, color = {0, 0, 127}));
  connect(constant3.y, body.Handle_input) annotation(
    Line(points = {{40, 72}, {40, 60}, {25, 60}, {25, 46}}, color = {0, 0, 127}));
  connect(constant1.y, body.Gear_input) annotation(
    Line(points = {{-40, 72}, {-40, 60}, {-27, 60}, {-27, 46}}, color = {0, 0, 127}));
  connect(constant2.y, body.Accel_Input) annotation(
    Line(points = {{-2, 72}, {-2, 59}, {-1, 59}, {-1, 46}}, color = {0, 0, 127}));
  connect(body.L_angle, front_Wheel_l.Angle_input) annotation(
    Line(points = {{-48, 33}, {-63, 33}, {-63, 34}, {-78, 34}}, color = {0, 0, 127}));
  connect(body.R_angle, front_Wheel_r.Angle_input) annotation(
    Line(points = {{46, 33}, {62, 33}, {62, 34}, {80, 34}}, color = {0, 0, 127}));

annotation(
    uses(Modelica(version = "4.0.0")));
end All_simulation;
