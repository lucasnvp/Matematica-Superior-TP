clc

%inicio
Redondeo = input('ingrese la cantidad de decimales a trabajar :');
X = input('ingrese los valores de X entre [] y separados por ; :');
Y = input('ingrese los valores de Y entre [] y separados por ; :');
[filas,columnas] = size(X);
Nro = filas;
XY = filas;
Yln = filas;
Px = filas;
Error = filas;

% Armo la columna de x al cuadrado
X2 = round(X.^2, Redondeo);
% Armo la columna de Y=ln y
for i=1:filas
    Yln(i,1) = round(log(Y(i,1)),Redondeo);
end
% Armo la columna de XY 
for i=1:filas
    Nro(i,1) = i;
    XY(i,1) = round(X(i,1) * Yln(i,1), Redondeo);
end

% Sumatorias de las columnas
sumatoriaX = round(sum(X(:,1)), Redondeo);
sumatoriaX2 = round(sum(X2(:,1)), Redondeo);
sumatoriaYln = round(sum(Yln(:,1)), Redondeo);
sumatoriaXY = round(sum(XY(:,1)), Redondeo);

% Sistemas de Ecuaciones
a = [sumatoriaX2, sumatoriaX;
    sumatoriaX, filas];
b = [sumatoriaXY; sumatoriaYln];
resultado = a\b;
disp(resultado);

% Funcion P(x) = b*e^ax
recorrido=0:0.2:10;
P = exp(resultado(2,1))*exp(resultado(1,1)*recorrido);

% Error
for i=1:filas
    FuncionApox = round(exp(resultado(2,1))*exp(resultado(1,1)*X(i,1)), Redondeo);
    Error(i,1) = round((FuncionApox - Y(i,1))^2, Redondeo);
    Px(i,1) = FuncionApox;
end

% Datos
datos = table(Nro,X,Y,Yln,X2,XY,Px,Error);
disp(datos);

% Ploteos
plot(X,Y,'ro');
hold on
plot(recorrido, P, 'b-');
title('Grafica de la curva  P(x) = b*e^ax');
xlabel('X');
ylabel('Y');
grid;
legend('Datos Experimentales','Curva Ajustada');

%fin
