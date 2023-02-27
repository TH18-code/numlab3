clear 

h = 0.001
N = 500000


a = 0.5; 

q1_0 = 1 - a;
q2_0 = 0;
p1_0 = 0;
p2_0 = ((1+a)/(1-a))^0.5; 


nabla_p = @(p,q) [p(1), p(2)]'
nabla_q = @(p,q) [q(1), q(2)]'./(norm(q)^3)


d_p = nabla_p([1,2], [2,3])
d_q = nabla_q([1,2], [2,3])


% framåt euler 

q = [q1_0, q2_0]'
p = [p1_0, p2_0]'
A = [q]

for i = 1:1:N
    dp = -nabla_q(p, q);
    dq = nabla_p(p, q);

    q = q + dq.*h;
    p = p + dp.*h;
    A(:, i + 1) = q;
end



plot_columns(A);







