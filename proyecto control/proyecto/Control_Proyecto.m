function varargout = Control_Proyecto(varargin)
% CONTROL_PROYECTO MATLAB code for Control_Proyecto.fig
%      CONTROL_PROYECTO, by itself, creates a new CONTROL_PROYECTO or raises the existing
%      singleton*.
%
%      H = CONTROL_PROYECTO returns the handle to a new CONTROL_PROYECTO or the handle to
%      the existing singleton*.
%
%      CONTROL_PROYECTO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CONTROL_PROYECTO.M with the given input arguments.
%
%      CONTROL_PROYECTO('Property','Value',...) creates a new CONTROL_PROYECTO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Control_Proyecto_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Control_Proyecto_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Control_Proyecto

% Last Modified by GUIDE v2.5 20-Jun-2022 22:29:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Control_Proyecto_OpeningFcn, ...
                   'gui_OutputFcn',  @Control_Proyecto_OutputFcn, ...
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


% --- Executes just before Control_Proyecto is made visible.
function Control_Proyecto_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Control_Proyecto (see VARARGIN)

% Choose default command line output for Control_Proyecto
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Control_Proyecto wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Control_Proyecto_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%% Observabilidad

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
A=get(handles.uitable1,'data');
A=str2double(A);

C=get(handles.uitable4,'data');
C=str2double(C);

o=det(obsv(A,C));

if  (o ~= 0)
    
    set(handles.mostrar,'string','El Sistema es Observable');
     
else
    set(handles.mostrar,'string','El Sistema es No Observable');
end


   
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% Funcion de transferencia

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)

filas=str2double(get(handles.fila,'String'));
A=get(handles.uitable1,'data');
A=str2double(A);
B=get(handles.uitable3,'data');
B=str2double(B);
C=get(handles.uitable4,'data');
C=str2double(C);
D=get(handles.uitable6,'data');
D=str2double(D);
[num,den]=ss2tf(A,B,C,D,1);
FT=evalc('tf(num,den)');
set(handles.mostrar,'String',num2str(FT)); 
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% Controlabilidad

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
A=get(handles.uitable1,'data');
A=str2double(A);

B=get(handles.uitable3,'data');
B=str2double(B);

c=det(ctrb(A,B));

if  (c ~= 0)
    
    set(handles.mostrar,'string','El Sistema es Controlable');
     
else
    set(handles.mostrar,'string','El Sistema es No Controlable');
end
 
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% Estabilidad del sistema

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
filas=str2double(get(handles.fila,'String'));
A=get(handles.uitable1,'data');
A=str2double(A);

B=get(handles.uitable3,'data');
B=str2double(B);

C=get(handles.uitable4,'data');
C=str2double(C);

D=get(handles.uitable6,'data');
D=str2double(D);
%% funcion de tranferencia 
[num,den]=ss2tf(A,B,C,D,1);
G=tf(num,den);

p=pole(G);
set(handles.mostrar2,'string', transpose(p));

  for i=1:length(p)
      
  if (p(i)>0)
     clc;
     set(handles.mostrar,'string','El Sistema es Inestable');
     break;
  else
      clc;
    set(handles.mostrar,'string','El Sistema es Estable');
  end
  
  end

% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%%Boton de Salir

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
close
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function colum_Callback(hObject, eventdata, handles)
% hObject    handle to colum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of colum as text
%        str2double(get(hObject,'String')) returns contents of colum as a double


% --- Executes during object creation, after setting all properties.
function colum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to colum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%Matrices

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
filas=str2double(get(handles.fila,'String'));
columnas=str2double(get(handles.fila,'String'));
%% Matriz A
tamano=cell(filas,filas);
tamano(:,:)={''};
set(handles.uitable1,'Data',tamano);
set(handles.uitable1,'ColumnEditable',true(1,columnas));
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% matriz B
tam1=cell(filas,1);
tam1(:,:)={''};
set(handles.uitable3,'Data',tam1);
set(handles.uitable3,'ColumnEditable',true(1,columnas));
%% matriz C
tam2=cell(1,filas);
tam2(:,:)={''};
set(handles.uitable4,'Data',tam2);
set(handles.uitable4,'ColumnEditable',true(1,columnas));
%% matriz D
tam3=cell(1,1);
tam3(:,:)={''};
set(handles.uitable6,'Data',tam3);
set(handles.uitable6,'ColumnEditable',true(1,columnas));
%% matriz de polos propuestos
tam4=cell(1,filas);
tam4(:,:)={''};
set(handles.uitable7,'Data',tam4);
set(handles.uitable7,'ColumnEditable',true(1,columnas));


function fila_Callback(hObject, eventdata, handles)
% hObject    handle to fila (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fila as text
%        str2double(get(hObject,'String')) returns contents of fila as a double


% --- Executes during object creation, after setting all properties.
function fila_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fila (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%% Respuesta al escalon en Lazo Abierto

% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)

filas=str2double(get(handles.fila,'String'));
A=get(handles.uitable1,'data');
A=str2double(A);

B=get(handles.uitable3,'data');
B=str2double(B);

C=get(handles.uitable4,'data');
C=str2double(C);

D=get(handles.uitable6,'data');
D=str2double(D);

[num,den]=ss2tf(A,B,C,D,1);
G=tf(num,den);

step(G); grid on; 
axes(handles.axes3);
title('Respuesta al Escalon Unitario Lazo Abierto');


% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% Observador

% --- Executes on button press in pushbutton13.
function pushbutton18_Callback(hObject, eventdata, handles)
p=get(handles.uitable7,'data');
p=str2double(p);

A=get(handles.uitable1,'data');
A=str2double(A);

B=get(handles.uitable3,'data');
B=str2double(B);
C=get(handles.uitable4,'data');
C=str2double(C);

o=det(obsv(A,C));

if  (o ~= 0)
    
     L=acker(A',C',p)';
     set(handles.mostrar,'String',num2str(L))

else
    set(handles.mostrar,'string','El Sistema es No Observable por lo cual no se pueden obtener las ganancias');
end

%% Controlador

% --- Executes on button press in pushbutton14.
function pushbutton17_Callback(hObject, eventdata, handles)

p=get(handles.uitable7,'data');
p=str2double(p);

A=get(handles.uitable1,'data');
A=str2double(A);

B=get(handles.uitable3,'data');
B=str2double(B);

C=get(handles.uitable4,'data');
C=str2double(C);

D=get(handles.uitable6,'data');
D=str2double(D);

c=det(ctrb(A,B));

if  (c ~= 0)
    
   K=acker(A,B,p);
set(handles.mostrar,'String',num2str(K))

else
    set(handles.mostrar,'string','El Sistema es No Controlable, por lo cual no se pueden obtener las ganancias');
end
