tstop=12000*0.00025;
dt=0.00025;
V_reset=-71.5828	;
V_init=-72.473672;
% I=VarName1';
capac=0.170177;
% k=2;
c=	-50.5663;
Vpeak=12;
V_th=-52.8762;
VV=QIF(tstop,dt,V_reset,V_init,I1,capac,kk(2,:),c,Vpeak,V_th);
plot(VV)
hold on
plot(dd)

		
						
		
								
	