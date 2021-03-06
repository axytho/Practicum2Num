function [eigenvalues] = bisection(A,a, b, tol)
%Check the number of sign changes in a and b
if  (signchanges(A,b) - signchanges(A, a))<=0%Should not be less than 0, but can happen
    eigenvalues = [];
elseif (b-a)<tol
    eigenvalues = (a+b)/2; %if multiple eigenvalues within same tolerance, assume identical
else
    eigenvalues = [bisection(A,a, (a+b)/2, tol), bisection(A,(a+b)/2, b, tol)];

end
end
function numberOfSignChanges= signchanges(A, x)
% First we calculate al the characteristic polynomials.
    functionk2 = 0;
    functionk1 = 1;

    numberOfSignChanges= 0;
    for k = 1:size(A,1)
        if k > 1
            functionk0 = (A(k, k) - x).* functionk1 - A(k, k-1)^2 .* functionk2;
            
        else
            functionk0 =(A(k, k) - x);
        end 
        if (sign(functionk0) ~= sign(functionk1)) && (sign(functionk0) ~= 0)
            numberOfSignChanges = numberOfSignChanges + 1;
        end
        functionk2 = functionk1;
        functionk1 = functionk0;
    end
end