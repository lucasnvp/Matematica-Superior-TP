function varargout = AMIC(varargin)
% AMIC MATLAB code for AMIC.fig
%      AMIC, by itself, creates a new AMIC or raises the existing
%      singleton*.
%
%      H = AMIC returns the handle to a new AMIC or the handle to
%      the existing singleton*.
%
%      AMIC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AMIC.M with the given input arguments.
%
%      AMIC('Property','Value',...) creates a new AMIC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AMIC_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AMIC_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AMIC

% Last Modified by GUIDE v2.5 02-Nov-2017 16:59:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AMIC_OpeningFcn, ...
                   'gui_OutputFcn',  @AMIC_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before AMIC is made visible.
function AMIC_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AMIC (see VARARGIN)

% Choose default command line output for AMIC
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes AMIC wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = AMIC_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function cantPuntos_Callback(hObject, eventdata, handles)
% hObject    handle to cantPuntos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cantPuntos as text
%        str2double(get(hObject,'String')) returns contents of cantPuntos as a double


% --- Executes during object creation, after setting all properties.
function cantPuntos_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cantPuntos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cantDecimales_Callback(hObject, eventdata, handles)
% hObject    handle to cantDecimales (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cantDecimales as text
%        str2double(get(hObject,'String')) returns contents of cantDecimales as a double


% --- Executes during object creation, after setting all properties.
function cantDecimales_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cantDecimales (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in set_default.
function set_default_Callback(hObject, eventdata, handles)
global Redondeo

Filas = str2double(get(handles.cantPuntos,'String'));
Redondeo = str2double(get(handles.cantDecimales,'String'));

set(handles.txtCantPuntos,'visible','off');
set(handles.cantPuntos,'visible','off');
set(handles.txtCantDecimales,'visible','off');
set(handles.cantDecimales,'visible','off');
set(handles.set_default,'visible','off');
set(handles.tabla_de_valores,'visible','on');
set(handles.tabla_de_valores,'Data',repmat({[]},Filas,2));
set(handles.btn_cargar_datos,'visible','on');




% --------------------------------------------------------------------
function Salir_Callback(hObject, eventdata, handles)
close(handles.output);


% --------------------------------------------------------------------
function nuevos_valores_Callback(hObject, eventdata, handles)
set(handles.txtCantPuntos,'visible','on');
set(handles.cantPuntos,'visible','on');
set(handles.txtCantDecimales,'visible','on');
set(handles.cantDecimales,'visible','on');
set(handles.set_default,'visible','on');
set(handles.tabla_de_valores,'visible','off');
set(handles.btn_cargar_datos,'visible','off');
set(handles.tabla_de_valores,'enable','on');

set(handles.rcm_funcion_aproximante, 'String', 'P(x) = A X + B');
set(handles.pcm_funcion_aproximante, 'String', 'P(x) = A X^2 + B X + C');
set(handles.ae_funcion_aproximante, 'String', 'P(x) = B e^AX');
set(handles.ap_funcion_aproximante, 'String', 'P(x) = B X^A');
set(handles.ah_funcion_aproximante, 'String', 'P(x) = AX / (B + X)');

% --- Executes on selection change in menu_aproximacion.
function menu_aproximacion_Callback(hObject, eventdata, handles)
% hObject    handle to menu_aproximacion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns menu_aproximacion contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menu_aproximacion


% --- Executes during object creation, after setting all properties.
function menu_aproximacion_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menu_aproximacion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_cargar_datos.
function btn_cargar_datos_Callback(hObject, eventdata, handles)

global X Y Redondeo
global matrizResultadoRecta
global matrizResultadoParabola
global matrizResultadoExponencial
global matrizResultadoPotencial
global matrizResultadoHiperbola

set(handles.tabla_de_valores,'enable','off');
datos_tabla_inicial = get(handles.tabla_de_valores,'Data');
X = str2double(datos_tabla_inicial(:,1));
Y = str2double(datos_tabla_inicial(:,2));

recta_minimos_cuadrados();
parabola_minimos_cuadrados();
exponencial_minimos_cuadrados();
potencial_minimos_cuadrados();
hiperbola_minimos_cuadrados();

funcionAproximanteRecta = sprintf('P(x) = %0.4f X + %0.4f', round(matrizResultadoRecta(1,1),Redondeo), round(matrizResultadoRecta(2,1),Redondeo));
set(handles.rcm_funcion_aproximante, 'String', funcionAproximanteRecta);

funcionAproximanteParabola = sprintf('P(x) = %0.4f X^2 + %0.4f X + %0.4f', round(matrizResultadoParabola(1,1),Redondeo), round(matrizResultadoParabola(2,1),Redondeo), round(matrizResultadoParabola(3,1),Redondeo));
set(handles.pcm_funcion_aproximante, 'String', funcionAproximanteParabola);

funcionAproximanteExponencial = sprintf('P(x) = %0.4f e^%0.4f X', round(exp(matrizResultadoExponencial(2,1)),Redondeo), round(matrizResultadoExponencial(1,1),Redondeo));
set(handles.ae_funcion_aproximante, 'String', funcionAproximanteExponencial);

funcionAproximantePotencial = sprintf('P(x) = %0.4f + %0.4f X ', round(10^matrizResultadoPotencial(2,1),Redondeo), round(matrizResultadoPotencial(1,1),Redondeo));
set(handles.ap_funcion_aproximante, 'String', funcionAproximantePotencial);

funcionAproximanteHiperbola = sprintf('P(x) = %0.4f + %0.4f / X ', round(matrizResultadoHiperbola(1,1),Redondeo), round(matrizResultadoPotencial(2,1),Redondeo));
set(handles.ah_funcion_aproximante, 'String', funcionAproximanteHiperbola);

% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function rmc_grafica_Callback(hObject, eventdata, handles)
global X Px matrizResultadoRecta
Px = matrizResultadoRecta(1,1) * X + matrizResultadoRecta(2,1);
AMIC_grafico

% --------------------------------------------------------------------
function rmc_calculos_Callback(hObject, eventdata, handles)
global NroCasoDeAproximacion
NroCasoDeAproximacion = 1;
AMIC_DetallesDeCalculos


% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_5_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_6_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function ah_grafica_Callback(hObject, eventdata, handles)
global X Px matrizResultadoHiperbola
Px = matrizResultadoHiperbola(1,1) + (matrizResultadoHiperbola(2,1)* (1./X));
AMIC_grafico


% --------------------------------------------------------------------
function ah_calculos_Callback(hObject, eventdata, handles)
global NroCasoDeAproximacion
NroCasoDeAproximacion = 5;
AMIC_DetallesDeCalculos

% --------------------------------------------------------------------
function ap_grafica_Callback(hObject, eventdata, handles)
global X Px matrizResultadoPotencial
Px = 10^matrizResultadoPotencial(1,1) * (X.^matrizResultadoPotencial(2,1));
AMIC_grafico

% --------------------------------------------------------------------
function ap_calculos_Callback(hObject, eventdata, handles)
global NroCasoDeAproximacion
NroCasoDeAproximacion = 4;
AMIC_DetallesDeCalculos

% --------------------------------------------------------------------
function ae_grafica_Callback(hObject, eventdata, handles)
global X Px matrizResultadoExponencial
Px = exp(matrizResultadoExponencial(2,1))*exp(matrizResultadoExponencial(1,1)*X);
AMIC_grafico


% --------------------------------------------------------------------
function ae_calculos_Callback(hObject, eventdata, handles)
global NroCasoDeAproximacion
NroCasoDeAproximacion = 3;
AMIC_DetallesDeCalculos

% --------------------------------------------------------------------
function pmc_grafica_Callback(hObject, eventdata, handles)
global X Px matrizResultadoParabola
Px = matrizResultadoParabola(1,1) * (X.^2) + matrizResultadoParabola(2,1) * X + matrizResultadoParabola(3,1);
AMIC_grafico


% --------------------------------------------------------------------
function pmc_calculos_Callback(hObject, eventdata, handles)
global NroCasoDeAproximacion
NroCasoDeAproximacion = 2;
AMIC_DetallesDeCalculos

function recta_minimos_cuadrados()

global X Y Redondeo
global TablaDeValoresRecta
global matrizResultadoRecta
global ErrorRecta PxRecta

[filas,~] = size(X);
recta_XY = filas;
PxRecta = filas;
ErrorRecta = filas;

% Armo la columna de x al cuadrado
recta_X2 = round(X.^2, Redondeo);
% Armo la columna de XY 
for i=1:filas
    recta_XY(i,1) = round(X(i,1) * Y(i,1),Redondeo);
end

% Tabla de valores
TablaDeValoresRecta = [X Y recta_X2 recta_XY];

% Sumatorias de las columnas
sumatoriaX = round(sum(X(:,1)),Redondeo);
sumatoriaX2 = round(sum(recta_X2(:,1)),Redondeo);
sumatoriaY = round(sum(Y(:,1)),Redondeo);
sumatoriaXY = round(sum(recta_XY(:,1)),Redondeo);

% Sistemas de Ecuaciones
a = [sumatoriaX2, sumatoriaX; 
    sumatoriaX, filas];
b = [sumatoriaXY ; sumatoriaY];
matrizResultadoRecta = a\b;

% Error
for i=1:filas
    FuncionApox = round(matrizResultadoRecta(1,1)*X(i,1) + matrizResultadoRecta(2,1), Redondeo);
    ErrorRecta(i,1) = round((FuncionApox - Y(i,1))^2, Redondeo);
    PxRecta(i,1) = FuncionApox;
end

function parabola_minimos_cuadrados()

global X Y Redondeo
global TablaDeValoresParabola
global matrizResultadoParabola
global ErrorParabola PxParabola

[filas,~] = size(X);
parabola_XY = filas;
parabola_X2Y = filas;
PxParabola = filas;
ErrorParabola = filas;

% Armo la columna de x al cuadrado
parabola_X2 = round(X.^2, Redondeo);
% Armo la columna de x al cubo
parabola_X3 = round(X.^3, Redondeo);
% Armo la columna de x a la cuarta
parabola_X4 = round(X.^4, Redondeo);
% Armo la columna de XY 
for i=1:filas
    parabola_XY(i,1) = round(X(i,1) * Y(i,1), Redondeo);
end
% Armo la columna de X2Y 
for i=1:filas
    parabola_X2Y(i,1) = round(parabola_X2(i,1) * Y(i,1), Redondeo);
end

% Tabla de valores
TablaDeValoresParabola = [X Y parabola_X2 parabola_X3 parabola_X4 parabola_XY parabola_X2Y];

% Sumatorias de las columnas
sumatoriaX = round(sum(X(:,1)), Redondeo);
sumatoriaX2 = round(sum(parabola_X2(:,1)), Redondeo);
sumatoriaX3 = round(sum(parabola_X3(:,1)), Redondeo);
sumatoriaX4 = round(sum(parabola_X4(:,1)), Redondeo);
sumatoriaY = round(sum(Y(:,1)), Redondeo);
sumatoriaXY = round(sum(parabola_XY(:,1)), Redondeo);
sumatoriaX2Y = round(sum(parabola_X2Y(:,1)), Redondeo);

% Sistemas de Ecuaciones
a = [sumatoriaX4, sumatoriaX3, sumatoriaX2;
    sumatoriaX3, sumatoriaX2, sumatoriaX;
    sumatoriaX2, sumatoriaX, filas];
b = [sumatoriaX2Y ; sumatoriaXY; sumatoriaY];
matrizResultadoParabola = a\b;

% Error
for i=1:filas
    FuncionApox = round(matrizResultadoParabola(1,1)*(X(i,1)^2) + matrizResultadoParabola(2,1)*X(i,1) + matrizResultadoParabola(3,1), Redondeo);
    ErrorParabola(i,1) = round((FuncionApox - Y(i,1))^2, Redondeo);
    PxParabola(i,1) = FuncionApox;
end

function exponencial_minimos_cuadrados()

global X Y Redondeo
global TablaDeValoresExponencial
global matrizResultadoExponencial
global ErrorExponencial PxExponencial

[filas,~] = size(X);
exponencial_XY = filas;
exponencial_Yln = filas;

% Armo la columna de x al cuadrado
exponencial_X2 = round(X.^2, Redondeo);
% Armo la columna de Y=ln y
for i=1:filas
    exponencial_Yln(i,1) = round(log(Y(i,1)),Redondeo);
end
% Armo la columna de XY 
for i=1:filas
    exponencial_XY(i,1) = round(X(i,1) * exponencial_Yln(i,1), Redondeo);
end

% Tabla de valores
TablaDeValoresExponencial = [X Y exponencial_X2 exponencial_Yln  exponencial_XY ];

% Sumatorias de las columnas
sumatoriaX = round(sum(X(:,1)), Redondeo);
sumatoriaX2 = round(sum(exponencial_X2(:,1)), Redondeo);
sumatoriaYln = round(sum(exponencial_Yln(:,1)), Redondeo);
sumatoriaXY = round(sum(exponencial_XY(:,1)), Redondeo);

% Sistemas de Ecuaciones
a = [sumatoriaX2, sumatoriaX;
    sumatoriaX, filas];
b = [sumatoriaXY; sumatoriaYln];
matrizResultadoExponencial = a\b;

% Error
for i=1:filas
    FuncionApox = round(exp(matrizResultadoExponencial(2,1))*exp(matrizResultadoExponencial(1,1)*X(i,1)), Redondeo);
    ErrorExponencial(i,1) = round((FuncionApox - Y(i,1))^2, Redondeo);
    PxExponencial(i,1) = FuncionApox;
end

function potencial_minimos_cuadrados()

global X Y Redondeo
global TablaDeValoresPotencial
global matrizResultadoPotencial
global ErrorPotencial PxPotencial

[filas,~] = size(X);
potencial_Xln = filas;
potencial_Yln = filas;
potencial_XY = filas;

% Armo la columna de X=ln x
for i=1:filas
    potencial_Xln(i,1) = round(log10(X(i,1)),Redondeo);
end
% Armo la columna de Y=ln y
for i=1:filas
    potencial_Yln(i,1) = round(log10(Y(i,1)),Redondeo);
end
% Armo la columna de XY 
for i=1:filas
    potencial_XY(i,1) = round(potencial_Xln(i,1) * potencial_Yln(i,1), Redondeo);
end
% Armo la columna de x al cuadrado
X2 = round(potencial_Xln.^2, Redondeo);

% Tabla de valores
TablaDeValoresPotencial = [X Y potencial_Xln X2 potencial_Yln  potencial_XY ];

% Sumatorias de las columnas
sumatoriaXln = round(sum(potencial_Xln(:,1)), Redondeo);
sumatoriaX2 = round(sum(X2(:,1)), Redondeo);
sumatoriaYln = round(sum(potencial_Yln(:,1)), Redondeo);
sumatoriaXY = round(sum(potencial_XY(:,1)), Redondeo);

% Sistemas de Ecuaciones
a = [filas, sumatoriaXln;
    sumatoriaXln, sumatoriaX2];
b = [sumatoriaYln; sumatoriaXY];
matrizResultadoPotencial = a\b;

% Error
for i=1:filas
    FuncionApox = round(10^matrizResultadoPotencial(1,1) * (X(i,1).^matrizResultadoPotencial(2,1)), Redondeo);
    ErrorPotencial(i,1) = round((FuncionApox - Y(i,1))^2, Redondeo);
    PxPotencial(i,1) = FuncionApox;
end

function hiperbola_minimos_cuadrados()

global X Y Redondeo
global TablaDeValoresHiperbola
global matrizResultadoHiperbola
global ErrorHiperbola PxHiperbola

[filas,~] = size(X);
hiperbola_XY = filas;

% Armo la columna de 1/x
hiperbola_Xinv = round(X.^-1, Redondeo);
% Armo la columna de 1/x al cuadrado
hiperbola_X2 = round(X.^-2, Redondeo);
% Armo la columna de XY 
for i=1:filas
    hiperbola_XY(i,1) = round(hiperbola_Xinv(i,1) * Y(i,1), Redondeo);
end

% Tabla de valores
TablaDeValoresHiperbola = [X Y hiperbola_Xinv hiperbola_X2 hiperbola_XY ];

% Sumatorias de las columnas
sumatoriaY = round(sum(Y(:,1)), Redondeo);
sumatoriaXinv = round(sum(hiperbola_Xinv(:,1)), Redondeo);
sumatoriaX2 = round(sum(hiperbola_X2(:,1)), Redondeo);
sumatoriaXY = round(sum(hiperbola_XY(:,1)), Redondeo);

% Sistemas de Ecuaciones
a = [filas, sumatoriaXinv;
    sumatoriaXinv, sumatoriaX2];
b = [sumatoriaY; sumatoriaXY];
matrizResultadoHiperbola = a\b;

% Error
for i=1:filas
    FuncionApox = round(matrizResultadoHiperbola(1,1) + (matrizResultadoHiperbola(2,1)* (1./X(i,1))), Redondeo);
    ErrorHiperbola(i,1) = round((FuncionApox - Y(i,1))^2, Redondeo);
    PxHiperbola(i,1) = FuncionApox;
end

% --------------------------------------------------------------------
function comparar_Callback(hObject, eventdata, handles)
global X Y TablaDeValoresComparacion
global NroCasoDeAproximacion
global ErrorRecta PxRecta
global ErrorParabola PxParabola
global ErrorExponencial PxExponencial
global ErrorPotencial PxPotencial
global ErrorHiperbola PxHiperbola

TablaDeValoresComparacion = [X Y PxRecta ErrorRecta PxParabola ErrorParabola PxExponencial ErrorExponencial PxPotencial ErrorPotencial PxHiperbola ErrorHiperbola];

NroCasoDeAproximacion = 6;
AMIC_DetallesDeCalculos
