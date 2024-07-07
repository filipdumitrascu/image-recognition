function new_X = task3(photo, pcs)
  [m, n] = size(photo);

  % initializare matrice finala.
  new_X = zeros(m, n);

  % Converteste matricea photo la tipul double
  photo = double(photo);

  % Calculeaza media pentru fiecare rand și o scade din matricea initiala.
  row_average = zeros(m, 1);
  for i = 1 : m
    row_average(i) = sum(photo(i, :)) / n;
    photo(i, :) -= row_average(i);
  endfor

  % Calculeaza matricea de covarianta.
  Z = photo * photo' / (n - 1);

  % Calculeaza vectorii si valorile proprii ale matricei de covarianta.
  [V, S] = eig(Z);

  % Ordoneaza descrescator valorile proprii si pastrand aceeasi ordine
  % se sorteaza si vectorii proprii.
  [~, indices] = sort(diag(S), 'descend');
  V = V(:, indices);

  % Pastreaza doar primele pcs coloane din matricea V.
  W = V(:, 1 : pcs);

  % Creeaza matricea Y schimband baza matriciei initiale.
  Y = W' * photo;

  % Calculeaza matricea new_X care este o aproximatie a matriciei initiale.
  % si aduna media randurilor scazuta anterior.
  new_X = W * Y + row_average;

  % Transforma matricea in uint8 pentru a fi o imagine valida.
  new_X = uint8(new_X);
endfunction
