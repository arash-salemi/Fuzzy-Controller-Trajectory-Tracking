function dxdt = Mobilerobots(t,x,u)
dxdt = zeros(3,1);

x1 = x(1); % x
x2 = x(2); % y
x3 = x(3); % sai

v = u(1);
st_angle = u(2);

% l = 1;
% h_a = 0; %heading angle

% x_ref = squeeze(out.X);
% y_ref = squeeze(out.Y);

dxdt(1) = cos(x3)*v;
dxdt(2) = sin(x3)*v;
dxdt(3) = (v*tan(st_angle))/0.38;

end

