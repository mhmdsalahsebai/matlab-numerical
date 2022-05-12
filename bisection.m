function [a, b, c, fm, n] = bisection(f, point1, point2, tolerance)
%BISECTION implementation of the bisection method
%   in project1, implemented by Mohamed Salah
%   the function takes:
%   1- the equation you want to find root for it (f)
%   2- the two points xl, xu
%   3- the tolerance which will make the program stop

    % this code is just to make sure that ..
    % the smaller point is at xl and bigger point at xu,
    % just in case that the caller swap them.
    if f(point1) < f(point2)
        xl = point1;
        xu = point2;
    else
        xl = point2;
        xu = point1;
    end
    
    % I made the absRelativeError equal to tolerance * 2
    % to make sure that while loop will work fine, it will be clear to you 
    % when you get down to the condition that stop the while loop
    absRelativeError = tolerance;
    
    % in this case there is a root between the two points
    if f(xl) * f(xu) < 0

        i = 1; % iteration variable
        n(i) = i; % all iteration values will be here


        % There is no (do while) in matlab like other programming
        % languages, do while would be really helpfull here
        % so I worked around that and I made something
        % equal to it with while, that why I made the stop condition true
        while true
            xm = (xl + xu) / 2;
            a(i) = xl;
            b(i) = xu;
            n(i) = i;
            fm(i) = f(xm);

            if f(xl) * f(xm) < 0
                xu = xm;
            elseif f(xl) * f(xm) > 0
                xl = xm;
            end
            
            % we can't calculate the absolute relative error in the first
            % iteration because there is only one xm, that is why I skipped
            % computing abs relative error in th efirst iteration
            if i ~= 1
                c(i) = xm;
                absRelativeError = abs(c(i) - c(i - 1)) / c(i);
            else
                c(i) = xm;
            end
            
            i = i + 1;
            
            % These are the stop conditions, I add them in the end of the while
            % loop body to make it work like do while
            if absRelativeError < tolerance || xm == 0
                return
            end
        end % end of while
        
    elseif f(xl) * f(xu) > 0
        % the two points are both negative or positive
        disp("I can't find root between these points, sorry")
    else 
        % in this case one of these points (x1, x2) is the root
        if f(xl) == 0
            disp("I can't find root between these points, sorry", xl)
        else
            disp("I can't find root between these points, sorry", xu)
       %end
    end

end

