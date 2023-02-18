function x = fix_point(g, x_0)
    tol = 1e-10; % Tolerance
    diffx = 1; 
    iter = 0; 
    maxiter = 100;
    x = x_0;

    while (diffx > tol) && (iter < maxiter)
        iter = iter + 1; % Number of iterations
        xnew = g(x); % Update with fixed point
 % |x(n+1)-x(n)| 
 % här använde de abs innan men jag moddade till norm istälet 
 % för att kunna köra med vektor
        diffx = norm(xnew-x); 
        x = xnew;
    end
end



