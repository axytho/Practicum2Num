function E = opg7(n)
listTime = zeros(1,n);
for i = 1:n

 b = randn(1,i-1);
 a = randn(1,i);
 A =diag(b,-1)+diag(b,1)+diag(a)
 eigA = eig(A)
tic
 E = bisection(A, 0, 5, 10e-10)
 %for j = 1:i
% v = inversIt(A,E(i))
% end
 listTime(i) = toc;
 
 
end

linspace(1,n,n);
plot (linspace(1,n,n),listTime,'o')
end