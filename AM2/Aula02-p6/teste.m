%script test

v1 = input('Introduza o 1º elemento da Pa: ');
r = input('introduza a razão da PA: ');
n = input('indique o número de elemtnos: ');

v = PAv1(v1,r,n);
t = PAv2(v1,r,n);
u = PAv3(v1,r,n);
w = PAv4(v1,r,n);

if(sum(t~=u) &  sum(v~=w) & sum(u~=u) &sum(t~=u))
    
    disp(
    
end