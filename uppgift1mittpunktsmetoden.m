h = 0.11
N = 500000


a = 0.5; 

q1_0 = 1 - a;
q2_0 = 0;
p1_0 = 0;
p2_0 = ((1+a)/(1-a))^0.5; 


q = [q1_0, q2_0]';
p = [p1_0, p2_0]';
A = [q];

for i = 1:1:N
    
    % kan mycket väl vara fel i funktionen här
    f = @(x) p - (q + (x + p).*(h/4)).*(h/(norm(q + (x + p).*(h/4))^3));
    
    
    p_new = fix_point(f, p);
    q = q + (p + p_new).*(h/2);
    p = p_new;

    A(:, i + 1) = q;
end



plot_columns(A);


