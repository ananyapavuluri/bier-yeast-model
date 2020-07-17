% % Use Euler's method to integrate simple one variable ODE
% % Use program as template for more interesting models

% % Note:  produces slightly different output compared with 
% % example shown in class.  Different values of b, dt, tlast
tic 
close all
clear all

Vin = 0.36 ;
k1 = 0.02 ;
kp = 6 ;
Km = 13;

params_baseline = [Vin,k1,kp,Km] ;

n_params = length(params_baseline) ;
variations = 2000 ;
sigma = 0.25 ;

for ii = 1:variations
  params_all(ii,:) = exp(sigma*randn(1,n_params)).*params_baseline ;
end

dt    = 0.1 ;  
tlast = 1500 ; % s
iterations = round(tlast/dt) ; 

ATP_all = zeros(iterations,variations) ;
G_all = zeros(iterations,variations) ;

for ii = 1:variations

  params_now = params_all(ii,:) ;
  Vin = params_now(1) ;
  k1 = params_now(2) ;
  kp = params_now(3) ;
  Km = params_now(4) ;
  
  ATP_vector = zeros(iterations,1) ;
  G_vector = zeros(iterations,1) ;

  ATP = 4 ;
  G = 3 ;
  t = 0 ;

  for i = 1:iterations 
    ATP_vector(i) = ATP ;
    G_vector(i) = G;
    time_vector(i) = t ;
    
    dATPdt = (2*k1*G*ATP) - ((kp*ATP)/(ATP + Km));
    dGdt = Vin - (k1*G*ATP) ;
    
    ATP = ATP + dATPdt*dt ;
    G = G + dGdt*dt ;
    t = t + dt ;
  end % of this time step
  
  ATP_all(:,ii) = ATP_vector ;
  G_all(:,ii) = G_vector ;

  if (ii <= 20)
    figure
    hold on
    plot(time_vector,G_vector,'r')
    plot(time_vector,ATP_vector,'b')
    xlabel('time (s)')
    legend('[glucose]', '[ATP]')
  end

end

toc