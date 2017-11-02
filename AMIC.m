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

% Last Modified by GUIDE v2.5 01-Nov-2017 22:20:28

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

global X Y

set(handles.tabla_de_valores,'enable','off');
datos_tabla_inicial = get(handles.tabla_de_valores,'Data');
X = str2double(datos_tabla_inicial(:,1));
Y = str2double(datos_tabla_inicial(:,2));


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
function rmc_funcion_Callback(hObject, eventdata, handles)
% hObject    handle to rmc_funcion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function rmc_calculos_Callback(hObject, eventdata, handles)
global NroCasoDeAproximacion
NroCasoDeAproximacion = 1;
AMIC_DetallesDeCalculos
