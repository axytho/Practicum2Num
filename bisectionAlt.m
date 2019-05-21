function [eigenvalues] = bisectionAlt(polynomials,a, b, maxEigenvalues, tol)
%Check the number of sign changes in a and b
if  (signchanges(polynomials,b) - signchanges(polynomials, a))==0
    eigenvalues = [];
elseif (b-a)<tol
    eigenvalues = (a+b)/2; %if multiple eigenvalues within same tolerance, assume identical
else
    eigenA = bisectionAlt(polynomials,a, (a+b)/2, maxEigenvalues, tol);
    if size(eigenA, 1) < maxEigenvalues
        eigenvalues = [eigenA, bisectionAlt(polynomials,(a+b)/2, b, maxEigenvalues, tol)];
    else
        eigenvalues = eigenA;
    end    
end
end
function numberOfSignChanges= signchanges(polynomials, x)
oldValue = 1; %We start at one
numberOfSignChanges = 0;
for k=1:length(polynomials)
   polynom = polynomials{k};
   newValue = polyval(polynom, x);
   if sign(newValue) ~= sign(oldValue)
       numberOfSignChanges = numberOfSignChanges + 1;
   end
   oldValue = newValue;
end
end