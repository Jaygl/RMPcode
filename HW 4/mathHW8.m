c0 = (exp(1)-exp(-1))/2;
c1 = 3*exp(-1);
c2 = 5*(-exp(1)/2+13/2*exp(-1))/7
c3 = (-5*exp(1)+37*exp(-1))/(2/7);
x = [-1:.01:1];
y = exp(x);
ay = c0*1+c1*x+c2*(3/2*x.^2-1/2)+c3*(5/2*x.^3-3/2*x);

plot(x,y,'b', 'linewidth', 2)
hold on
plot(x,ay,'r','linewidth', 2)