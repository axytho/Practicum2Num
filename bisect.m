function result = bisect(polynomial, a, b, tol, lowBound, highBound)
%BISECT Summary of this function goes here
%   Detailed explanation goes here

done = false;
while ((b-a)>tol && not(done))
    ya = polyval(polynomial,a);
    yb = polyval(polynomial,b);
    if (ya == 0)
        result = a; % We're not doing b = a and then letting it roll because that causes issue with division
        done = true;
    end
    if (yb == 0)
        result = b; % This is also easier to understand and is not in any  way less optimized
        done = true;
    end
    if (ya*yb > 0)
        if a == lowBound % We assume that the eigenvalue is to our left
            done = true;
            result = a;
        end
        if b == highBound % We assume the eigenvalue is to our right
            done = true;
            result = b;
        end
        if (a ~= lowBound && b ~= highBound)

            if sign(polyval(polynomial,a- tol)) ~= sign(ya)
                done = true;
                result = a;
            elseif sign(polyval(polynomial,b+ tol)) ~= sign(yb)
                done = true;
                result = b;
            else
                lowBound
                highBound
                a
                ya
                b
                yb               
                polyval(polynomial,a- tol)
                polyval(polynomial,b + tol)
                ME = MException('MyComponent:bisectionError', 'Not able to bisect!');
                throw(ME)
            end   
        end
    end
    c = (a+b)/2;
    if (sign(ya) == sign(polyval(polynomial,c)))
        a = c;
    else
        b = c;
    end
end
if not(done)
    result = (a+b)/2;
end
end

