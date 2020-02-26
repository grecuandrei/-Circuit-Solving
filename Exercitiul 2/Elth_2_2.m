function Elth_2_2()
  pkg load symbolic;
  syms s
  % x = [i_3, i_Ls]
  A = sym(zeros(1,1));
  %A(1,:) = [1];
  A(1,:) = [(2+s/(10*pi))];
  b = [1/s - 3/(10*pi)];
  
  sol = simplify(A\b);
  % sol(1) = I_L(s)
  disp(sol);
  
  % se descompune formula curentului prin bobina in fractii simple
  n = [-3 0 10*pi];
  d = [1 20*pi 0];
  [r, p, k] = residue(n, d);
  y = sym (r(1)/(s-p(1)) + r(2)/(s-p(2)));
  limit(s*sol(1),s,0)
  limit(s*sol(1),s,inf)

  % se trece curentul prin bobina inapoi in timp
  i_L = ilaplace(y);
  disp("i_L(t) = ");
  disp(i_L);

  % se va trasa graficul curentului prin bobina
  plot_iL()
endfunction