function varargout = AMIC_DetallesDeComparaciones(varargin)
% AMIC_DETALLESDECOMPARACIONES MATLAB code for AMIC_DetallesDeComparaciones.fig
%      AMIC_DETALLESDECOMPARACIONES, by itself, creates a new AMIC_DETALLESDECOMPARACIONES or raises the existing
%      singleton*.
%
%      H = AMIC_DETALLESDECOMPARACIONES returns the handle to a new AMIC_DETALLESDECOMPARACIONES or the handle to
%      the existing singleton*.
%
%      AMIC_DETALLESDECOMPARACIONES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AMIC_DETALLESDECOMPARACIONES.M with the given input arguments.
%
%      AMIC_DETALLESDECOMPARACIONES('Property','Value',...) creates a new AMIC_DETALLESDECOMPARACIONES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AMIC_DetallesDeComparaciones_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AMIC_DetallesDeComparaciones_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AMIC_DetallesDeComparaciones

% Last Modified by GUIDE v2.5 04-Nov-2017 09:57:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AMIC_DetallesDeComparaciones_OpeningFcn, ...
                   'gui_OutputFcn',  @AMIC_DetallesDeComparaciones_OutputFcn, ...
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


% --- Executes just before AMIC_DetallesDeComparaciones is made visible.
function AMIC_DetallesDeComparaciones_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AMIC_DetallesDeComparaciones (see VARARGIN)

% Choose default command line output for AMIC_DetallesDeComparaciones
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes AMIC_DetallesDeComparaciones wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% Variables Globales
global TablaDeValoresComparacion

valores_tabla = TablaDeValoresComparacion;
encabezado_tabla_detalles = {'X' 'Y' 'Recta' 'Parabola' 'Exponencial' 'Potencial' 'Hiperbola' 'Error Recta' 'Error Parabola' 'Error Exponencial' 'Error Potencial' 'Error Hiperbola'};

set(handles.tabla_de_comparaciones,'Data',valores_tabla);
set(handles.tabla_de_comparaciones,'ColumnName',encabezado_tabla_detalles);

% --- Outputs from this function are returned to the command line.
function varargout = AMIC_DetallesDeComparaciones_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
