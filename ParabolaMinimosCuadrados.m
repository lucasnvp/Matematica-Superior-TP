clc

%inicio
Redondeo = input('ingrese la cantidad de decimales a trabajar :');
X = input('ingrese los valores de X entre [] y separados por ; :');
Y = input('ingrese los valores de Y entre [] y separados por ; :');
[filas,columnas] = size(X);
Nro = filas;
XY = filas;
X2Y = filas;
Px = filas;
Error = filas;

% Armo la columna de x al cuadrado
X2 = round(X.^2, Redondeo);
% Armo la columna de x al cubo
X3 = round(X.^3, Redondeo);
% Armo la columna de x a la cuarta
X4 = round(X.^4, Redondeo);
% Armo la columna de XY 
for i=1:filas
    Nro(i,1) = i;
    XY(i,1) = round(X(i,1) * Y(i,1), Redondeo);
end
% Armo la columna de X2Y 
for i=1:filas
    X2Y(i,1) = round(X2(i,1) * Y(i,1), Redondeo);
end

% Sumatorias de las columnas
sumatoriaX = round(sum(X(:,1)), Redondeo);
sumatoriaX2 = round(sum(X2(:,1)), Redondeo);
sumatoriaX3 = round(sum(X3(:,1)), Redondeo);
sumatoriaX4 = round(sum(X4(:,1)), Redondeo);
sumatoriaY = round(sum(Y(:,1)), Redondeo);
sumatoriaXY = round(sum(XY(:,1)), Redondeo);
sumatoriaX2Y = round(sum(X2Y(:,1)), Redondeo);

% Sistemas de Ecuaciones
a = [sumatoriaX4, sumatoriaX3, sumatoriaX2;
    sumatoriaX3, sumatoriaX2, sumatoriaX;
    sumatoriaX2, sumatoriaX, filas];
b = [sumatoriaX2Y ; sumatoriaXY; sumatoriaY];
resultado = a\b;
disp(resultado);

% Funcion P(x) = ax^2+bx+c
recorrido=0:0.2:10;
P = (resultado(1,1) * (recorrido.^2)) + resultado(2,1)*recorrido + resultado(3,1);

% Error
for i=1:filas
    FuncionApox = round(resultado(1,1)*(X(i,1)^2) + resultado(2,1)*X(i,1) + resultado(3,1), Redondeo);
    Error(i,1) = round((FuncionApox - Y(i,1))^2, Redondeo);
    Px(i,1) = FuncionApox;
end

% Datos
datos = table(Nro,X,Y,X2,X3,X4,XY,X2Y,Px,Error);
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