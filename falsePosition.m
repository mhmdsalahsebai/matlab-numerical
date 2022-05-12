function [a, b, c, fm, n] = falsePosition(f, point1, point2, thereIsTolerance, tolerance, iterations)
%FALSEPOSITION implementation of the False Position method
%   in project1, implemented by Mohamed Salah
%   ---------------------------------------------
%   This function works in two ways if you give it tolerance or 
%   if you give it the number of iterations, because of this I will not
%   repeat myself and I can now use the same function to solve all the problems :)

%   the function takes:
%   1- the equation you want to find the root for it (f)
%   2- the two points xl, xu
%   3- thereIsTolerance is a boolean parameter if you will use tolerance
%   pass true to it, if you want to use iteration, then pass false.
%   3- the tolerance which will make the program stop.
%   4- iterations, in case you will use the number of iterations to stop
%   the problem, if you will use tolerance instead, then passing any number to
%   this parameter will not effect anything.
%   ---------------------------------------------

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
    
    % I made the absRelativeError equal to tolerance
    % to make sure that while loop will work fine, it will be clear to you 
    % when you get down to the condition that stop the while loop
    if thereIsTolerance
        absRelativeError = tolerance;
    end
    
    % in this case there is a root between the two points
    if f(xl) * f(xu) < 0

        i = 1; % iteration variable
        n(i) = i; % all iteration values will be here

        % There is no (do while) in matlab like other programming
        % languages, do while would be really helpfull here
        % so I worked around that and I made something
        % equal to it with while, that why I made the stop condition true
        while true
            xm = (xu * f(xl) - xl * f(xu)) / (f(xl) - f(xu));
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
            % iteration because there is only one xm, that's why I skipped
            % computing abs relative error in the first iteration
            if i ~= 1
                c(i) = xm;
                
                if thereIsTolerance
                    absRelativeError = abs(c(i) - c(i - 1)) / c(i);
                end
                
            else
                c(i) = xm;
            end
            
            i = i + 1;
            
            % These are the stop conditions, I add it in the end of the while
            % loop body to make it work like do while
            if thereIsTolerance
                
                if absRelativeError < tolerance || xm == 0
                    return
                end
                
            else
                
                if i > iterations || xm == 0
                    return
                end
                
            end
            
        end % end of while
        
    elseif f(xl) * f(xu) > 0
        % the two points are both negative or positive
        disp("I can't find root between these points, sorry")
    else 
        % in this case one of these points (x1, x2) is the root
        disp("Here is the root")
        if f(xl) == 0
            disp(xl)
        else
            disp(xu)
        end
    end

end

