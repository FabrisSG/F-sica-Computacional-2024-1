

figure
plot(T(:),u(:,2),'o',Tem,rho,'.r');
xlabel('Temperatura (°C)','FontWeight','Bold','FontName','Arial')
ylabel('\rho (kg/m^3)','FontWeight','Bold','FontName','Arial')

figure
plot(T(:),u(:,3),'o',Tem,Cp,'.r');
xlabel('Temperatura (°C)','FontWeight','Bold','FontName','Arial')
ylabel('C_p (J\cdot kg^{-1}\cdot K^{-1})','FontWeight','Bold','FontName','Arial')
 
figure
plot(T(:),u(:,4),'o',Tem,kl,'.r');
xlabel('Temperatura (°C)','FontWeight','Bold','FontName','Arial')
ylabel('k (W\cdot m^{-1}\cdot K^{-1}) ','FontWeight','Bold','FontName','Arial')

figure
plot(T(:),u(:,5),'o',Tem,kappa,'.r');
xlabel('Temperatura (°C)','FontWeight','Bold','FontName','Arial')
ylabel('\kappa\times10^6 (m^2/s)','FontWeight','Bold','FontName','Arial')
 
figure
plot(T(:),u(:,6),'o',Tem,mu,'.r');
xlabel('Temperatura (°C)','FontWeight','Bold','FontName','Arial')
ylabel('\mu\times10^6 (N\cdot s/m^3)','FontWeight','Bold','FontName','Arial')
  
figure
plot(T(:),u(:,7),'o',Tem,nu,'.r');
xlabel('Temperatura (°C)','FontWeight','Bold','FontName','Arial')
ylabel('\nu\times10^6 (m^2/s)','FontWeight','Bold','FontName','Arial')
