function varargout = Guide1(varargin)
% GUIDE1 MATLAB code for Guide1.fig
%      GUIDE1, by itself, creates a new GUIDE1 or raises the existing
%      singleton*.
%
%      H = GUIDE1 returns the handle to a new GUIDE1 or the handle to
%      the existing singleton*.
%
%      GUIDE1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIDE1.M with the given input arguments.
%
%      GUIDE1('Property','Value',...) creates a new GUIDE1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Guide1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Guide1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Guide1

% Last Modified by GUIDE v2.5 24-Mar-2016 11:24:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Guide1_OpeningFcn, ...
                   'gui_OutputFcn',  @Guide1_OutputFcn, ...
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


% --- Executes just before Guide1 is made visible.
function Guide1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Guide1 (see VARARGIN)

% Choose default command line output for Guide1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Guide1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Guide1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in imagen.
function imagen_Callback(hObject, eventdata, handles)

[FileName Path]=uigetfile({'*.jpg;*.png;*.tif;.*dcm'},'Abrir Imagen')
if isequal(FileName,0)
    return
else
    a=dicomread(strcat(Path,FileName));
    imshow(a,[]);
end

handles.direction=strcat(Path,FileName);
guidata(hObject,handles)




% --- Executes on button press in doc.
function doc_Callback(hObject, eventdata, handles)

[FileName Path]=uigetfile({'*.doc;*.xlsx'},'Abrir Documento');

if isequal (FileName,0)
    return
else
    winopen(strcat(Path,FileName));
end



% --- Executes on button press in programa.
function programa_Callback(hObject, eventdata, handles)
[FileName Path]=uigetfile({'*.mat'},'Abrir documento');
if isequal(FileName,0)
    return
else
    winopen(strcat(Path,FileName));
end
  


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
