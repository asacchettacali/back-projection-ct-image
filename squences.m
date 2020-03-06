T1_WM   = 0.88;
p_WM    = 80;
T1_GM   = 1.79;
p_GM    = 89;

x = -3:0.1:3;
y = -3:0.1:3;
[x,y] = meshgrid(x,y);

y = p_WM * [1 - exp(-x / T1_WM)] - p_GM * [1 - exp(-x / T1_GM)];

mesh(x,y);