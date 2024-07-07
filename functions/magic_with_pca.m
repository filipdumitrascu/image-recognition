function [train, miu, Y, Vk] = magic_with_pca(train_mat, pcs)
  [m, n] = size(train_mat);

  % initializare train
  train = zeros(m, n);

  % initializare miu
  miu = zeros(1, n);

  % initializare Y
  Y = zeros(m, pcs);

  % initializare Vk
  Vk = zeros(n, pcs);

  % Transforma train_mat in tip double.
  train_mat = double(train_mat);

  % Calculeaza media pentru fiecare coloana si o scade din matricea initiala.
  for i = 1 : n
    miu(i) = sum(train_mat(:, i)) / m;
    train_mat(:, i) -= miu(i);
  endfor

  % Calculeaza matricea de covarianta.
  Z = train_mat' * train_mat / (m - 1);

  % Calculeaza vectorii si valorile proprii ale matricei de covarianta.
  [V, S] = eig(Z);

  % Ordoneaza descrescator valorile proprii si pastrand aceeasi ordine
  % se sorteaza si vectorii proprii.
  [~, indices] = sort(diag(S), 'descend');
  V = V(:, indices);

  % Pastreaza doar primele pcs coloane din matricea V.
  Vk = V(:, 1 : pcs);

  % Creaza matricea Y schimband baza matriciei initiale.
  Y = train_mat * Vk;

  % Calculeaza matricea train care este o aproximatie a matricii initiale
  train = Y * Vk';
endfunction
