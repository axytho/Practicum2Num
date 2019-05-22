%quickTest
A = diag([1, 2, 3, 4, 5, 6]) + diag([2, 3, 4, 5, 6], 1) + diag([2, 3, 4, 5, 6], -1);
eigA = bisection(A, -10, 20, 10^-13);
norm(sort(eig(A)) - sort(eigA'))






numberPoints= 10;
nList = 40.*(1:numberPoints);
bisectionTime = zeros(1, numberPoints);
QRTime = zeros(1, numberPoints);
for i = 1:numberPoints
    A = tridiagonal(nList(i));
    v = zeros(40*i,1);
    v(1) = 1;
   tic;
   eigA = bisection(A, -10, 10, 10^-13);
   eigenvectors = zeros(40*i, 7);
   for j=1:7
        w = (A - eigA(j) * speye(size(v, 1)))\v;
        eigenvectors(:, j) = w/norm(w);
   end
   bisectionTime(i) = toc;
   %norm(sort(eig(A)) - sort(eigA'))
   tic;
   qr_shiftall(A);
   QRTime(i) = toc;

end
plot(nList, bisectionTime, nList, QRTime)
legend("bisection", "QRtime")
