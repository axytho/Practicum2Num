function [V, H] = Arnoldi(A,v, m)
%we assume that q is actually our v in the algorithm?
sizeA = size(A, 1)
V = zeros(sizeA); % No point in having the matrices be bigger than what we're calculating
H = zeros(sizeA+1, sizeA); %Note that A will generally be much greater than V or H

V(:, 1) = v;
for n = 1:m % m is het aantal iteraties
    remainder = A*V(:,n);
    for j = 1:n
        H(j,n) = V(:, j)' * remainder;
        remainder = remainder - H(j,n)*V(:, j);
    end
    H(n+1, n) = norm(remainder);
    V(:, n+1) = remainder/H(n+1, n);
end
end
V = V(:, 1:m+1); % No point in having the matrices be bigger than what we're calculating
H = zeros(1:m+1, 1:m); %Note that A will generally be much greater than V or H


RealEigen = qr_shiftall(A);

