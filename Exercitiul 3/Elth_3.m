function Elth_3()
  a = 4;
  [x, y] = meshgrid(-5:0.5:5);  
  [m n] = size(x);

  % se genereaza matricele pentru reprezentarea spectrului lui D
  for i = 1:m
    for j = 1:n
      r = sqrt(x(i, j)^2 + y(i, j)^2);
      Dx(i,j) = D(r, a) * x(i, j)/r;
      Dy(i,j) = D(r, a) * y(i, j)/r;
    endfor
  endfor

  % este reprezentat spectrul inductiei electrice
  figure;
  quiver(x, y, Dx, Dy);
  title ('Spectrul lui D', 'FontSize', 14);

  vectx = [-5:0.1:5];
  vecty = [-5:0.1:5];
  n = length(vectx);

  % se genereaza matricea pentru reprezentarea echivalorilor lui D
  for i = 1:n
    for j = 1:n
      r = sqrt(vectx(i)^2 + vecty(j)^2);
      if r > a
        echival(i, j) = a^5 / (5*r^2);
      else
        echival(i, j) = r^3 / 5;
      endif
    endfor
  endfor

  % sunt reprezentate echivalorile inductiei electrice
  figure;
  gradient(echival);
  contourf (vectx, vecty ,echival) ;
  title ('Echivalorile inductiei electrice', 'FontSize', 14);
  xlabel('x', 'FontSize', 14);
  ylabel('y', 'FontSize', 14);
  colorbar;
endfunction