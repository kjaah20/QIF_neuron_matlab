%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  QIF neuron model %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% tstop (model's time in milliseconds) is the only required param    
function V=QIF(tstop,varargin)                               
%  time step
if nargin>1   dt=varargin{1};
else    dt = 0.5; end%  default value
%  firing thresholdthe resting and the instantaneous threshold potentials
if nargin>2     V_reset=varargin{2}; 
else     V_reset=-80; end% default value
%  initial value of the voltage 
if nargin>3    V_init=varargin{3};
else    V_init=0; end% default value
% input current
if nargin>4     I=varargin{4}; 
else     I(1:tstop/dt)=10; end% default value - unit: nA
% parameter capac describes the capacitance
if nargin>5    capac=varargin{5};
else    capac=1;end % default value
% parameter k
if nargin>6   k=varargin{6};
else    k = .02;end %  default value
% parameter c describes the after-spike reset value of V
if nargin>7     c=varargin{7}; 
else     c=-80; end% default value
% parameter d  describes the after-spike reset value of U
if nargin>8   Vpeak=varargin{8};
else    Vpeak=10; end% default value 
if nargin>9  V_th=varargin{9};
else    V_th=-40; end% default value 66

V = V_init;
V_trace = []; % voltage trace for plotting

for t = 1:(tstop/dt)
    if (V>=Vpeak)					% did it fire?
        V = c;					% voltage reset
    end;    
    %implementation of the voltage equation
    V = V +  (dt*(k(t)*(V-V_reset)*(V-V_th)+0.001*I(t)+0.12)/capac); 
%     if (V>=Vpeak) V=Vpeak;end;
    V_trace = [V_trace V];
end
V=V_trace;
end
