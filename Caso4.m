function Caso4(t,Rastro,Alfa,N);
% Regra do gradiente ->  x = x - Alfa.Gradiente
%
%Sintaxe: Caso1(<t>,<Rastro>,<Alfa>,<N>);    Onde:  - t = tempo (s) para o pause (default = 0.2s)
%                                                        - Rastro = 1/0 indica se eh para plotar o rastro (default = 1)
%                                                        - Alfa eh o passo do gradiente (default = 0.08)
%                                                        - N eh o numero de loop (default = 50)
%
% Caso 4: y=x.^2-50*x+700+50*sin(x);   dy/dx = 2*x-50+50*cos(x)

close all          % Fecha figuras abertas

% identifica parametros e/ou default
if nargin<4        % Usuario nao definiu N
    N=50;         % Assume valor default
end
if nargin<3        % Usuario nao definiu Alfa
    Alfa = 0.08;  % Assume valor default
end
if nargin<2        % Usuario nao definiu se eh para plotar o rastro
    Rastro = 1;    % Assume valor default, nao mostra o rastro
end
if nargin<1        % Usuario nao definiu o tempo para o pause
    t=0.2;         % Assume valor default
end

% Prepara grafico da funcao
x=0:0.1:50;                                   % Define o range de x
y=x.^2-50*x+700+50*sin(x);                                           % Calcula y
plot(x,y,'b');             % Gráfico para função unidimensional
hold on
grid on
titulo=title('Caso 4:   Min = 23.6173');
ylabel('Eixo Y')                                  % Nome do eixo Y
xlabel(strcat('Eixo X     Alfa =',num2str(Alfa))) % Nome do eixo X com indicacao de ALFA
eixos=axis;                                       % Guarda tamanho dos eixos default
% Indica condicao inicial
xpos=50;                                            % X inicial 
posicao=plot(xpos,xpos.^2-50*xpos+700+50*sin(xpos),'ro');                    % Mostra posicao inicial e armazena para animacao

axis(eixos);                                       % Garante posicao original dos eixos

% Loop para N passos ajustando com o GRADIENTE
for i = 1:N
   pause(t)                                       % Aguarda 1s para visualizacao da tela
   newpos=xpos - Alfa * (2*xpos-50+50*cos(xpos));                 % Ajuste da posicao pela regra do gradiente
   if Rastro                                      % Indica se eh para plotar o rastro
       plot([xpos  newpos],[xpos.^2-50*xpos+700+50*sin(xpos)  newpos.^2-50*newpos+700+50*sin(newpos)],'r')% Plota o rastro
   end
   xpos=newpos;                                   % Atualiza posicao 

   set(posicao,'xdata',xpos,'ydata',xpos.^2-50*xpos+700+50*sin(xpos))       % Muda a posicao do PLOT do ponto

   set(titulo,'string',strcat('Caso 4:   Min = 23.6173; y=x.^2-50*x+700+50*sin(x);   Loop = ',num2str(i),'/',num2str(N)))   % Ajusta titulo com o numero do LOOP
end
