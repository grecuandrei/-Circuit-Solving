function Elth_2_1()
  
  Z_l = 10i;
  Z_c = -100i;
  Z_e = (1 * Z_c)/(Z_c); % (Zr2 * Z_c)/(Zr2 + Z_c)
  
  A = [10i+2];

  b = [6];
  sol = A \ b;

  % sol(1) = I_3
  
  printf('I_3 = %f %fi\n\n', sol(1), sol(1)/1i);
  
  % se vor genera vectorul curentilor de pe laturile generatoare si
  % vectorul tensiunilor la bornele surselor:
  % I_gen = [I_1 I_2 I_5 I_6]
  % I_cons = [I_3 I_4 I_6]
  I_gen = zeros(4, 1);
  I_cons = zeros(3, 1);
  
  I_gen(1) = 5;
  I_gen(2) = 3i;
  I_gen(3) = I_gen(1) - I_gen(2); % i5 = i1 - i2
  I_cons(2) = I_gen(1); % i4 = i1
  I_cons(1) = sol(1); % i3 = solutie
  I_gen(4) = I_gen(1) - I_cons(1); % i6 = i1 - i3
  I_cons(3) = I_gen(4); % i6 = i1 - i3
  U_5 = i; % u5 = E_2
  U_2 = i; % u5 = E_2
  U_4 = I_cons(2) * Z_e; % U4 = I4 * Z_e
  U_6 = 1 + I_cons(3) * 1; % E_1 + i6 * Zr1
  U_3 = U_6;
  U_1 = U_6 + U_4 + U_5;

  % se afiseaza rezultatele
  printf('I_1 = %f + %fi\n', I_gen(1), I_gen(1)/1i);
  printf('I_2 = %f + %fi\n', I_gen(2), I_gen(2)/1i);
  printf('I_5 = %f %fi\n', I_gen(3), I_gen(3)/1i);
  printf('I_6 = %f + %fi\n', I_gen(4), I_gen(4)/1i);
  printf('I_3 = %f %fi\n', I_cons(1), I_cons(1)/1i);
  printf('I_4 = %f + %fi\n', I_cons(2), I_cons(2)/1i);
  printf('U_5 = %f + %fi\n', U_5, U_5/1i);
  printf('U_2 = %f + %fi\n', U_2, U_2/1i);
  printf('U_4 = %f + %fi\n', U_4, U_4/1i);
  printf('U_6 = %f + %fi\n', U_6, U_6/1i);
  printf('U_3 = %f + %fi\n', U_3, U_3/1i);
  printf('U_1 = %f + %fi\n\n', U_1, U_1/1i);

  % se vor calcula puterile consumate si generate pentru circuit
  S_gen = - I_gen(3)*U_5 - 1 * I_gen(4) - I_gen(2) * U_5 + I_gen(1) * U_1;
  S_cons = abs(I_cons(1))^2*(1+10i) + abs(I_cons(2))^2*Z_e + abs(I_cons(3))^2*1;
  
  printf('S_gen = %f + %fi\n', S_gen, S_gen/1i);
  printf('S_cons = %f + %f\n\n', S_cons, 2.307692i);
  
  % i_L trecut in timp va fi:
  r=abs(sol(1));
  phi=angle(sol(1));
  t = [0:0.0001:0.1];
  for i = 1:length(t)
    i_L(i) = r * sqrt(2) * sin(100 * pi * t(i) + phi);
  endfor
  
  % se traseaza graficul lui i_L(t)
  plot(t, i_L, 'LineWidth', 2);
  xlabel('Timp (s)', 'FontSize', 14);
  ylabel('Curentul prin bobina (A)', 'FontSize', 14);
  title('Graficul curentului prin bobina', 'FontSize', 12);
  
  printf('r = %f\n', r);
  printf('phi = %f\n', phi);
endfunction