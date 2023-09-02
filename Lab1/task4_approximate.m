function [linear, parabol, cubic, custom] = task4_approximate(X, Y)
    Y = Y';
    
    lin_W = [ 1 X(1); 1 X(2); 1 X(3); 1 X(4) ];
    lin_A = (lin_W' * Y)' * inv(lin_W' * lin_W);
    lin_A = lin_A';
    linear = @(x) lin_A(1) + lin_A(2) * x;

    par_W = [ 1 X(1) X(1)^2; 1 X(2) X(2)^2; 1 X(3) X(3)^2; 1 X(4) X(4)^2; ];
    par_A = (par_W' * Y)' * inv(par_W' * par_W);
    par_A = par_A';
    parabol = @(x) par_A(1) + par_A(2) * x + par_A(3) * (x.^2);

    cub_W = [ 1 X(1) X(1)^2 X(1)^3; 1 X(2) X(2)^2 X(2)^3; 1 X(3) X(3)^2 X(3)^3; 1 X(4) X(4)^2 X(4)^3 ];
    cub_A = (cub_W' * Y)' * inv(cub_W' * cub_W);
    cub_A = cub_A';
    cubic = @(x) cub_A(1) + cub_A(2) * x + cub_A(3) * (x.^2) + cub_A(4) * (x.^3);

    function y = custom_func(p, x)
        a = p(1);
        b = p(2);
        c = p(3);
        y = a * exp(b * x) + c;
    end
    custom = @(x) custom_func(lsqcurvefit(@custom_func, [1 2 3], X, Y'), x);
end