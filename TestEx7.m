numberPoints= 3;
nList = 40.*(1:numberPoints);
bisectionTime = zeros(numberPoints);
QRTime = zeros(numberPoints);
for i = 1:numberPoints
    A = tridiagonal(nList(i));
   tic;
   bisection(A, 0, 1, 10^-10);
   bisectionTime(i) = toc;
   %tic;
   %qr_shiftall(A);
   %QRTime(i) = toc;
end
plot(nList, bisectionTime)
legend("bisection", "QRtime")
