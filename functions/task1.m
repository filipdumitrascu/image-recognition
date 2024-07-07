function new_X = task1(photo, k)
  [m, n] = size(photo);

  % initializare matrice finala
  new_X = zeros(m, n);

  % Converteste matricea photo la tipul double
  photo = double(photo);

  % Aplica algoritmul SVD asupra matricei photo
  [U, S, V] = svd(photo);

  % Calculeaza noile matrici reduse in functie de k
  U_k = U(:, 1 : k);
  S_k = S(1 : k, 1 : k);
  V_k = V(:, 1 : k);

  % Calculeaza matricea aproximata new_X
  new_X = U_k * S_k * V_k';

  % Transforma matricea in uint8 pentru a obtine o imagine valida
  new_X = uint8(new_X);
endfunction
