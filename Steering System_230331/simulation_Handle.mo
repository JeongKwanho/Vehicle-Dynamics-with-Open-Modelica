model simulation_Handle
  Handle handle annotation(
    Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Handle_Gear handle_Gear annotation(
    Placement(visible = true, transformation(origin = {38, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine sine(amplitude = 580, f = 0.1, offset = 0, phase = 6.283185307179586, startTime = 0)  annotation(
    Placement(visible = true, transformation(origin = {-84, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(handle.Handle_output, handle_Gear.Handle_input) annotation(
    Line(points = {{-18, 0}, {2, 0}, {2, -1}, {25, -1}}, color = {0, 0, 127}));
  connect(sine.y, handle.Human_input) annotation(
    Line(points = {{-72, 0}, {-42, 0}}, color = {0, 0, 127}));

annotation(
    uses(Modelica(version = "4.0.0")));
end simulation_Handle;
