function varargout = Guide_DICOM(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Guide_DICOM_OpeningFcn, ...
                   'gui_OutputFcn',  @Guide_DICOM_OutputFcn, ...
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


% --- Executes just before Guide_DICOM is made visible.
function Guide_DICOM_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Guide_DICOM (see VARARGIN)

% Choose default command line output for Guide_DICOM
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Guide_DICOM wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Guide_DICOM_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)

[FileName Path]=uigetfile({'.*dcm'},'Abrir Imagen','MultiSelect','on')
%if isequal(FileName,0)
 %   return
%else
 %   a=dicomread(strcat(Path,FileName));
  %  imshow(a,[]);
  for count=1:numel(FileName);
      imageref{count}=dicomread(fullfile(Path,FileName{count}));
      set(handles.popupmenu1,'String',FileName);   
  end
  
  
  M=cell(1,count);
  
  for cuenta=1:count%guardamos las imagenes en una matriz M
      M{cuenta}=imageref{cuenta};
      cuenta=cuenta+1;
  end
  
 set(handles.popupmenu1,'UserData',M);
 set(handles.slider3,'UserData',M)
  
 %PRUEBA SLIDER
imageNumber=count;
set(handles.slider3,'Min',1);
set(handles.slider3,'Max',imageNumber);
set(handles.slider3, 'Value',1);
set(handles.slider3,'SliderStep',[1/(imageNumber-1) , 10/(imageNumber-1)]);

imshow(imageref{1},[]);

handles.direction=strcat(Path,FileName);
guidata(hObject,handles)






% --- Executes on button press in test.
function test_Callback(hObject, eventdata, handles)
I=getimage(handles.axes1);%,'CData'

imstd=stdfilt(I,ones(3));%binarizacion
bw=imstd>20;
bw2=bwareaopen(bw,90);% Eliminar elementos con area inferior a P (pixels)
cc=bwconncomp(bw2);% Determinar objetos conectados
propied=regionprops(cc,'Area');% Area de cada componente
L=labelmatrix(cc);% Eliminar objetos mayores de 200
BW3=ismember(L,find([propied.Area]<=200));
propied2=regionprops(BW3);

% Calculos para la creacion de los ROIs
c1=struct2cell(propied2);
%Areas --> c1(1,1) c1(1,2)...
Mareas=[c1(1,1) c1(1,2) c1(1,3) c1(1,4)];
%Centroides
centro1=cell2mat(c1(2,1));
centro2=cell2mat(c1(2,2));
centro3=cell2mat(c1(2,3));
centro4=cell2mat(c1(2,4));
Mcentros=[centro1;centro2;centro3;centro4];
%BoundingBox
bounding1=cell2mat(c1(3,1));
bounding2=cell2mat(c1(3,2));
bounding3=cell2mat(c1(3,3));
bounding4=cell2mat(c1(3,4));
    %Radios
    radio1=bounding1(3);
    radio2=bounding2(3);
    radio3=bounding3(3);
    radio4=bounding4(3);
    %Posiciones
    posicion1=[bounding1(1) bounding1(2)];
    posicion2=[bounding2(1) bounding2(2)];
    posicion3=[bounding3(1) bounding3(2)];
    posicion4=[bounding4(1) bounding4(2)];
    
% Crear ROIs
e1=imellipse(gca,[posicion1(1)+4 posicion1(2)+4 radio1-8 radio1-8]);
e2=imellipse(gca,[posicion2(1)+4 posicion2(2)+4 radio2-8 radio2-8]);
e3=imellipse(gca,[posicion3(1)+4 posicion3(2)+4 radio3-8 radio3-8]);
e4=imellipse(gca,[posicion4(1)+4 posicion4(2)+4 radio4-8 radio4-8]);


%e1=imellipse(gca,[124 244 27 27]);
%e2=imellipse(gca,[364 244 27 27]);
%e3=imellipse(gca,[244 125 27 27]);
%e4=imellipse(gca,[244 360 27 27]);

% ROI1
rmsk1=e1.createMask;
rn1=sum(rmsk1(:));%elements
rm1=mean(I(rmsk1));
Intensity1=sprintf('%0.2f',rm1)

int1=num2str(rm1,'Intensity 1: %0.2f');

% ROI2
rmsk2=e2.createMask;
rn2=sum(rmsk2(:));%elements
rm2=mean(I(rmsk2));
Intensity2=sprintf('%0.2f',rm2)

int2=num2str(rm2,'Intensity 2: %0.2f');

% ROI3
rmsk3=e3.createMask;
rn3=sum(rmsk3(:));%elements
rm3=mean(I(rmsk3));
Intensity3=sprintf('%0.2f',rm3)

int3=num2str(rm3,'Intensity 3: %0.2f');

% ROI4
rmsk4=e4.createMask;
rn4=sum(rmsk4(:));%elements
rm4=mean(I(rmsk4));
Intensity4=sprintf('%0.2f',rm4)

int4=num2str(rm4,'Intensity 4: %0.2f');

%set(handles.tex2,'String',rm1);


set(handles.text2,'String',int1);
set(handles.text3,'String',int2);
set(handles.text4,'String',int3);
set(handles.text5,'String',int4);
guidata(hObject,handles);
%deploytool -->crear un ejecutable


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)


n=get(hObject,'Value');
v=get(hObject,'UserData');


matriz=cell2mat(v(n));

switch n
    case n
    imshow(matriz,[])

 
end

set(handles.slider3,'Value',n)

guidata(hObject,handles);




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



% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)

w=get(hObject,'Value');
set(handles.popupmenu1,'Value',w);

p=get(hObject,'UserData');

matriz=cell2mat(p(w));

switch w
    case w
    imshow(matriz,[])

 
end
guidata(hObject,handles);







% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
