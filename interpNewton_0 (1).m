
clear


m1=200;  %numero de puntos a interpolar
u=dlmread('datos2_2.dat'); 
naux=size(u);
n=naux(1)-1;  % numero de datos conocidos
np=naux(2)-1;  % numero de propiedades
da=(u(naux(1),1)-u(1,1))/m1;
T(:)=u(:,1);
y(:,1:np)=u(:,2:np+1);

for j=1:np %corre sobre las propiedades 
	for k=0:n %corre sobre los datos
        k1=k+1;
		for i=0:n %define diferencias divididas
            i1=i+1;
			if  k == 0  
				dd(i1,k1,j) = y(i1,j);
            elseif i > n-k
                dd(k1,i1,j) = 0.0;
            else 
				dd(i1,k1,j)=(dd(i1+1,k1-1,j)-dd(i1,k1-1,j))/(T(i1+k)-T(i1));
            end 
        end
		a(k1,j)= dd(1,k1,j);   %coeficientes del polinomio
        end 
    end 

Ta = u(1,1); % Valor inicial de la variable independiente	

for l1=0:m1 
    l=l1+1;
	for m=1:np %corre sobre las propiedades
		pol(m) = 0.0; 
		for k=0:n %corre sobre el grado del polinomio 
            k1=k+1;
			prodk = 1.0;  %define el producto que va multiplicado por a_k 
			for j=0:k-1
                j1=j+1;
				prodk = prodk*(Ta - T(j1));
            end 
			%el polinomio interpolante evaluado en Ta 
			pol(m) = pol(m) + a(k1,m)*prodk;  
        end
%        prop(l,m)=pol(m);
    end

    Tem(l)=Ta;
    rho(l)=pol(1);   
    Cp(l)=pol(2);    
    kl(l)=pol(3);    
    kappa(l)=pol(4);  
    mu(l)=pol(5);    
    nu(l)=pol(6);    
  	Ta = Ta + da; 

    
end 


Gpropiedades
