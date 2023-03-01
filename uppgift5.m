time_span = [0 100000];

r = 0.5;
init_pos = [
    1-r;
    0
];
init_acc = [
    0; 
    sqrt((1+r)/(1-r))
];

init_par = [
    init_acc(1);
    init_acc(2)
    init_pos(1);
    init_pos(2);
];


[~, positions] = ode45(@(t,y) odeKepler(t,y), time_span, init_par);

plot(positions(:,3), positions(:,4))
axis equal

function out_par = odeKepler(~, in_par)
    pos = [in_par(3) in_par(4)];
    acc =  -pos / (norm(pos)^3);
    
    out_par = [
        acc(1);
        acc(2);
        in_par(1);
        in_par(2);
    ];
end