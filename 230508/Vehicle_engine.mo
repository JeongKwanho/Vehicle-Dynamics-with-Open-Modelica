model Vehicle_engine
  starstream_g1_6 Starstream_g1_6 annotation(
    Placement(visible = true, transformation(origin = {2, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Gear_ratio gear_ratio annotation(
    Placement(visible = true, transformation(origin = {-14, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Final_Reduction_Gear final_Reduction_Gear annotation(
    Placement(visible = true, transformation(origin = {10, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Rear_Wheel_RPM_1 annotation(
    Placement(visible = true, transformation(origin = {-120, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -78}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Rear_Wheel_RPM_2 annotation(
    Placement(visible = true, transformation(origin = {120, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 180), iconTransformation(origin = {120, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 180)));
  Modelica.Blocks.Interfaces.RealInput Gear_input annotation(
    Placement(visible = true, transformation(origin = {-40, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-40, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput Accel_input annotation(
    Placement(visible = true, transformation(origin = {40, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {40, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput RPM_output annotation(
    Placement(visible = true, transformation(origin = {0, -120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, -110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation

  connect(final_Reduction_Gear.RPM_output, gear_ratio.RPM_input) annotation(
    Line(points = {{10, -69}, {10, -53.5}, {-2, -53.5}, {-2, -36}}, color = {0, 0, 127}));
  connect(Rear_Wheel_RPM_1, final_Reduction_Gear.RPM_input) annotation(
    Line(points = {{-120, -80}, {-2, -80}}, color = {0, 0, 127}));
  connect(Rear_Wheel_RPM_2, final_Reduction_Gear.RPM_input_2) annotation(
    Line(points = {{120, -80}, {22, -80}}, color = {0, 0, 127}));
  connect(Accel_input, starstream_g1_6.Accel_input) annotation(
    Line(points = {{40, 120}, {32, 120}, {32, 16}, {-4, 16}, {-4, 39}}, color = {0, 0, 127}));
  connect(Gear_input, gear_ratio.Gear_input) annotation(
    Line(points = {{-40, 120}, {-40, 67}, {-26, 67}, {-26, -36}}, color = {0, 0, 127}));
  connect(starstream_g1_6.Engine_Torque, RPM_output) annotation(
    Line(points = {{2, 62}, {54, 62}, {54, -92}, {0, -92}, {0, -120}}, color = {0, 0, 127}));
  connect(gear_ratio.RPM_output, Starstream_g1_6.RPM_input) annotation(
    Line(points = {{-14, -24}, {8, -24}, {8, 40}}, color = {0, 0, 127}));
  connect(Accel_input, Starstream_g1_6.Accel_input) annotation(
    Line(points = {{40, 120}, {-18, 120}, {-18, 24}, {-4, 24}, {-4, 40}}, color = {0, 0, 127}));
  connect(Starstream_g1_6.Engine_Torque, RPM_output) annotation(
    Line(points = {{2, 62}, {2, 72}, {52, 72}, {52, -98}, {0, -98}, {0, -120}}, color = {0, 0, 127}));

annotation(
    uses(Modelica(version = "4.0.0")));
end Vehicle_engine;
