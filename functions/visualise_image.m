function im = visualise_image(train_mat, number)
  % initializare matrice finala.
  im = zeros (28, 28);

  % Citeste din matricea de antrenament linia cu numarul number.
  row = train_mat(number, :);

  % Transforma linia citita intr-o matrice 28x28 si o transpune
  im = reshape(row, [28, 28])';

  % Transforma matricea in uint8 pentru a obtine o imagine valida.
  im = uint8(im);
endfunction
