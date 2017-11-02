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
global X Y NroCasoDeAproximacion

% Cargo los valores a la tabla segun sea la aproximacion
switch NroCasoDeAproximacion
    case 1
        valores_tabla = [X Y];
        encabezado_tabla_detalles = {'X' 'Y'};
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
