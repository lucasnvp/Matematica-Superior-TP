clc
clear all

%inicio
X = input('ingrese los valores de X entre [] y separados por ; :');
Y = input('ingrese los valores de Y entre [] y separados por ; :');
[filas,columnas] = size(X);
Nro = filas;
XY = filas;
Error = filas;

% Armo la columna de XY 
for i=1:filas
    Nro(i,1) = i;
    XY(i,1) = X(i,1) * Y(i,1);
end
% Armo la columna de x al cuadrado
X2 = X.^2;

% Sumatorias de las columnas
sumatoriaN = sum(Nro(:,1));
sumatoriaX = sum(X(:,1));
sumatoriaX2 = sum(X2(:,1));
sumatoriaY = sum(Y(:,1));
sumatoriaXY = sum(XY(:,1));

% Sistemas de Ecuaciones
a = [sumatoriaX2, sumatoriaX; sumatoriaX, filas];
b = [sumatoriaXY ; sumatoriaY];
resultado = a\b;
disp(resultado);

% Funcion P(x) = ax+b
recorrido=0:20;
P = resultado(1,1)*recorrido + resultado(2,1);

% Error
for i=1:filas
    Px = resultado(1,1)*i + resultado(2,1);
    Error(i,1) = (Y(i,1) - Px)^2;
end

% Datos
datos = table(Nro,X,Y,X2,XY,Error);
disp(datos);

% Ploteos
plot(X,Y,'ro');
hold on
plot(recorrido, P, 'b-');
title('Grafica de la recta');
xlabel('X');
ylabel('Y');
grid;
legend('Datos Experimentales','Curva Ajustada');
