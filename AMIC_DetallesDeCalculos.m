function varargout = AMIC_DetallesDeCalculos(varargin)
% AMIC_DETALLESDECALCULOS MATLAB code for AMIC_DetallesDeCalculos.fig
%      AMIC_DETALLESDECALCULOS, by itself, creates a new AMIC_DETALLESDECALCULOS or raises the existing
%      singleton*.
%
%      H = AMIC_DETALLESDECALCULOS returns the handle to a new AMIC_DETALLESDECALCULOS or the handle to
%      the existing singleton*.
%
%      AMIC_DETALLESDECALCULOS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AMIC_DETALLESDECALCULOS.M with the given input arguments.
%
%      AMIC_DETALLESDECALCULOS('Property','Value',...) creates a new AMIC_DETALLESDECALCULOS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AMIC_DetallesDeCalculos_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AMIC_DetallesDeCalculos_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AMIC_DetallesDeCalculos

% Last Modified by GUIDE v2.5 01-Nov-2017 22:25:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AMIC_DetallesDeCalculos_OpeningFcn, ...
                   'gui_OutputFcn',  @AMIC_DetallesDeCalculos_OutputFcn, ...
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


% --- Executes just before AMIC_DetallesDeCalculos is made visible.
function AMIC_DetallesDeCalculos_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AMIC_DetallesDeCalculos (see VARARGIN)

% Choose default command line output for AMIC_DetallesDeCalculos
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes AMIC_DetallesDeCalculos wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% Valores Globales
global X Y NroCasoDeAproximacion Redondeo

% Cargo los valores a la tabla segun sea la aproximacion
[filas,~] = size(X);
XY = filas;
switch NroCasoDeAproximacion
    case 1 % Caso de Recta
        % Armo la columna de x al cuadrado
        X2 = round(X.^2, Redondeo);
        % Armo la columna de XY 
        for i=1:filas
            XY(i,1) = round(X(i,1) * Y(i,1),Redondeo);
        end
        
        valores_tabla = [X Y X2 XY];
        encabezado_tabla_detalles = {'X' 'Y' 'X^2' 'X*Y'};
    
    case 2 % Caso de Parabola
        % Armo la columna de x al cuadrado
        X2 = round(X.^2, Redondeo);
        % Armo la columna de x al cubo
        X3 = round(X.^3, Redondeo);
        % Armo la columna de x a la cuarta
        X4 = round(X.^4, Redondeo);
        % Armo la columna de XY 
        for i=1:filas
            XY(i,1) = round(X(i,1) * Y(i,1),Redondeo);
        end
        
        valores_tabla = [X Y X2 X3 X4 XY];
        encabezado_tabla_detalles = {'X' 'Y' 'X^2' 'X^3' 'X^4' 'X*Y'};
        
    case 3 % Caso de Exponencial
        % Armo la columna de x al cuadrado
        X2 = round(X.^2, Redondeo);
        % Armo la columna de Y=ln y
        for i=1:filas
            Yln(i,1) = round(log(Y(i,1)),Redondeo);
        end
        % Armo la columna de XY 
        for i=1:filas
            XY(i,1) = round(X(i,1) * Yln(i,1), Redondeo);
        end
        
        valores_tabla = [X Y X2 Yln XY];
        encabezado_tabla_detalles = {'X' 'Y' 'X^2' 'Ln Y' 'X*Y'};
 
    case 4 % Caso de Potencial
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
            XY(i,1) = round(Xln(i,1) * Yln(i,1), Redondeo);
        end
        % Armo la columna de x al cuadrado
        X2 = round(Xln.^2, Redondeo);
        
        valores_tabla = [X Y Xln X2 Yln XY];
        encabezado_tabla_detalles = {'X' 'Y' 'Ln X' 'X^2' 'Ln Y' 'X*Y'};
        
    case 5 % Caso de Hiperbola
        
end

set(handles.tabla_de_calculos,'Data',valores_tabla);
set(handles.tabla_de_calculos,'ColumnName',encabezado_tabla_detalles);

% --- Outputs from this function are returned to the command line.
function varargout = AMIC_DetallesDeCalculos_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in salir_detalles.
function salir_detalles_Callback(hObject, eventdata, handles)
close(handles.output);
