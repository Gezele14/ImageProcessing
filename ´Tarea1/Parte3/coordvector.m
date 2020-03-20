function X = coordvector(U, A)
  [m, n] = size(A);
  X = zeros(m,n);
  for i = 1:n
    X(:,i) = (U' * A(:,i));
  endfor
endfunction