function varargout = Tolerances(varargin)
% TOLERANCES MATLAB code for Tolerances.fig
%      TOLERANCES, by itself, creates a new TOLERANCES or raises the existing
%      singleton*.
%
%      H = TOLERANCES returns the handle to a new TOLERANCES or the handle to
%      the existing singleton*.
%
%      TOLERANCES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TOLERANCES.M with the given input arguments.
%
%      TOLERANCES('Property','Value',...) creates a new TOLERANCES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Tolerances_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Tolerances_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Tolerances

% Last Modified by GUIDE v2.5 04-Aug-2016 12:46:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Tolerances_OpeningFcn, ...
                   'gui_OutputFcn',  @Tolerances_OutputFcn, ...
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


% --- Executes just before Tolerances is made visible.
function Tolerances_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Tolerances (see VARARGIN)

% Choose default command line output for Tolerances
handles.output = hObject;

global sensitometrie ep_coupe rsb piu distorsion rs bc

if sensitometrie >0.01
set(handles.text5,'String',sensitometrie)
set(handles.text13,'String',ep_coupe)
set(handles.text14,'String',rsb)
set(handles.text15,'String',piu)
set(handles.text16,'String',distorsion)
set(handles.text17,'String',rs)
set(handles.text18,'String',bc) 
    
else
set(handles.text5,'String',12)%Sensitometrie 
set(handles.text13,'String',11)%Epaisseur de coupe
set(handles.text14,'String',7.3)%RSB
set(handles.text15,'String',84)%Uniformite
set(handles.text16,'String',2)%Distorsion
set(handles.text17,'String',4)%Resolution spatiale
set(handles.text18,'String',4)%Resolution a bas contraste   




end

    

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Tolerances wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Tolerances_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
rsb=get(hObject,'String');
rsb=str2double(rsb);
set(handles.text14,'String',rsb)
set(handles.text27,'Visible','off')


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
piu=get(hObject,'String');
piu=str2double(piu);
set(handles.text15,'String',piu)
set(handles.text27,'Visible','off')


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
ep_coupe=get(hObject,'String');
ep_coupe=str2double(ep_coupe);
set(handles.text13,'String',ep_coupe)
set(handles.text27,'Visible','off')


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
rs=get(hObject,'String');
rs=str2double(rs);
set(handles.text17,'String',rs)
set(handles.text27,'Visible','off')


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
dist=get(hObject,'String');
dist=str2double(dist);
set(handles.text16,'String',dist)
set(handles.text27,'Visible','off')


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
b_cont=get(hObject,'String');
b_cont=str2double(b_cont);
set(handles.text18,'String',b_cont)
set(handles.text27,'Visible','off')


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
sensitometrie=get(hObject,'String');
sensitometrie=str2double(sensitometrie);
set(handles.text5,'String',sensitometrie)
set(handles.text27,'Visible','off')

% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
global sensitometrie ep_coupe rsb piu distorsion rs bc 
sensitometrie=get(handles.text5,'String');sensitometrie=str2double(sensitometrie);
ep_coupe=get(handles.text13,'String');ep_coupe=str2double(ep_coupe);
rsb=get(handles.text14,'String');rsb=str2double(rsb);
piu=get(handles.text15,'String');piu=str2double(piu);
distorsion=get(handles.text16,'String');distorsion=str2double(distorsion);
rs=get(handles.text17,'String');rs=str2double(rs);
bc=get(handles.text18,'String');bc=str2double(bc);
set(handles.text27,'Visible','on')


%datos={sensitometrie ep_coupe rsb piu distorsion rs BC};
%save('Tolerancias.mat','sensitometrie','ep_coupe','rsb','piu','distorsion','rs','BC')
%save('Tolerancias.mat','datos')

%Tolerance=table(sensitometrie,ep_coupe,rsb,piu,distorsion,rs,BC)
%assignin('base','Tolerance',Tolerance)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
close Tolerances


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
set(handles.text5,'String',12)
set(handles.text13,'String',11)
set(handles.text14,'String',7.3)
set(handles.text15,'String',84)
set(handles.text16,'String',2)
set(handles.text17,'String',4)
set(handles.text18,'String',4)
