function [polynomSum] = polynomAdd(polynom1,polynom2, polynom3)
largest = max([length(polynom1), length(polynom2), length(polynom3)]);
polynom1 = [zeros(1, largest - length(polynom1)), polynom1];
polynom2 = [zeros(1, largest - length(polynom2)), polynom2];
polynom3 = [zeros(1, largest - length(polynom3)), polynom3];
polynomSum = polynom1 + polynom2 + polynom3;
end

