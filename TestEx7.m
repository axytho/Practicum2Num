numberPoints= 1;
nList = 40.*(1:numberPoints);
bisectionTime = zeros(1, numberPoints);
QRTime = zeros(1, numberPoints);
for i = 1:numberPoints
    A = tridiagonal(nList(i));
   tic;
   eigA = bisectionAlt(A, -100, 100, 7, 10^-10);
   bisectionTime(i) = toc;
   %norm(sort(eig(A)) - sort(eigA'))
   tic;
   qr_shiftall(A);
   QRTime(i) = toc;
end
plot(nList, bisectionTime, nList, QRTime)
legend("bisection", "QRtime")
