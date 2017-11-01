clc
clear all

%inicio
Redondeo = input('ingrese la cantidad de decimales a trabajar :');
X = input('ingrese los valores de X entre [] y separados por ; :');
Y = input('ingrese los valores de Y entre [] y separados por ; :');
[filas,columnas] = size(X);
Nro = filas;
XY = filas;
Error = filas;

% Armo la columna de x al cuadrado
X2 = round(X.^2, Redondeo);
% Armo la columna de XY 
for i=1:filas
    Nro(i,1) = i;
    XY(i,1) = round(X(i,1) * Y(i,1),Redondeo);
end

% Sumatorias de las columnas
sumatoriaN = round(sum(Nro(:,1)),Redondeo);
sumatoriaX = round(sum(X(:,1)),Redondeo);
sumatoriaX2 = round(sum(X2(:,1)),Redondeo);
sumatoriaY = round(sum(Y(:,1)),Redondeo);
sumatoriaXY = round(sum(XY(:,1)),Redondeo);

% Sistemas de Ecuaciones
a = [sumatoriaX2, sumatoriaX; sumatoriaX, filas];
b = [sumatoriaXY ; sumatoriaY];
resultado = a\b;
disp(resultado);

% Funcion P(x) = ax+b
recorrido=0:10;
P = resultado(1,1)*recorrido + resultado(2,1);

% Error
for i=1:filas
    Px = round(resultado(1,1)*X(i,1) + resultado(2,1), Redondeo);
    Error(i,1) = round((Px - Y(i,1))^2, Redondeo);
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

%fin
