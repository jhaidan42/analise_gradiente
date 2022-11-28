function Caso2(t,Rastro,Alfa,N);
% Regra do gradiente ->  x = x - Alfa.Gradiente

%Sintaxe: Caso2(<t>,<Rastro>,<Alfa>,<N>);    Onde:  - t = tempo (s) para o pause (default = 0.1s)
%                                                        - Rastro = 1/0 indica se eh para plotar o rastro (default = 10)
%                                                        - Alfa eh o passo do gradiente (default = 0.02)
%                                                        - N eh o numero de loop (default = 50)

% Caso 2: z=x.^2 +y.^2;                (Parabolóide) dz/dx =2x  e  dz/dy=2y

close all          % Fecha figuras abertas

% identifica parametros e/ou default
if nargin<4        % Usuario nao definiu N
    N=50;        % Assume valor default
end
if nargin<3        % Usuario nao definiu Alfa
    Alfa = 0.02;   % Assume valor default
end
if nargin<2        % Usuario nao definiu se eh para plotar o rastro
    Rastro = 1;    % Assume valor default
end
if nargin<1        % Usuario nao definiu o tempo para o pause
    t=0.2;           % Assume valor default
end

 % Constrói o gráfico da função
xx = -10:1:10;
yy = xx;
[x,y]=meshgrid(xx,yy);
z=x.^2 +y.^2;
mesh(x,y,z);
hold on
grid on
titulo=title('Caso 2:  Min = [0  0]');
ylabel('Eixo Y')                                  % Nome do eixo Y
xlabel(strcat('Eixo X'))                          % Nome do eixo X 
zlabel(strcat('Eixo Z'))                          % Nome do eixo Z
eixos=axis;

% Indica condicao inicial
x=10;
y=10;
posicao=plot3(x,y,x^2+y^2,'ro');

axis(eixos);                                       % Garante posicao original dos eixos

for i = 1:N
   pause(t)                                       % Aguarda 1s para visualizacao da tela
   xi=x;  yi=y;                                   % So para plotar o rastro se precisar
   x = x - Alfa*2*x;                              % Ajuste da posicao pela regra do gradiente
   y = y - Alfa*2*y;                              % Ajuste da posicao pela regra do gradiente
   if Rastro                                      % Indica se eh para plotar o rastro
       plot3([xi  x], [yi  y], [xi^2+yi^2  x^2+y^2],'r')% Plota o rastro
   end
   set(posicao,'xdata',x,'ydata',y,'zdata',x^2+y^2)       % Muda a posicao do PLOT do ponto
   set(titulo,'string',strcat('Caso 2:  Min = [0  0]; z = x^2 + y^2;    Loop = ',num2str(i),'/',num2str(N)))   % Ajusta titulo com o numero do LOOP
   drawnow;
end
