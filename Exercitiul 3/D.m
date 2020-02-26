function [val] = D(r, a)
  if r > a
    val = a^5 / (5*r^2);
  else
    val = r^3 / 5;
  endif
endfunction
