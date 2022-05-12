function [n, pTotal, fTotal, error] = newtonMethod(f, p, tolerance)
%NEWTONMETHOD implementation of the bisection method
%   in project 2, implemented by Mohamed Salah
%   the function takes:
%   1- the equation you want to find root for it (f).
%   2- the initial point p.
%   3- the tolerance which will make the program stop.


    % Evaluate f’(x) symbolically.
    syms x;
    fDash(x) = diff(f(x));
 
    i = 1;
    while true
    
        pNew = double(subs(p - f(p)/fDash(p)));
        absRelativeError = abs((pNew - p)/pNew);
        
        error(i) = absRelativeError;
        pTotal(i) = p;
        fTotal(i) = f(p);
        n(i) = i;
        
        p = pNew;
        i = i + 1;
        if absRelativeError < tolerance
            break
        end
    end

end

