function Elth()
  pkg load symbolic;
  syms s
  A = sym(zeros(4,4));
  % x = [i_c, i_L, i_6, i_p]
  A(1,:) = [0, 1, -1, 0];
  A(2,:) = [1, 0, -1, 1];
  A(3,:) = [-10000*pi/s, 0, 0, 1];
  A(4,:) = [0, (s/10*pi + 1), 0, 1];
  b = [-5/s; 0; 2/s; -1/s + 3/(10*pi)];
  
  sol = simplify(A\b);
  % sol(2) = I_L(s)
  disp(sol);
  
  % se descompune formula curentului prin bobina in fractii simple
  n = [0 339 -10^4*pi*339-3550 -10^4*3550*pi-177500000*pi];
  d = [335*pi 3550+10^4*pi^2*335 10^5*pi*335*2 0];
  [r, p, k] = residue(n, d)
  y = sym (r(1)/(s-p(1)) + r(2)/(s-p(2)));
  
  disp(sol(2))
  % se trece curentul prin bobina inapoi in timp
  i_L = ilaplace(y);
  disp("i_L(t) = ");
  disp(i_L);
  syms t

  % se va trasa graficul curentului prin bobina
  plot_iL()
endfunction