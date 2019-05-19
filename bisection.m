function E = bisection(A,a, b, tol)
%Deflation
subdiagonal = diag(A, 1);
m = size(A, 1);
if (m>1 && not(all(subdiagonal)))
    index = find(subdiagonal==0,1);
    E = sort([bisection(A(1:index, 1:index), a, b, tol) , bisection(A(index+1:end, index+1:end), a, b, tol)]);
else
%The meat of the function

functionk2 = [0];
functionk1 = [1];
zeroList = [a, b];
for k = 1:m
    k
    if k > 1
        functionk0 = A(k, k)*[0, functionk1] - [functionk1, 0] + A(k, k-1)^2 * [0,0, functionk2];    
    else
        functionk0 = [-1, A(k, k)];
    end 
    functionk2 = functionk1;
    functionk1 = functionk0;
    newZeroList = a;
    for i = 1:size(zeroList, 2)-1
        newZeroList(i+1) = bisect(functionk0, zeroList(i), zeroList(i+1), tol, a, b);
    end
    newZeroList(end+1) = b;
    zeroList = unique(newZeroList); % remove additional a's and b's
end
E = zeroList(2:end-1);
if polyval(functionk0,a) == 0
    E = [a, E];
end
if polyval(functionk0,b) == 0
    E = [E, b];
end
end
end
