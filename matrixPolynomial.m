function value = matrixPolynomial(A,x)
% First we calculate al the characteristic polynomials.
    functionk2 = 0;
    functionk1 = 1;

    
    for k = 1:size(A,1)
        if k > 1
            functionk0 = (A(k, k) - x).* functionk1 - A(k, k-1)^2 .* functionk2;    
        else
            functionk0 = (A(k, k) - x);
        end 
        functionk2 = functionk1;
        functionk1 = functionk0;
    end
value = functionk0;
end

