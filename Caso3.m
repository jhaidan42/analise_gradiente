function Caso3(t,Rastro,Alfa,N);
% Regra do gradiente ->  x = x - Alfa.Gradiente
%
%Sintaxe: Caso3(<t>,<Rastro>,<Alfa>,<N>);    Onde:  - t = tempo (s) para o pause (default = 0.2s)
%                                                        - Rastro = 1/0 indica se eh para plotar o rastro (default = 1)
%                                                        - Alfa eh o passo do gradiente (default = 0.005)
%                                                        - N eh o numero de loop (default = 50)
%
% Caso 3: y=x.^4-x.^3-3*x.^2;          dy/dx = 4*x.^3-3*x.^2-6*x

close all          % Fecha figuras abertas

% identifica parametros e/ou default
if nargin<4        % Usuario nao definiu N
    N=50;         % Assume valor default
end
if nargin<3        % Usuario nao definiu Alfa
    Alfa = 0.005;  % Assume valor default
end
if nargin<2        % Usuario nao definiu se eh para plotar o rastro
    Rastro = 1;    % Assume valor default, nao mostra o rastro
end
if nargin<1        % Usuario nao definiu o tempo para o pause
    t=0.2;         % Assume valor default
end

% Prepara grafico da funcao
x=-2:0.1:3;                                    % Define o range de x
y=x.^4-x.^3-3*x.^2;                                           % Calcula y
plot(x,y,'b');             % Gráfico para função unidimensional
hold on
grid on
titulo=title('Caso 3:   MIn = 1.656');
ylabel('Eixo Y')                                  % Nome do eixo Y
xlabel(strcat('Eixo X     Alfa =',num2str(Alfa))) % Nome do eixo X com indicacao de ALFA
eixos=axis;                                       % Guarda tamanho dos eixos default
% Indica condicao inicial
xpos=3;                                            % X inicial 
posicao=plot(xpos,xpos.^4-xpos.^3-3*xpos.^2,'ro');                    % Mostra posicao inicial e armazena para animacao

axis(eixos);                                       % Garante posicao original dos eixos

% Loop para N passos ajustando com o GRADIENTE
for i = 1:N
   pause(t)                                       % Aguarda 1s para visualizacao da tela
   newpos=xpos - Alfa * (4*xpos.^3-3*xpos.^2-6*xpos);                 % Ajuste da posicao pela regra do gradiente
   if Rastro                                      % Indica se eh para plotar o rastro
       plot([xpos  newpos],[xpos.^4-xpos.^3-3*xpos.^2  newpos.^4-newpos.^3-3*newpos.^2],'r')% Plota o rastro
   end
   xpos=newpos;                                   % Atualiza posicao 

   set(posicao,'xdata',xpos,'ydata',xpos.^4-xpos.^3-3*xpos.^2)       % Muda a posicao do PLOT do ponto

   set(titulo,'string',strcat('Caso 3:   MIn = 1.656; y = x.^4-x.^3-3*x.^2;   Loop = ',num2str(i),'/',num2str(N)))   % Ajusta titulo com o numero do LOOP
end
