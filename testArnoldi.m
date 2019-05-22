m = 100;
A = sprand(m, m, 0.01);
b = rand(m , 1);
v = b/norm(b);
x = 1:m;
y = zeros(m, 1);

figure(1)
[V, H] = Arnoldi(A,v, 25);
eigH = eig(H);
eigA = eigs(A)
plot(real(eigA), imag(eigA), 'r*',real(eigH), imag(eigH), 'bo')
figure(2)
[V, H] = Arnoldi(A,v, 50);
eigH = eig(H);
eigA = eigs(A);
plot(real(eigA), imag(eigA), 'r*',real(eigH), imag(eigH), 'bo')
figure(3)
[V, H] = Arnoldi(A,v, 75);
eigH = eig(H)
eigA = eigs(A);
plot(real(eigA), imag(eigA), 'r*',real(eigH), imag(eigH), 'bo')
figure(4)
[V, H] = Arnoldi(A,v, 100);
eigH = eig(H);
eigA = eigs(A);
plot(real(eigA), imag(eigA), 'r*',real(eigH), imag(eigH), 'bo')



