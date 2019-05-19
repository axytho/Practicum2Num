function result = bisect(polynomial, a, b, tol, lowBound, highBound)
%BISECT Summary of this function goes here
%   Detailed explanation goes here

done = false;
ya = polyval(polynomial,a);
yb = polyval(polynomial,b);
while ((b-a)>tol && not(done))
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
                warning('Zero not in interval!')
                done = true;
                result = a;
            elseif sign(polyval(polynomial,b+ tol)) ~= sign(yb)
                warning('Zero not in interval!')
                done = true;
                result = b;
            elseif sign(polyval(polynomial,a + tol)) ~= sign(ya)
                ME = MException('MyComponent:bisectionError', 'Two zeros in interval on left!');
                throw(ME)
            elseif sign(polyval(polynomial,b - tol)) ~= sign(yb)
                ME = MException('MyComponent:bisectionError', 'Two zeros in interval on right!');
                throw(ME)
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
    yc = polyval(polynomial,c);
    if (sign(ya) == sign(yc))
        a = c;
        ya = yc;
    else
        b = c;
        yb = yc;
    end
end
if not(done)
    result = (a+b)/2;
end
end

