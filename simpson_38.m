f=@(x) (x.^0.1) .* (1.2 - x) ./ (1 - exp(20 * (x - 1)));
a=input('Enter lower limit a: '); 
b=input('Enter upper limit b: ');  
n=input('Enter the  number of sub-intervals n: ');
while rem(n,3)~=0
   fprintf('\n Enter valid n!!!'); 
   n=input('\n Enter n as multiple of 3: ');
end
x=linespace(a,b,n+1);
I=3*(b-a)/8/n*sum(f(x).*[1,3,3,repmat([2,3,3],1,(n-3)/3),1]);
fprintf('\n The value of integration is %f',I);

