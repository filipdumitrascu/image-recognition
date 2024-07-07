function [train_mat, train_val] = prepare_data(name, no_train_images)
  n = 784;

  % initializare train_mat.
  train_mat = zeros(no_train_images, n);

  %initializare train_val.
  train_val = zeros(1, no_train_images);

  % Incarca datele din tabelul primit ca argument.
  data = load(name);

  % Salveaza in matricea train_mat primele no_train_images linii
  train_mat = data.trainX(1 : no_train_images, :);

  % Salveaza in vectorul train_val primele no_train_images valori
  train_val = data.trainY(1 : no_train_images);
endfunction
