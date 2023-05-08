model Engine_simul
  starstream_g1_6 Starstream_g1_6(equation_1(fixed = true, start = 12))  annotation(
    Placement(visible = true, transformation(origin = {4, -6}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Gear_Box gear_Box annotation(
    Placement(visible = true, transformation(origin = {0, -40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant Gear(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-42, 60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant Pedal(k = 0.2) annotation(
    Placement(visible = true, transformation(origin = {36, 42}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Final_Reduction_Gear final_Reduction_Gear annotation(
    Placement(visible = true, transformation(origin = {0, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  RPM_box rPM_box annotation(
    Placement(visible = true, transformation(origin = {-6, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Front_Left_Wheel front_Left_Wheel annotation(
    Placement(visible = true, transformation(origin = {-76, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Front_Right_Wheel front_Right_Wheel annotation(
    Placement(visible = true, transformation(origin = {88, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Body body annotation(
    Placement(visible = true, transformation(origin = {0, 78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant1(k = 0) annotation(
    Placement(visible = true, transformation(origin = {-22, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Rear_Wheel rear_WheelR annotation(
    Placement(visible = true, transformation(origin = {44, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Rear_Wheel rear_WheelL annotation(
    Placement(visible = true, transformation(origin = {-46, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
equation
  connect(Starstream_g1_6.Engine_Torque, gear_Box.Torque_input) annotation(
    Line(points = {{4, -17}, {4, -28}}, color = {0, 0, 127}));
  connect(Gear.y, gear_Box.Gear_input) annotation(
    Line(points = {{-42, 49}, {-42, -18}, {-4, -18}, {-4, -28}}, color = {0, 0, 127}));
  connect(Pedal.y, Starstream_g1_6.Accel_input) annotation(
    Line(points = {{36, 31}, {36, 26}, {10, 26}, {10, 5}}, color = {0, 0, 127}));
  connect(gear_Box.Torque_output, final_Reduction_Gear.Torque_input) annotation(
    Line(points = {{0, -50}, {0, -62}}, color = {0, 0, 127}));
  connect(Gear.y, rPM_box.Gear_input) annotation(
    Line(points = {{-42, 49}, {-6, 49}, {-6, 38}}, color = {0, 0, 127}));
  connect(rPM_box.RPM_output, Starstream_g1_6.RPM_input) annotation(
    Line(points = {{-6, 14}, {-6, 9.5}, {-2, 9.5}, {-2, 5}}, color = {0, 0, 127}));
  connect(constant1.y, front_Left_Wheel.Handle_input) annotation(
    Line(points = {{-22, 9}, {-76, 9}, {-76, 60}}, color = {0, 0, 127}));
  connect(constant1.y, front_Right_Wheel.Handle_input) annotation(
    Line(points = {{-22, 9}, {88, 9}, {88, 64}}, color = {0, 0, 127}));
  connect(front_Right_Wheel.Angle_output, body.Angle_Input2) annotation(
    Line(points = {{88, 87}, {88, 96}, {4, 96}, {4, 90}}, color = {0, 0, 127}));
  connect(front_Left_Wheel.Angle_output, body.Angle_Input1) annotation(
    Line(points = {{-76, 84}, {-76, 96}, {-4, 96}, {-4, 90}}, color = {0, 0, 127}));
  connect(final_Reduction_Gear.Torque_output, rear_WheelR.Torque_input) annotation(
    Line(points = {{12, -74}, {32, -74}, {32, -42}}, color = {0, 0, 127}));
  connect(rear_WheelR.Traction_Force, body.Traction_Force2) annotation(
    Line(points = {{56, -42}, {74, -42}, {74, 78}, {12, 78}}, color = {0, 0, 127}));
  connect(rear_WheelR.Velocity, body.Velocity_input2) annotation(
    Line(points = {{56, -36}, {68, -36}, {68, 66}, {4, 66}}, color = {0, 0, 127}));
  connect(rear_WheelR.RPM_output, rPM_box.RPM_input_2) annotation(
    Line(points = {{56, -48}, {62, -48}, {62, 26}, {6, 26}}, color = {0, 0, 127}));
  connect(final_Reduction_Gear.Torque_output_2, rear_WheelL.Torque_input) annotation(
    Line(points = {{-12, -74}, {-26, -74}, {-26, -40}, {-34, -40}}, color = {0, 0, 127}));
  connect(rear_WheelL.Traction_Force, body.Traction_Force) annotation(
    Line(points = {{-56, -40}, {-74, -40}, {-74, 78}, {-12, 78}}, color = {0, 0, 127}));
  connect(rear_WheelL.RPM_output, rPM_box.RPM_input_1) annotation(
    Line(points = {{-56, -34}, {-64, -34}, {-64, 26}, {-18, 26}}, color = {0, 0, 127}));
  connect(rear_WheelL.Velocity, body.Velocity_input) annotation(
    Line(points = {{-56, -46}, {-62, -46}, {-62, 66}, {-4, 66}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "4.0.0")));
end Engine_simul;
