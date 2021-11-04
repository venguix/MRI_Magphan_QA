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

[FileName Path]=uigetfile({'.*dcm'},'Abrir Imagen')
if isequal(FileName,0)
    return
else
    a=dicomread(strcat(Path,FileName));
    imshow(a,[]);
end

handles.direction=strcat(Path,FileName);
guidata(hObject,handles)


% --- Executes on button press in test.
function test_Callback(hObject, eventdata, handles)
I=getimage(handles.axes1);%,'CData'

e1=imellipse(gca,[124 244 27 27]);
e2=imellipse(gca,[364 244 27 27]);
e3=imellipse(gca,[244 125 27 27]);
e4=imellipse(gca,[244 360 27 27]);

% ROI1
rmsk1=e1.createMask;
rn1=sum(rmsk1(:));%elements
rm1=mean(I(rmsk1));
Intensity1=sprintf('%0.2f',rm1)

int1=num2str(rm1,'%0.2f');

% ROI2
rmsk2=e2.createMask;
rn2=sum(rmsk2(:));%elements
rm2=mean(I(rmsk2));
Intensity2=sprintf('%0.2f',rm2)

int2=num2str(rm2,'%0.2f');

% ROI3
rmsk3=e3.createMask;
rn3=sum(rmsk3(:));%elements
rm3=mean(I(rmsk3));
Intensity3=sprintf('%0.2f',rm3)

int3=num2str(rm3,'%0.2f');

% ROI4
rmsk4=e4.createMask;
rn4=sum(rmsk4(:));%elements
rm4=mean(I(rmsk4));
Intensity4=sprintf('%0.2f',rm4)

int4=num2str(rm4,'%0.2f');

%set(handles.tex2,'String',rm1);


set(handles.text2,'String',int1);
set(handles.text3,'String',int2);
set(handles.text4,'String',int3);
set(handles.text5,'String',int4);
guidata(hObject,handles);
%deploytool -->crear un ejecutable
