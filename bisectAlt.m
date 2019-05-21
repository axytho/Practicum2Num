function E = bisectAlt(A, a, b, tol)


% First we calculate al the characteristic polynomials.
    functionk2 = [0];
    functionk1 = [1];

    polynomials =  cell(size(A,1));
    for k = 1:size(A,1)
        if k > 1
            functionk0 = A(k, k).*[0, functionk1] - [functionk1, 0] - A(k, k-1)^2 .* [0,0, functionk2];    
        else
            functionk0 = [-1, A(k, k)];
        end 
        functionk2 = functionk1;
        functionk1 = functionk0;
        polynomials{k} = functionk0;
    end
    E = bisectionAlt(polynomials, a, b, 10000, tol);
    % Now we recursivly search every eigenvalue in the given     
end

