clc

%inicio
Redondeo = input('ingrese la cantidad de decimales a trabajar :');
X = input('ingrese los valores de X entre [] y separados por ; :');
Y = input('ingrese los valores de Y entre [] y separados por ; :');
[filas,columnas] = size(X);
Nro = filas;
Xln = filas;
Yln = filas;
XY = filas;
Error = filas;

% Armo la columna de X=ln x
for i=1:filas
    Xln(i,1) = round(log10(X(i,1)),Redondeo);
end
% Armo la columna de Y=ln y
for i=1:filas
    Yln(i,1) = round(log10(Y(i,1)),Redondeo);
end
% Armo la columna de XY 
for i=1:filas
    Nro(i,1) = i;
    XY(i,1) = round(Xln(i,1) * Yln(i,1), Redondeo);
end
% Armo la columna de x al cuadrado
X2 = round(Xln.^2, Redondeo);

% Sumatorias de las columnas
sumatoriaX = round(sum(X(:,1)), Redondeo);
sumatoriaXln = round(sum(Xln(:,1)), Redondeo);
sumatoriaX2 = round(sum(X2(:,1)), Redondeo);
sumatoriaYln = round(sum(Yln(:,1)), Redondeo);
sumatoriaXY = round(sum(XY(:,1)), Redondeo);

% Sistemas de Ecuaciones
a = [filas, sumatoriaXln;
    sumatoriaXln, sumatoriaX2];
b = [sumatoriaYln; sumatoriaXY];
resultado = a\b;
disp(resultado);

% Funcion P(x) = b*X^a
recorrido=0:10;
P = 10^resultado(1,1) * (recorrido.^resultado(2,1));

% Error

% Datos
datos = table(Nro,X,Y,Xln,Yln,X2,XY);
disp(datos);

% Ploteos
plot(X,Y,'ro');
hold on
plot(recorrido, P, 'b-');
title('Grafica de la curva  P(x) = b*X^a');
xlabel('X');
ylabel('Y');
grid;
legend('Datos Experimentales','Curva Ajustada');

%fin
