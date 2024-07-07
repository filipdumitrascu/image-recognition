function prediction = KNN(labels, Y, test, k)
  % initializeaza prediction
  prediction = -1;

  % initializeaza distantele
  [m, n] = size (Y);
  distance = zeros (m, 1);

  % Pentru fiecare rand se calcuuleaza distanta Euclidiana dintre
  % acesta si vectorul de test primit ca argument.
  distance = sqrt(sum((Y - test) .^ 2, 2));

  % Ordoneaza crescator distantele si tine minte intr-un vector primele
  % k valori.
  [~, indices] = sort(distance);
  k_indices = indices(1 : k);

  % Calculeaza predictia ca mediana celor k valori cele mai apropiate.
  prediction = median(labels(k_indices));
endfunction
