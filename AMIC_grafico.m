function varargout = AMIC_grafico(varargin)
% AMIC_GRAFICO MATLAB code for AMIC_grafico.fig
%      AMIC_GRAFICO, by itself, creates a new AMIC_GRAFICO or raises the existing
%      singleton*.
%
%      H = AMIC_GRAFICO returns the handle to a new AMIC_GRAFICO or the handle to
%      the existing singleton*.
%
%      AMIC_GRAFICO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AMIC_GRAFICO.M with the given input arguments.
%
%      AMIC_GRAFICO('Property','Value',...) creates a new AMIC_GRAFICO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AMIC_grafico_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AMIC_grafico_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AMIC_grafico

% Last Modified by GUIDE v2.5 02-Nov-2017 16:04:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AMIC_grafico_OpeningFcn, ...
                   'gui_OutputFcn',  @AMIC_grafico_OutputFcn, ...
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


% --- Executes just before AMIC_grafico is made visible.
function AMIC_grafico_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AMIC_grafico (see VARARGIN)

% Choose default command line output for AMIC_grafico
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

%Ploteo
global X Y Px
plot(X,Y,'ro');
hold on
plot(X, Px, 'b-');
title('Grafica aproximante');
xlabel('X');
ylabel('Y');
grid;
legend('Datos Experimentales','Curva Ajustada');

% UIWAIT makes AMIC_grafico wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = AMIC_grafico_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
