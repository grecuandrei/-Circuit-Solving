  function plot_iL()
    x = [-0.5:0.01:1.5];
    for i = 1:length(x)
      % formula curentului prin bobina
      z =  1/2 - 42299/225 * exp(-20*pi*x(i));
      if z > 0
        y(i) = z;
      else
        y(i) = 3;
      endif
    endfor
    plot(x, y, 'LineWidth', 2);
    xlabel('Timp (s)', 'FontSize', 14);
    ylabel('Curentul prin bobina (A)', 'FontSize', 14);
    title('Graficul curentului prin bobina', 'FontSize', 12);
  endfunction