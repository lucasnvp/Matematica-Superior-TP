clc
clear all

%inicio
X = input('ingrese los valores de X entre [] y separados por ; :');
Y = input('ingrese los valores de Y entre [] y separados por ; :');
[filas,columnas] = size(X);
Nro = filas;
XY = filas;
X2Y = filas;
Error = filas;

% Armo la columna de x al cuadrado
X2 = X.^2;
% Armo la columna de x al cubo
X3 = X.^3;
% Armo la columna de x a la cuarta
X4 = X.^4;
% Armo la columna de XY 
for i=1:filas
    Nro(i,1) = i;
    XY(i,1) = X(i,1) * Y(i,1);
end
% Armo la columna de X2Y 
for i=1:filas
    X2Y(i,1) = X2(i,1) * Y(i,1);
end

% Sumatorias de las columnas
sumatoriaN = sum(Nro(:,1));
sumatoriaX = sum(X(:,1));
sumatoriaX2 = sum(X2(:,1));
sumatoriaX3 = sum(X3(:,1));
sumatoriaX4 = sum(X4(:,1));
sumatoriaY = sum(Y(:,1));
sumatoriaXY = sum(XY(:,1));
sumatoriaX2Y = sum(X2Y(:,1));

% Sistemas de Ecuaciones
a = [sumatoriaX4, sumatoriaX3, sumatoriaX2;
    sumatoriaX3, sumatoriaX2, sumatoriaX;
    sumatoriaX2, sumatoriaX, filas];
b = [sumatoriaX2Y ; sumatoriaXY; sumatoriaY];
resultado = a\b;
disp(resultado);

% Funcion P(x) = ax^2+bx+c
recorrido=0:20;
P = (resultado(1,1) * (recorrido.^2)) + resultado(2,1)*recorrido + resultado(3,1);

% Error
for i=1:filas
    Px = resultado(1,1)*(X(i,1)^2) + resultado(2,1)*X(i,1) + resultado(3,1);
    Error(i,1) = (Px - Y(i,1))^2;
end

% Datos
datos = table(Nro,X,Y,X2,X3,X4,XY,X2Y,Error);
disp(datos);

% Ploteos
plot(X,Y,'ro');
hold on
plot(recorrido, P, 'b-');
title('Grafica de la curva ax^2+bx+c');
xlabel('X');
ylabel('Y');
grid;
legend('Datos Experimentales','Curva Ajustada');

%fin