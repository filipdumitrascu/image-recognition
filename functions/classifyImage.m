function prediction = classifyImage(im, train_mat, train_val, pcs)
  % initializare predictie.
  prediction = -1;

  % Transforma im la double.
  im = double(im);

  % Aplica functia magic_with_pca setului de date de antrenament.
  [train, miu, Y, Vk] = magic_with_pca(train_mat, pcs);

  % Scade din vectorul imagine media fiecarei coloane din train_mat.
  im -= miu;

  % Schimba baza inmultind cu matricea Vk.
  im *= Vk;

  % Calculeaza predictia folosindu-se de metoda k nearest neighbour
  % implementata anterior cu k = 5.
  prediction = KNN(train_val, Y, im, 5);
endfunction
