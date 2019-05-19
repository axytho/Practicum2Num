numberPoints= 2;
nList = 10*2.^(1:numberPoints);
bisectionTime = zeros(numberPoints);
QRTime = zeros(numberPoints);
for i = 1:numberPoints
    A = tridiagonal(nList(i));
   tic;
   bisection(A, 0, 0.0001, 10e-10);
   bisectionTime(i) = toc;
   tic;
   qr_shiftall(A);
   QRTime(i) = toc;
end
semilogx(nList, bisectionTime, nList, QRTime)
legend("bisection", "QRtime")
