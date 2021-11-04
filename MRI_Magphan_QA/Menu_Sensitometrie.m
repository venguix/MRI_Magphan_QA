function varargout = Menu_Sensitometrie(varargin)
% MENU_SENSITOMETRIE MATLAB code for Menu_Sensitometrie.fig
%      MENU_SENSITOMETRIE, by itself, creates a new MENU_SENSITOMETRIE or raises the existing
%      singleton*.
%
%      H = MENU_SENSITOMETRIE returns the handle to a new MENU_SENSITOMETRIE or the handle to
%      the existing singleton*.
%
%      MENU_SENSITOMETRIE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MENU_SENSITOMETRIE.M with the given input arguments.
%
%      MENU_SENSITOMETRIE('Property','Value',...) creates a new MENU_SENSITOMETRIE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Menu_Sensitometrie_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Menu_Sensitometrie_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Menu_Sensitometrie

% Last Modified by GUIDE v2.5 06-Jul-2016 15:02:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Menu_Sensitometrie_OpeningFcn, ...
                   'gui_OutputFcn',  @Menu_Sensitometrie_OutputFcn, ...
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


% --- Executes just before Menu_Sensitometrie is made visible.
function Menu_Sensitometrie_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Menu_Sensitometrie (see VARARGIN)

% Choose default command line output for Menu_Sensitometrie
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Menu_Sensitometrie wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Menu_Sensitometrie_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function menu_principale_Callback(hObject, eventdata, handles)
CQ_Automatique_ok
close(Menu_Sensitometrie);


% --------------------------------------------------------------------
function sensitometrie_Callback(hObject, eventdata, handles)
Menu_Sensitometrie
centerfig(gcf);
close(CQ_Automatique_ok);
