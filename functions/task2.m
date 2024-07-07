function new_X = task2(photo, pcs)
  [m, n] = size(photo);

  % initializare matrice finala.
  new_X = zeros(m, n);

  % Converteste matricea photo la tipul double
  photo = double(photo);

  % Calculeaza media pentru fiecare rand si o scade din matricea initiala.
  row_average = zeros(m, 1);
  for i = 1 : m
    row_average(i) = sum(photo(i, :)) / n;
    photo(i, :) -= row_average(i);
  endfor

  % Construieste matricea Z.
  Z = photo' / sqrt(n - 1);

  % Aplica descompunerea SVD asupra matricei Z.
  [U, S, V] = svd(Z);

  % Construieste matricea W din primele pcs coloane ale lui V.
  W = V(:, 1 : pcs);

  % Calculeaza matricea Y, proiectia lui photo.
  Y = W' * photo;

  % Aproximeaza matricea initiala new_X.
  new_X = W * Y + row_average;

  % Transforma matricea in uint8 pentru a obtine o imagine valida.
  new_X = uint8(new_X);
endfunction
