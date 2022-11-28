function Caso1(t,Rastro,Alfa,N);
% Regra do gradiente ->  x = x - Alfa.Gradiente
%
%Sintaxe: Caso1(<t>,<Rastro>,<Alfa>,<N>);    Onde:  - t = tempo (s) para o pause (default = 0.1s)
%                                                        - Rastro = 1/0 indica se eh para plotar o rastro (default = 10)
%                                                        - Alfa eh o passo do gradiente (default = 0.02)
%                                                        - N eh o numero de loop (default = 50)
%
% Caso 1: y=x^2                        (Parábola), dy/dx=2x

close all          % Fecha figuras abertas

% identifica parametros e/ou default
if nargin<4        % Usuario nao definiu N
    N=50;         % Assume valor default
end
if nargin<3        % Usuario nao definiu Alfa
    Alfa = 0.02;  % Assume valor default
end
if nargin<2        % Usuario nao definiu se eh para plotar o rastro
    Rastro = 1;    % Assume valor default, nao mostra o rastro
end
if nargin<1        % Usuario nao definiu o tempo para o pause
    t=0.2;         % Assume valor default
end

% Prepara grafico da funcao
x=-10:0.1:10;                                     % Define o range de x
y=x.^2;                                           % Calcula y como x ao quadrado
plot(x,y,'b');             % Gráfico para função unidimensional
hold on
grid on
titulo=title('Caso 1:   Min = 0');
ylabel('Eixo Y')                                  % Nome do eixo Y
xlabel(strcat('Eixo X     Alfa =',num2str(Alfa))) % Nome do eixo X com indicacao de ALFA
eixos=axis;                                       % Guarda tamanho dos eixos default
% Indica condicao inicial
xpos=-9;                                            % X inicial 
posicao=plot(xpos,xpos^2,'ro');                    % Mostra posicao inicial e armazena para animacao

axis(eixos);                                       % Garante posicao original dos eixos

% Loop para N passos ajustando com o GRADIENTE
for i = 1:N
   pause(t)                                       % Aguarda 1s para visualizacao da tela
   newpos=xpos - Alfa * (2*xpos);                 % Ajuste da posicao pela regra do gradiente
   if Rastro                                      % Indica se eh para plotar o rastro
       plot([xpos  newpos],[xpos^2  newpos^2],'r')% Plota o rastro
   end
   xpos=newpos;                                   % Atualiza posicao 

   set(posicao,'xdata',xpos,'ydata',xpos^2)       % Muda a posicao do PLOT do ponto

   set(titulo,'string',strcat('Caso 1:   Min = 0; y = x^2;   Loop = ',num2str(i),'/',num2str(N)))   % Ajusta titulo com o numero do LOOP
end
