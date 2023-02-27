N=200; % antal intervall
a=1.0; % parameter i begynnelsedata
T=10; % sluttid
dx=a/N; % steglängd i rummet
dt=dx/4.0; % tidssteg, tänk på stabilitetsvillkoren
c = 1;  % våghastigheten


M=fix(T/dt); % antal tidsteg
figure(1)
axis([0 1 -1 1])
% allokering av minne
u=zeros(N-1,M+1); % u(n,m) utböjning vid tid (m-1)*dt i position n*dx
p=zeros(N-1,M+1); % p=u’
A=zeros(N-1,N-1); % Au är differensapproximation av d^2 u/dx^2
X=zeros(N-1,1); % X(n) blir n*dx
write_obj = VideoWriter('outw.avi');
write_obj.FrameRate = 10;
open(write_obj);
nframe=M; % kommando för film
mov(1:nframe)= struct('cdata',[],'colormap',[]);
set(gca,'nextplot','replacechildren')
A(1,1) = -1; 
A(1,2) = 1; 
A(N-1,N-1)=-1;
A(N-1, N-2) = 1;

X = dx:dx:1-dx;
for n=2:N-2 % slinga med rumssteg för att bilda begynnelsedata och A
    A(n, (n-1):(n+1)) = [1,-2,1];
end


u(:,1) = sin([dx:dx:1-dx].*2*pi)./2 + sin([dx:dx:1-dx].*pi)./2+ sin([dx:dx:1-dx].*3*pi)./2;
% bilda A på randen
for m=1:M % tidstegning med symplektiska Euler
p(:,m+1) = p(:,m) + (dt*(c^2)*(N^2)).*(A*u(:, m));
u(:, m+1) = u(:, m) + dt.*p(:,m+1);

plot(X,u(:,m+1), 'b', 'Linewidth', 1)
mov(m)=getframe(gcf);
end
writeVideo(write_obj,mov);
close(write_obj);



