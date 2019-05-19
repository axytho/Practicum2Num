%Generate matrices
function A = tridiagonal(n)
a1 = rand(1 , n);
a2 = rand(1, n-1);
A = diag(a1) + diag(a2, 1) + diag(a2, -1);
end