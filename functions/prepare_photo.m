function sir = prepare_photo(im)
  %initializare sirul final.
  sir = zeros(1, 784);

  % Inverseaza pixelii imaginii im.
  im = 255 - im;

  % Transpune imaginea, iar apoi transforma imaginea intr-un vector linie.
  sir = reshape(im', 1, []);
endfunction
