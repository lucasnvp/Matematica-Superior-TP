clc

%inicio
Redondeo = input('ingrese la cantidad de decimales a trabajar :');
X = input('ingrese los valores de X entre [] y separados por ; :');
Y = input('ingrese los valores de Y entre [] y separados por ; :');
[filas,columnas] = size(X);
Nro = filas;
hiperbola_XY = filas;
Px = filas;
Error = filas;

% Armo la columna de 1/x
hiperbola_Xinv = round(X.^-1, Redondeo);
% Armo la columna de 1/x al cuadrado
hiperbola_X2 = round(X.^-2, Redondeo);
% Armo la columna de XY 
for i=1:filas
    Nro(i,1) = i;
    hiperbola_XY(i,1) = round(hiperbola_Xinv(i,1) * Y(i,1), Redondeo);
end

% Sumatorias de las columnas
sumatoriaX = round(sum(X(:,1)), Redondeo);
sumatoriaY = round(sum(Y(:,1)), Redondeo);
sumatoriaXinv = round(sum(hiperbola_Xinv(:,1)), Redondeo);
sumatoriaX2 = round(sum(hiperbola_X2(:,1)), Redondeo);
sumatoriaXY = round(sum(hiperbola_XY(:,1)), Redondeo);

% Sistemas de Ecuaciones
a = [filas, sumatoriaXinv;
    sumatoriaXinv, sumatoriaX2];
b = [sumatoriaY; sumatoriaXY];
resultado = a\b;
disp(resultado);

% Funcion P(x) = a+b*1/x
recorrido=0:0.2:10;
P = resultado(1,1) + (resultado(2,1)* (1./recorrido));

% Error
for i=1:filas
    FuncionApox = round(resultado(1,1) + (resultado(2,1)* (1./X(i,1))), Redondeo);
    Error(i,1) = round((FuncionApox - Y(i,1))^2, Redondeo);
    Px(i,1) = FuncionApox;
end

% Datos
datos = table(Nro,X,Y,hiperbola_Xinv,hiperbola_X2,hiperbola_XY,Px,Error);
disp(datos);

% Ploteos
plot(X,Y,'ro');
hold on
plot(recorrido, P, 'b-');
title('Grafica de la curva  P(x) = a+b*1/x');
xlabel('X');
ylabel('Y');
grid;
legend('Datos Experimentales','Curva Ajustada');

%fin