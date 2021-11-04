function varargout = CQ_Automatique_ok(varargin)
% CQ_AUTOMATIQUE_OK MATLAB code for CQ_Automatique_ok.fig
%      CQ_AUTOMATIQUE_OK, by itself, creates a new CQ_AUTOMATIQUE_OK or raises the existing
%      singleton*.
%
%      H = CQ_AUTOMATIQUE_OK returns the handle to a new CQ_AUTOMATIQUE_OK or the handle to
%      the existing singleton*.
%
%      CQ_AUTOMATIQUE_OK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CQ_AUTOMATIQUE_OK.M with the given input arguments.
%
%      CQ_AUTOMATIQUE_OK('Property','Value',...) creates a new CQ_AUTOMATIQUE_OK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CQ_Automatique_ok_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CQ_Automatique_ok_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CQ_Automatique_ok

% Last Modified by GUIDE v2.5 05-Aug-2016 11:20:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CQ_Automatique_ok_OpeningFcn, ...
                   'gui_OutputFcn',  @CQ_Automatique_ok_OutputFcn, ...
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


% --- Executes just before CQ_Automatique_ok is made visible.
function CQ_Automatique_ok_OpeningFcn(hObject, eventdata, handles, varargin)

set(handles.edit4,'UserData',0)

scrsz=get(0,'ScreenSize');
pos_act=get(gcf,'Position');%Posicion actual
xr=scrsz(3)-pos_act(3);
xp=round(xr/2);
yr=scrsz(4)-pos_act(4);
yp=round(yr/2);




%centerfig;
%centerfig(gcf);
%set(handles.figure1,'Position',[0 0 scrsz(3) scrsz(4)]) %OKKKKK
set(handles.pushbutton12,'UserData',pos_act);
set(handles.figure1,'Position',[pos_act(1) pos_act(2) pos_act(3) pos_act(4)]) %OKKKKK

%AXES1
eje1=get(handles.axes1,'Position');
set(handles.axes1,'Position',[eje1(1) eje1(2) eje1(3) eje1(4)]);
%AXES2
eje2=get(handles.axes2,'Position') ;
set(handles.axes2,'Position',[eje2(1) eje2(2) eje2(3) eje2(4)]);
%Slider1
sli1=get(handles.slider1,'Position');
set(handles.slider1,'Position',[sli1(1) sli1(2) sli1(3) sli1(4)]);
%Slider2
sli2=get(handles.slider2,'Position');
set(handles.slider2,'Position',[sli2(1) sli2(2) sli2(3) sli2(4)]);
%Popupmenu
pop=get(handles.popupmenu1,'Position');
%set(handles.popupmenu1,'Position',[pop(1)+xp pop(2)+yp pop(3) pop(4)]);
%Pushbutton1
p1=get(handles.pushbutton1,'Position');
set(handles.pushbutton1,'Position',[p1(1) p1(2) p1(3) p1(4)]);
%Pushbutton2
p2=get(handles.pushbutton2,'Position');
set(handles.pushbutton2,'Position',[p2(1) p2(2) p2(3) p2(4)]);
%Pushbutton3
p3=get(handles.pushbutton3,'Position');
set(handles.pushbutton3,'Position',[p3(1) p3(2) p3(3) p3(4)]);
%Pushbutton4
p4=get(handles.pushbutton4,'Position');
set(handles.pushbutton4,'Position',[p4(1) p4(2) p4(3) p4(4)]);
%Pushbutton5
p5=get(handles.pushbutton5,'Position');
set(handles.pushbutton5,'Position',[p5(1) p5(2) p5(3) p5(4)]);
%Pushbutton6
p6=get(handles.pushbutton6,'Position');
set(handles.pushbutton6,'Position',[p6(1) p6(2) p6(3) p6(4)]);
%Pushbutton7
p7=get(handles.pushbutton7,'Position');
set(handles.pushbutton7,'Position',[p7(1) p7(2) p7(3) p7(4)]);
%Pushbutton8
p8=get(handles.pushbutton8,'Position');
set(handles.pushbutton8,'Position',[p8(1) p8(2) p8(3) p8(4)]);
%Pushbutton9
p9=get(handles.pushbutton9,'Position');
set(handles.pushbutton9,'Position',[p9(1) p9(2) p9(3) p9(4)]);
%Pushbutton10
p10=get(handles.pushbutton10,'Position');
set(handles.pushbutton10,'Position',[p10(1) p10(2) p10(3) p10(4)]);
%Uitable
ed2=get(handles.edit2,'Position');
set(handles.edit2,'Position',[ed2(1) ed2(2) ed2(3) ed2(4)]);
%edit2
tb=get(handles.uitable3,'Position');
set(handles.uitable3,'Position',[tb(1) tb(2) tb(3) tb(4)]);
%Text29
tx=get(handles.text29,'Position');
set(handles.text29,'Position',[tx(1) tx(2) tx(3) tx(4)]);
%Uibutton
ui=get(handles.uibuttongroup2,'Position');
set(handles.uibuttongroup2,'Position',[ui(1) ui(2) ui(3) ui(4)]);
%Botones
set(handles.radiobutton1,'Position',[ui(1)+15 ui(2)+207 120 10]);
set(handles.radiobutton2,'Position',[ui(1)+15 ui(2)+207-31 120 10]);
set(handles.radiobutton3,'Position',[ui(1)+15 ui(2)+207-62 120 10]);
set(handles.radiobutton4,'Position',[ui(1)+15 ui(2)+207-93 120 10]);
set(handles.radiobutton5,'Position',[ui(1)+15 ui(2)+207-124 130 10]);
set(handles.radiobutton6,'Position',[ui(1)+15 ui(2)+207-155 120 10]);
set(handles.radiobutton7,'Position',[ui(1)+15 ui(2)+207-186 120 10]);
%Pushbutton12
p12=get(handles.pushbutton12,'Position');
set(handles.pushbutton12,'Position',[p12(1) p12(2) p12(3) p12(4)]);
%Pushbutton13
p13=get(handles.pushbutton13,'Position');
set(handles.pushbutton13,'Position',[p13(1) p13(2) p13(3) p13(4)]);
%Pushbutton16
p16=get(handles.pushbutton16,'Position');
set(handles.pushbutton16,'Position',[p16(1) p16(2) p16(3) p16(4)]);
%Edit4
ed4=get(handles.edit4,'Position');
set(handles.edit4,'Position',[ed4(1) ed4(2) ed4(3) ed4(4)]);



movegui('center');
set(handles.figure1,'Resize','off'); %OKKKKKK

global sensitometrie ep_coupe rsb piu distorsion rs bc

sensitometrie=12;
ep_coupe=11;
rsb=7.3;
piu=84;
distorsion=2;
rs=4;
bc=4;



%Tolerances
%close (Tolerances)

% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CQ_Automatique_ok (see VARARGIN)

% Choose default command line output for CQ_Automatique_ok
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes CQ_Automatique_ok wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = CQ_Automatique_ok_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1
function pushbutton1_Callback(hObject, eventdata, handles)

axes(handles.axes1);
set(handles.edit7,'Visible','off')
set(handles.edit5,'Visible','off')
set(handles.edit8,'Visible','on')
set(handles.text31,'Visible','on')

[FileName Path]=uigetfile({'.*dcm'},'Abrir Imagen','MultiSelect','on');
Path;

for count=1:numel(FileName);
      imageref{count}=dicomread(fullfile(Path,FileName{count}));
      set(handles.popupmenu1,'String',FileName);   
      
end
  
  
  M=cell(1,count);
  
  for cuenta=1:count%guardamos las imagenes en una matriz M
      M{cuenta}=imageref{cuenta};
      cuenta=cuenta+1;
  end
 arch_imagen=fullfile(Path,FileName{1});
 info=dicominfo(arch_imagen);
 pxl_sz=getfield(info,'PixelSpacing');%Conversion pixels a mm--> pxl_size*X
 set(handles.pushbutton2,'UserData',pxl_sz);
 slice=getfield(info,'SliceThickness')
 set(handles.pushbutton5,'UserData',slice);
 bb=[0 0];
 set(handles.pushbutton3,'UserData',bb);
 
 
 set(handles.popupmenu1,'UserData',M);
 set(handles.slider1,'UserData',M)
 set(handles.text29,'String',1);
 

 
 
 %SLIDER
imageNumber=count;
set(handles.slider1,'Min',1);
set(handles.slider1,'Max',imageNumber);
set(handles.slider1, 'Value',1);
set(handles.slider1,'SliderStep',[1/(imageNumber-1) , 10/(imageNumber-1)]);

imshow(imageref{1},[]);

handles.direction=strcat(Path,FileName);
guidata(hObject,handles)



% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, ~, handles)

axes(handles.axes1);
n=get(hObject,'Value');
set(handles.text29,'String',n);
v=get(hObject,'UserData');


matriz=cell2mat(v(n));

switch n
    case n
    imshow(matriz,[])

 
end

set(handles.slider1,'Value',n)

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
function slider1_Callback(hObject, eventdata, handles)
axes(handles.axes1);
w=get(hObject,'Value');
set(handles.popupmenu1,'Value',w);
set(handles.text29,'String',w);
nombre=get(hObject,'String');

p=get(hObject,'UserData');

matriz=cell2mat(p(w));

switch w
    case w
    imshow(matriz,[])

end

guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
I=getimage(handles.axes1);
pxl_sz=get(hObject,'UserData');
centro=get(handles.pushbutton3,'UserData');
centro_x=centro(1);
centro_y=centro(2);
aa=get(handles.radiobutton1,'UserData');

if centro_x<=0
    warndlg('Centrer l image avant de commencer les tests POR FAVOR!')
else

switch aa
    
    case 1 %contraste
 
   axes(handles.axes1);
[ int1, int2, int3, int4 ] = fun_contraste2(I,centro_x,centro_y);


set(handles.text13,'String',int1);
set(handles.text12,'String',int2);
set(handles.text11,'String',int3);
set(handles.text10,'String',int4);

contraste={int1;int2;int3;int4};
%tabla_cont=table(int1,int2,int3,int4) % REVISAR
        
       %Espesor corte
       espesor_mm=get(handles.text14,'String');
       espesor={espesor_mm;[];[];[]};
       %RSB
       RSB1=get(handles.text18,'String');
       RSB2=get(handles.text30,'String');
       RSB={RSB1;RSB2;[];[]};
       %Uniformidad
       unif1=get(handles.text19,'String');
       unif={unif1;[];[];[]};
       %Distorsion
       d1=get(handles.text15,'String');d2=get(handles.text21,'String');
       d3=get(handles.text22,'String');d4=get(handles.text23,'String');
       d5=get(handles.text24,'String');d6=get(handles.text25,'String');
       d7=get(handles.text26,'String');d8=get(handles.text27,'String');
       
       dist1={d1;d5;d2;d6};
       dist2={d3;d7;d4;d8};
       
       blanco={[];[];[];[]};
       %Resolution Spatiale
       RS1=get(handles.text20,'String');
       RS={RS1;[];[];[]};
       %Bajo Contraste
       BC1=get(handles.text28,'String');
       BC={BC1;[];[];[]};
       
       set(handles.uitable3,'Data',[contraste blanco espesor blanco RSB blanco unif blanco dist1 blanco dist2 blanco RS blanco BC blanco])

       

guidata(hObject,handles);


    case 2 %espesor de corte
     
     
     %msg=['Placer la ROI pour mesurer la longueur d une des rampes,une fois que tu as ton roi ENTER pour confirmer'];
     %h=msgbox(msg,'Aide');
     %uiwait(h);
     figure;
     imshow(I,[]);
     
     %h=imdistline(gca)
     %api=iptgetapi(h)%quitar el texto de la linea
     %api.setLabelVisible(false);%quitar el texto de la linea
     %pos=wait(h);
     %dist1 = getDistance(h)
     
     %y=improfile;
    
line1x=[centro_x-57,centro_x-57];
line1y=[centro_y-25,centro_y+25];

line2x=[centro_x+54,centro_x+54];
line2y=[centro_y-21,centro_y+21];

line3x=[centro_x-28,centro_x+21];
line3y=[centro_y+57,centro_y+57];

line4x=[centro_x+28,centro_x-28];
line4y=[centro_y-56,centro_y-56];

y1=improfile(I,line1x,line1y);
y2=improfile(I,line2x,line2y);
y3=improfile(I,line3x,line3y);
y4=improfile(I,line4x,line4y);
     
     
     x=[0:40];
     
     a1=fwhm(x,y1,I);
     a2=fwhm(x,y2,I);
     a3=fwhm(x,y3,I);
     a4=fwhm(x,y4,I);
       
       
      
       talla=pxl_sz(1);
       espesor_mm1=talla*0.25*a1
       espesor_mm2=talla*0.25*a2
       espesor_mm3=talla*0.25*a3
       espesor_mm4=talla*0.25*a4
       
       espesor_mm=(espesor_mm1+espesor_mm2+espesor_mm3+espesor_mm4)/4
       
       
       
       figura_fwhm=figure(2),
       subplot(2,2,1);plot(y1);
       subplot(2,2,2);plot(y2);
       subplot(2,2,3);plot(y3);
       subplot(2,2,4);plot(y4);
       
        imtool(I,'Displayrange',[])
        
print(figura_fwhm,'fig_fwhm','-dpng')
%movefile('fig_fwhm.png','/Users/MacBookPro/Documents/MATLAB/Guide/html/')
        
        
   
       espesor_mm=num2str(espesor_mm,' %0.3f');
       
       set(handles.text14,'String',espesor_mm);
       espesor2=get(handles.text14,'String');
       espesor={espesor2;[];[];[]};
       
       %Contraste
       int1=get(handles.text13,'String');
       int2=get(handles.text12,'String');
       int3=get(handles.text11,'String');
       int4=get(handles.text10,'String');
       contraste={int1;int2;int3;int4};
       %RSB
       RSB1=get(handles.text18,'String');
       RSB2=get(handles.text30,'String');
       RSB={RSB1;RSB2;[];[]};
       %Uniformidad
       unif1=get(handles.text19,'String');
       unif={unif1;[];[];[]};
       %Distorsion
       d1=get(handles.text15,'String');d2=get(handles.text21,'String');
       d3=get(handles.text22,'String');d4=get(handles.text23,'String');
       d5=get(handles.text24,'String');d6=get(handles.text25,'String');
       d7=get(handles.text26,'String');d8=get(handles.text27,'String');
       
       dist1={d1;d5;d2;d6};
       dist2={d3;d7;d4;d8};
       %Resolution Spatiale
       RS1=get(handles.text20,'String');
       RS={RS1;[];[];[]};
       %Bajo Contraste
       BC1=get(handles.text28,'String');
       BC={BC1;[];[];[]};
       
       blanco={[];[];[];[]};
       
       set(handles.uitable3,'Data',[contraste blanco espesor blanco RSB blanco unif blanco dist1 blanco dist2 blanco RS blanco BC blanco])

       
    case 3 %RSB
       axes(handles.axes1);
   
       
       [RSB]=fun_RSB2(I,centro_x,centro_y);
       
       RSB=num2str(RSB,' %0.1f');
       set(handles.text18,'String',RSB);
       
       
       %Espesor corte
       espesor_mm=get(handles.text14,'String');
       espesor={espesor_mm;[];[];[]};
       %Contraste
       int1=get(handles.text13,'String');
       int2=get(handles.text12,'String');
       int3=get(handles.text11,'String');
       int4=get(handles.text10,'String');
       contraste={int1;int2;int3;int4};
       %RSB
       RSB1=get(handles.text18,'String');
       RSB2=get(handles.text30,'String');
       RSB={RSB1;RSB2;[];[]};
       %Uniformidad
       unif1=get(handles.text19,'String');
       unif={unif1;[];[];[]};
       %Distorsion
       d1=get(handles.text15,'String');d2=get(handles.text21,'String');
       d3=get(handles.text22,'String');d4=get(handles.text23,'String');
       d5=get(handles.text24,'String');d6=get(handles.text25,'String');
       d7=get(handles.text26,'String');d8=get(handles.text27,'String');
       
       dist1={d1;d5;d2;d6};
       dist2={d3;d7;d4;d8};
       %Resolution Spatiale
       RS1=get(handles.text20,'String');
       RS={RS1;[];[];[]};
       %Bajo Contraste
       BC1=get(handles.text28,'String');
       BC={BC1;[];[];[]};
       
       blanco={[];[];[];[]};
       
       set(handles.uitable3,'Data',[contraste blanco espesor blanco RSB blanco unif blanco dist1 blanco dist2 blanco RS blanco BC blanco])
        
        
    
    case 4 %Uniformidad
       
     axes(handles.axes1);   
        
    [unif] = fun_uniformite( I,centro_x,centro_y );
    %[PIU,mu,cen,sig]=fun_Magphan_2_Uniformity(I,pxl_sz)
    unif=num2str(unif,' %0.2f');
    set(handles.text19,'String',unif);
    
    %Espesor corte
       espesor_mm=get(handles.text14,'String')
       espesor={espesor_mm;[];[];[]};
       
       %Contraste
       int1=get(handles.text13,'String');
       int2=get(handles.text12,'String');
       int3=get(handles.text11,'String');
       int4=get(handles.text10,'String');
       contraste={int1;int2;int3;int4};
       %RSB
       RSB1=get(handles.text18,'String');
       RSB2=get(handles.text30,'String');
       RSB={RSB1;RSB2;[];[]};
       %Uniformidad
       unif1=get(handles.text19,'String');
       unif={unif1;[];[];[]};
       %Distorsion
       d1=get(handles.text15,'String');d2=get(handles.text21,'String');
       d3=get(handles.text22,'String');d4=get(handles.text23,'String');
       d5=get(handles.text24,'String');d6=get(handles.text25,'String');
       d7=get(handles.text26,'String');d8=get(handles.text27,'String');
       
       dist1={d1;d5;d2;d6};
       dist2={d3;d7;d4;d8};
       %Resolution Spatiale
       RS1=get(handles.text20,'String');
       RS={RS1;[];[];[]};
       %Bajo Contraste
       BC1=get(handles.text28,'String');
       BC={BC1;[];[];[]};
       
       blanco={[];[];[];[]};
       
       set(handles.uitable3,'Data',[contraste blanco espesor blanco RSB blanco unif blanco dist1 blanco dist2 blanco RS blanco BC blanco])
   
       
case 5 %distorsion
 axes(handles.axes1);
[ geo_dist_SFOV,geo_dist_LFOV, matriz ] = fun_distorsion( I,pxl_sz,centro_x,centro_y );
%set(handles.text15,'String',geo_dist_LFOV);
%set(handles.text17,'String',geo_dist_SFOV);

matriz1=num2str(matriz(1),' %0.2f');
matriz2=num2str(matriz(2),' %0.2f');
matriz3=num2str(matriz(3),' %0.2f');
matriz4=num2str(matriz(4),' %0.2f');
matriz5=num2str(matriz(5),' %0.2f');
matriz6=num2str(matriz(6),' %0.2f');
matriz7=num2str(matriz(7),' %0.2f');
matriz8=num2str(matriz(8),' %0.2f');


set(handles.text15,'String',matriz1);set(handles.text21,'String',matriz2);%12
set(handles.text22,'String',matriz3);set(handles.text23,'String',matriz4);%10
set(handles.text24,'String',matriz5);set(handles.text25,'String',matriz6);%8
set(handles.text26,'String',matriz7);set(handles.text27,'String',matriz8);%2
       %Espesor corte
       espesor_mm=get(handles.text14,'String');
       espesor={espesor_mm;[];[];[]};
       %Contraste
       int1=get(handles.text13,'String');
       int2=get(handles.text12,'String');
       int3=get(handles.text11,'String');
       int4=get(handles.text10,'String');
       contraste={int1;int2;int3;int4};
       %RSB
       RSB1=get(handles.text18,'String');
       RSB2=get(handles.text30,'String');
       RSB={RSB1;RSB2;[];[]};
       %Uniformidad
       unif1=get(handles.text19,'String');
       unif={unif1;[];[];[]};
       %Distorsion
       d1=get(handles.text15,'String');d2=get(handles.text21,'String');
       d3=get(handles.text22,'String');d4=get(handles.text23,'String');
       d5=get(handles.text24,'String');d6=get(handles.text25,'String');
       d7=get(handles.text26,'String');d8=get(handles.text27,'String');
       
       dist1={d1;d5;d2;d6};
       dist2={d3;d7;d4;d8};
       %Resolution Spatiale
       RS1=get(handles.text20,'String');
       RS={RS1;[];[];[]};
       %Bajo Contraste
       BC1=get(handles.text28,'String');
       BC={BC1;[];[];[]};
       
       blanco={[];[];[];[]};
       
       set(handles.uitable3,'Data',[contraste blanco espesor blanco RSB blanco unif blanco dist1 blanco dist2 blanco RS blanco BC blanco])



case 6 %resolucion espacial

   
    
%[count] = fun_resolucion_picos( I,centro_x,centro_y,pxl_sz );
[count] = fun_resolucion_picos_ok( I,centro_x,centro_y,pxl_sz );

set(handles.text20,'String',count);
RS1=get(handles.text20,'String');
RS={RS1;[];[];[]};

       %Espesor corte
       espesor_mm=get(handles.text14,'String');
       espesor={espesor_mm;[];[];[]};
       %Contraste
       int1=get(handles.text13,'String');
       int2=get(handles.text12,'String');
       int3=get(handles.text11,'String');
       int4=get(handles.text10,'String');
       contraste={int1;int2;int3;int4};
       %Uniformidad
       unif1=get(handles.text19,'String');
       unif={unif1;[];[];[]};
       %RSB
       RSB1=get(handles.text18,'String');
       RSB2=get(handles.text30,'String');
       RSB={RSB1;RSB2;[];[]};
       %Uniformidad
       unif1=get(handles.text19,'String');
       unif={unif1;[];[];[]};
       %Distorsion
       d1=get(handles.text15,'String');d2=get(handles.text21,'String');
       d3=get(handles.text22,'String');d4=get(handles.text23,'String');
       d5=get(handles.text24,'String');d6=get(handles.text25,'String');
       d7=get(handles.text26,'String');d8=get(handles.text27,'String');
       dist1={d1;d5;d2;d6};
       dist2={d3;d7;d4;d8};
       %Bajo Contraste
       BC1=get(handles.text28,'String');
       BC={BC1;[];[];[]};
       
       blanco={[];[];[];[]};
       
       set(handles.uitable3,'Data',[contraste blanco espesor blanco RSB blanco unif blanco dist1 blanco dist2 blanco RS blanco BC blanco])


        
    case 7
        %[contar] = fun_bas_contraste_ok( I,centro_x,centro_y );
        [contar] = bajo_contraste( I,centro_x,centro_y )
  set(handles.text28,'String',contar);
BC1=get(handles.text28,'String');
BC={BC1;[];[];[]};

       %Espesor corte
       espesor_mm=get(handles.text14,'String');
       espesor={espesor_mm;[];[];[]};
       %Contraste
       int1=get(handles.text13,'String');
       int2=get(handles.text12,'String');
       int3=get(handles.text11,'String');
       int4=get(handles.text10,'String');
       contraste={int1;int2;int3;int4};
       %Uniformidad
       unif1=get(handles.text19,'String');
       unif={unif1;[];[];[]};
       %RSB
       RSB1=get(handles.text18,'String');
       RSB2=get(handles.text30,'String');
       RSB={RSB1;RSB2;[];[]};
       %Uniformidad
       unif1=get(handles.text19,'String');
       unif={unif1;[];[];[]};
       %Distorsion
       d1=get(handles.text15,'String');d2=get(handles.text21,'String');
       d3=get(handles.text22,'String');d4=get(handles.text23,'String');
       d5=get(handles.text24,'String');d6=get(handles.text25,'String');
       d7=get(handles.text26,'String');d8=get(handles.text27,'String');
       dist1={d1;d5;d2;d6};
       dist2={d3;d7;d4;d8};
       %Resolution Spatiale
       RS1=get(handles.text20,'String');
       RS={RS1;[];[];[]};
       blanco={[];[];[];[]};
       
       set(handles.uitable3,'Data',[contraste blanco espesor blanco RSB blanco unif blanco dist1 blanco dist2 blanco RS blanco BC blanco])
    
end     
end    

guidata(hObject,handles);




% --- Executes during object creation, after setting all properties.
function uibuttongroup2_CreateFcn(hObject, eventdata, handles)

%set(hObject,'Title','Select Test'); %% TITULO DE LA CAJA

%set(hObject,'Position',[3 5 30 8]);%[xizda yabajo (punto mas bajo caja) ancho largo]

%handles.radiobutton1=uicontrol('Style','radiobutton','string','Contrast','Position',[30 140 100 10]);%[X Y num.caractres diametro boton]
%handles.radiobutton2=uicontrol('Style','radiobutton','string','Epaisseur de coupe','Position',[30 130 150 10]);
%handles.radiobutton3=uicontrol('Style','radiobutton','string','RSB','Position',[30 120 100 10]);
%handles.radiobutton4=uicontrol('Style','radiobutton','string','Uniformité','Position',[30 110 110 10]);
%handles.radiobutton5=uicontrol('Style','radiobutton','string','Distorsion Géométrique','Position',[30 100 150 10]);
%handles.radiobutton6=uicontrol('Style','radiobutton','string','Résolution spatiale','Position',[30 90 150 10]);
%handles.radiobutton7=uicontrol('Style','radiobutton','string','Rés. bas contrast','Position',[30 80 150 10]);
%handles.radiobutton8=uicontrol('Style','radiobutton','string','Rés. bas contrast','Position',[30 70 150 10]);

%handles.radiobutton1=uicontrol('Style','radiobutton','string','Contraste','Position',[35 450-25 100 10],'Units','Normalized')
handles.radiobutton1=uicontrol('Style','radiobutton','string','Sensitométrie','Position',[35 450-25 100 10]);%[X Y num.caractres diametro boton]
handles.radiobutton2=uicontrol('Style','radiobutton','string','Epaisseur de coupe','Position',[35 417-25 150 10]);
handles.radiobutton3=uicontrol('Style','radiobutton','string','RSB','Position',[35 384-25 100 10]);
handles.radiobutton4=uicontrol('Style','radiobutton','string','Uniformité','Position',[35 351-25 110 10]);
handles.radiobutton5=uicontrol('Style','radiobutton','string','Distorsion géométrique','Position',[35 318-25 150 10]);
handles.radiobutton6=uicontrol('Style','radiobutton','string','Résolution spatiale','Position',[35 285-25 150 10]);
handles.radiobutton7=uicontrol('Style','radiobutton','string','Rés. bas contraste','Position',[35 252-25 150 10]);



%handles.radio1=uicontrol('Style','togglebutton','string','Contrast','Position',[30 140 100 10]);%[X Y num.caractres diametro boton]
% Seleccion de botones

set(handles.radiobutton1,'Callback',{@radiobutton1_callback, handles});
set(handles.radiobutton2,'Callback',{@radiobutton2_callback, handles});
set(handles.radiobutton3,'Callback',{@radiobutton3_callback, handles});
set(handles.radiobutton4,'Callback',{@radiobutton4_callback, handles});
set(handles.radiobutton5,'Callback',{@radiobutton5_callback, handles});
set(handles.radiobutton6,'Callback',{@radiobutton6_callback, handles});
set(handles.radiobutton7,'Callback',{@radiobutton7_callback, handles});
%set(handles.radiobutton8,'Callback',{@radiobutton8_callback, handles});

set(handles.radiobutton1,'Value',0);
set(handles.radiobutton2,'Value',0);
set(handles.radiobutton3,'Value',0);
set(handles.radiobutton4,'Value',0);
set(handles.radiobutton5,'Value',0);
set(handles.radiobutton6,'Value',0);
set(handles.radiobutton7,'Value',0);
%set(handles.radiobutton8,'Value',0);

guidata(hObject,handles);



function radiobutton1_callback(hObject, event_data, handles)

set(handles.radiobutton2,'Value',0);
set(handles.radiobutton3,'Value',0);
set(handles.radiobutton4,'Value',0);
set(handles.radiobutton5,'Value',0);
set(handles.radiobutton6,'Value',0);
set(handles.radiobutton7,'Value',0);
%set(handles.radiobutton8,'Value',0);

t1=get(handles.radiobutton1,'Value');

switch t1
    case 1
        test=1;
    case 0
        test=0;
end
set(handles.radiobutton1,'UserData',test)



function radiobutton2_callback(hObject, event_data, handles)
set(handles.radiobutton1,'Value',0);
set(handles.radiobutton3,'Value',0);
set(handles.radiobutton4,'Value',0);
set(handles.radiobutton5,'Value',0);
set(handles.radiobutton6,'Value',0);
set(handles.radiobutton7,'Value',0);
%set(handles.radiobutton8,'Value',0);

t1=get(handles.radiobutton2,'Value');

switch t1
    case 1
        test=2;
    case 0
        test=0;
end
set(handles.radiobutton1,'UserData',test)





function radiobutton3_callback(hObject, event_data, handles)
set(handles.radiobutton1,'Value',0);
set(handles.radiobutton2,'Value',0);
set(handles.radiobutton4,'Value',0);
set(handles.radiobutton5,'Value',0);
set(handles.radiobutton6,'Value',0);
set(handles.radiobutton7,'Value',0);
%set(handles.radiobutton8,'Value',0);

t1=get(handles.radiobutton3,'Value');

switch t1
    case 1
        test=3;
    case 0
        test=0;
end
set(handles.radiobutton1,'UserData',test)




function radiobutton4_callback(hObject, event_data, handles)
set(handles.radiobutton1,'Value',0);
set(handles.radiobutton2,'Value',0);
set(handles.radiobutton3,'Value',0);
set(handles.radiobutton5,'Value',0);
set(handles.radiobutton6,'Value',0);
set(handles.radiobutton7,'Value',0);
%set(handles.radiobutton8,'Value',0);

t1=get(handles.radiobutton4,'Value');

switch t1
    case 1
        test=4;
    case 0
        test=0;
end
set(handles.radiobutton1,'UserData',test)




function radiobutton5_callback(hObject, event_data, handles)
set(handles.radiobutton1,'Value',0);
set(handles.radiobutton2,'Value',0);
set(handles.radiobutton3,'Value',0);
set(handles.radiobutton4,'Value',0);
set(handles.radiobutton6,'Value',0);
set(handles.radiobutton7,'Value',0);
%set(handles.radiobutton8,'Value',0);

t1=get(handles.radiobutton5,'Value');

switch t1
    case 1
        test=5;
    case 0
        test=0;
end
set(handles.radiobutton1,'UserData',test)



function radiobutton6_callback(hObject, event_data, handles)
set(handles.radiobutton1,'Value',0);
set(handles.radiobutton2,'Value',0);
set(handles.radiobutton3,'Value',0);
set(handles.radiobutton4,'Value',0);
set(handles.radiobutton5,'Value',0);
set(handles.radiobutton7,'Value',0);
%set(handles.radiobutton8,'Value',0);

t1=get(handles.radiobutton6,'Value');

switch t1
    case 1
        test=6;
    case 0
        test=0;
end
set(handles.radiobutton1,'UserData',test)




function radiobutton7_callback(hObject, event_data, handles)
set(handles.radiobutton1,'Value',0);
set(handles.radiobutton2,'Value',0);
set(handles.radiobutton3,'Value',0);
set(handles.radiobutton4,'Value',0);
set(handles.radiobutton5,'Value',0);
set(handles.radiobutton6,'Value',0);
%set(handles.radiobutton8,'Value',0);

t1=get(handles.radiobutton7,'Value');

switch t1
    case 1
        test=7;
    case 0
        test=0;
end
set(handles.radiobutton1,'UserData',test)






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


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
axes(handles.axes1);
I=getimage(handles.axes1);
pxl_sz=get(handles.pushbutton2,'UserData');


%[ centro ] = centro_auto( I )
[ centro ] = fun_centro( I,pxl_sz )

set(hObject,'UserData',centro);



guidata(hObject,handles)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
I=getimage(handles.axes1);
msg=['Place le point sur le point central de l image'];
h=msgbox(msg,'Aide');
uiwait(h);
figure;
imshow(I,[]); 

[centro_x,centro_y]=ginput(1);
centro=[centro_x centro_y];



set(handles.pushbutton3,'UserData',centro);
guidata(hObject,handles)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
tabla=get(handles.uitable3,'Data');%(fila,columna)
slice=get(hObject,'UserData');
global sensitometrie ep_coupe rsb piu distorsion rs bc

[ test_espesor,test_uniformidad,DistorsionL,DistorsionR,Comparacion_RSB,comparacion_RB,comparacion_RS ] = fun_comparacion( tabla,slice,sensitometrie,ep_coupe,rsb,piu,distorsion,rs,bc );

       %Bajo Contraste
       BC1=get(handles.text28,'String');
       BC={BC1;[];[];[]};
       %Espesor corte
       espesor_mm=get(handles.text14,'String');
       espesor={espesor_mm;[];[];[]};
       %Contraste
       int1=get(handles.text13,'String');
       int2=get(handles.text12,'String');
       int3=get(handles.text11,'String');
       int4=get(handles.text10,'String');
       contraste={int1;int2;int3;int4};
       %Uniformidad
       unif1=get(handles.text19,'String');
       unif={unif1;[];[];[]};
       %RSB
       RSB1=get(handles.text18,'String');
       RSB2=get(handles.text30,'String');
       RSB={RSB1;RSB2;[];[]};
       %Uniformidad
       unif1=get(handles.text19,'String');
       unif={unif1;[];[];[]};
       %Distorsion
       d1=get(handles.text15,'String');d2=get(handles.text21,'String');
       d3=get(handles.text22,'String');d4=get(handles.text23,'String');
       d5=get(handles.text24,'String');d6=get(handles.text25,'String');
       d7=get(handles.text26,'String');d8=get(handles.text27,'String');
       dist1={d1;d5;d2;d6};
       dist2={d3;d7;d4;d8};
       %Resolution Spatiale
       RS1=get(handles.text20,'String')
       RS={RS1;[];[];[]};
       blanco={[];[];[];[]};
       
         
       set(handles.uitable3,'Data',[contraste blanco espesor test_espesor RSB Comparacion_RSB unif test_uniformidad dist1 DistorsionL dist2 DistorsionR RS comparacion_RS BC comparacion_RB])

  X=get(handles.uitable3,'Data');
   
       
guidata(hObject,handles)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
axes(handles.axes2);

[FileName Path]=uigetfile({'.*dcm'},'Abrir Imagen','MultiSelect','on');

for count=1:numel(FileName);
      imageref{count}=dicomread(fullfile(Path,FileName{count}));  
end
  
  
  M=cell(1,count);
  
  for cuenta=1:count%guardamos las imagenes en una matriz M
      M{cuenta}=imageref{cuenta};
      cuenta=cuenta+1;
  end
  
   %SLIDER
imageNumber=count;
set(handles.slider2,'Min',1);
set(handles.slider2,'Max',imageNumber);
set(handles.slider2, 'Value',1);
set(handles.slider2,'SliderStep',[1/(imageNumber-1) , 10/(imageNumber-1)]);
set(handles.slider2,'UserData',M);
arch_imagen=fullfile(Path,FileName{1});

set(handles.edit2,'UserData',M);
set(handles.edit2,'String',1);

imshow(imageref{1},[]);


handles.direction=strcat(Path,FileName);
guidata(hObject,handles)



function edit2_Callback(hObject, eventdata, handles)
axes(handles.axes2);
a=get(hObject,'String');
a=str2double(a);
set(hObject,'Value',a);
n=get(hObject,'Value');
v=get(hObject,'UserData');



matriz=cell2mat(v(n));

switch n
    case n
    imshow(matriz,[])

 
end

set(handles.slider2,'Value',n)

guidata(hObject,handles);


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


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
axes(handles.axes2);
w=get(hObject,'Value');

p=get(hObject,'UserData');

matriz=cell2mat(p(w));

switch w
    case w
    imshow(matriz,[])

end
set(handles.edit2,'String',w); 


guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
axes(handles.axes2);

I=getimage(handles.axes2);
pxl_sz=get(handles.pushbutton2,'UserData');
centro=get(handles.pushbutton3,'UserData');
centro_x=centro(1);
centro_y=centro(2);

[RSB]=fun_RSB2(I,centro_x,centro_y);
       RSB=num2str(RSB,' %0.1f');
       set(handles.text30,'String',RSB);
       RSB2=get(handles.text30,'String');
       
       %Espesor corte
       espesor_mm=get(handles.text14,'String')
       espesor={espesor_mm;[];[];[]};
       %Contraste
       int1=get(handles.text13,'String');
       int2=get(handles.text12,'String');
       int3=get(handles.text11,'String');
       int4=get(handles.text10,'String');
       contraste={int1;int2;int3;int4};
       %RSB
       RSB1=get(handles.text18,'String');
       RSB={RSB1;RSB2;[];[]};
       %Uniformidad
       unif1=get(handles.text19,'String');
       unif={unif1;[];[];[]};
       %Distorsion
       d1=get(handles.text15,'String');d2=get(handles.text21,'String');
       d3=get(handles.text22,'String');d4=get(handles.text23,'String');
       d5=get(handles.text24,'String');d6=get(handles.text25,'String');
       d7=get(handles.text26,'String');d8=get(handles.text27,'String');
       
       dist1={d1;d5;d2;d6};
       dist2={d3;d7;d4;d8};
       %Resolution Spatiale
       RS1=get(handles.text20,'String');
       RS={RS1;[];[];[]};
       %Bajo Contraste
       BC1=get(handles.text28,'String');
       BC={BC1;[];[];[]};
       
       blanco={[];[];[];[]};
       
       set(handles.uitable3,'Data',[contraste blanco espesor blanco RSB blanco unif blanco dist1 blanco dist2 blanco RS blanco BC blanco])


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)

%resultados=get(handles.uitable3,'Data');

%C=getframe(handles.axes3)
%C=frame2im(C);
%frame_c=figure(1),imshow(C)
%print(frame_c,'contraste_frame','-dpng')
%movefile('contraste_frame.png','/Users/MacBookPro/Documents/MATLAB/Guide/html/')

%Ep=getframe(handles.axes4)
%Ep=frame2im(Ep);
%frame_Ep=figure(1),imshow(Ep)
%print(frame_Ep,'Ep_frame','-dpng')
%movefile('Ep_frame.png','/Users/MacBookPro/Documents/MATLAB/Guide/html/')

%RB=getframe(handles.axes5)
%RB=frame2im(RB);
%frame_RB=figure(1),imshow(RB)
%print(frame_RB,'RB_frame','-dpng')
%movefile('RB_frame.png','/Users/MacBookPro/Documents/MATLAB/Guide/html/')

%U=getframe(handles.axes6)
%U=frame2im(U);
%U=imresize(U,1.2);
%frame_U=figure(1),imshow(U)
%print(frame_U,'U_frame','-dpng')
%movefile('U_frame.png','/Users/MacBookPro/Documents/MATLAB/Guide/html/')

%D=getframe(handles.axes7)
%D=frame2im(D);
%D=imresize(D,1.2);
%frame_D=figure(1),imshow(D)
%print(frame_D,'D_frame','-dpng')
%movefile('D_frame.png','/Users/MacBookPro/Documents/MATLAB/Guide/html/')

%RS=getframe(handles.axes8)
%RS=frame2im(RS);
%RS=imresize(RS,1.2);
%frame_RS=figure(1),imshow(RS)
%print(frame_RS,'RS_frame','-dpng')
%movefile('RS_frame.png','/Users/MacBookPro/Documents/MATLAB/Guide/html/')

%RC=getframe(handles.axes9)
%RC=frame2im(RC);
%RC=imresize(RC,1.2);
%frame_RC=figure(1),imshow(RC)
%print(frame_RC,'RC_frame','-dpng')
%movefile('RC_frame.png','/Users/MacBookPro/Documents/MATLAB/Guide/html/')

%[mydoc]=fun_publicar(resultados);



%mydoc=publish('Publicar.m','pdf');
%macopen('html/Publicar.pdf');
%mydoc; %Path donde esta guardado el archivo pdf


%[ a ] = fun_publicar(resultados)


%options_doc_nocode.format='pdf';
%options_doc_nocode.showCode=false;


%publish('CQ_Automatique_ok.m',options_doc_nocode)
%macopen('html/CQ_Automatique_ok.pdf')

%Espesor corte
       espesor_mm=get(handles.text14,'String')
       
       Ep={espesor_mm;[];[];[]};
       %Contraste
       int1=get(handles.text13,'String');
       int2=get(handles.text12,'String');
       int3=get(handles.text11,'String');
       int4=get(handles.text10,'String');
       S={int1;int2;int3;int4};
       %RSB
       RSB1=get(handles.text18,'String');
       RSB2=get(handles.text30,'String');
       RSB={RSB1;RSB2;[];[]};
       %Uniformidad
       unif1=get(handles.text19,'String');
       PIU={unif1;[];[];[]};
       %Distorsion
       d1=get(handles.text15,'String');d2=get(handles.text21,'String');
       d3=get(handles.text22,'String');d4=get(handles.text23,'String');
       d5=get(handles.text24,'String');d6=get(handles.text25,'String');
       d7=get(handles.text26,'String');d8=get(handles.text27,'String');
       distL={d1;d5;d2;d6};
       distR={d3;d7;d4;d8};
       %Resolution Spatiale
       RS1=get(handles.text20,'String');
       RS={RS1;[];[];[]};
       %Bajo Contraste
       BC1=get(handles.text28,'String');
       BC={BC1;[];[];[]};
       
       
%T=table(S,Ep,RSB,PIU,distL,distR,RS,BC);
%assignin('base','T',T)
RS_V=get(handles.edit7,'String');Resolution_Spatiale_Visuelle=str2num(RS_V);
BC_V=get(handles.edit5,'String');Resolution_Bas_Contraste_Visuel=str2num(BC_V);

comentarios=get(handles.edit8,'String');
assignin('base','comentarios',comentarios)

Parametres_Geometriques=table(Ep,distL,distR)
assignin('base','Parametres_Geometriques',Parametres_Geometriques)
Parametres_Qualite_Image=table(S,RSB,PIU,RS,BC)
assignin('base','Parametres_Qualite_Image',Parametres_Qualite_Image)
Parametres_Visuels=table(Resolution_Spatiale_Visuelle,Resolution_Bas_Contraste_Visuel)
assignin('base','Parametres_Visuels',Parametres_Visuels)


options_doc_nocode.format='pdf';
options_doc_nocode.showCode=false;
publish('Publicar.m',options_doc_nocode)
macopen('html/Publicar.pdf')



% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)

helpdlg(sprintf('1. Charger sequence dans l axe principale. \n2. Selectioner l image à analizer \n3. Crocher le type de test. \n4. RUN. \n5.Une fois tous les tet ont été faits clicker sur TEST pour analizer les données. \n6. PUBLISH pour créer un pdf avec les résultats du contrôle. \n7. Pour le test RSB charger la deuxième séquence dans l axe secondaire, se placer sur la même image où on a fait le premier test de RSB et clicker sur Comparer RSB. \n\nCe logiciel à était crée exclusivement pour le contrôle qualité de l IRM 1.5T Siemens de l Institut de Cancérologie de Lorraine et pour un fantôme Magphan Cylindrique de The Phantom Laboratory® \n\nLogiciel crée par Vicente Enguix - vtenguix@gmail.com'))




%set(handles.figure1,'Position',posicion);

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
msgbox(sprintf('FOV: 250x250mm, Matrice: 256x256, Epaisseur de Coupe: 2mm, Space entre coupes: 11mm  , NEX:1 \nT1--> TE: 20ms, TR: 500 ms \nT2--> TE: 77ms TR: 10000ms','Paramètres Acquisition.'))



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


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


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
securite=get(handles.edit4,'UserData');

if securite < 1
    %set(handles.figure1,'Resize','on');
scrsz=get(0,'ScreenSize');
pos_act=get(hObject,'UserData');%Posicion actual
xr=scrsz(3)-pos_act(3);
xp=round(xr/2);
yr=scrsz(4)-pos_act(4);
yp=round(yr/2);

%centerfig;
%centerfig(gcf);

set(handles.figure1,'Position',[0 0 scrsz(3) scrsz(4)])

%AXES1
eje1=get(handles.axes1,'Position');
set(handles.axes1,'Position',[eje1(1)+xp eje1(2)+yp eje1(3) eje1(4)]);
%AXES2
eje2=get(handles.axes2,'Position') ;
set(handles.axes2,'Position',[eje2(1)+xp eje2(2)+yp eje2(3) eje2(4)]);
%Slider1
sli1=get(handles.slider1,'Position');
set(handles.slider1,'Position',[sli1(1)+xp sli1(2)+yp sli1(3) sli1(4)]);
%Slider2
sli2=get(handles.slider2,'Position');
set(handles.slider2,'Position',[sli2(1)+xp sli2(2)+yp sli2(3) sli2(4)]);
%Popupmenu
pop=get(handles.popupmenu1,'Position');
set(handles.popupmenu1,'Position',[pop(1)+xp pop(2)+yp pop(3) pop(4)]);
%Pushbutton1
p1=get(handles.pushbutton1,'Position');
set(handles.pushbutton1,'Position',[p1(1)+xp p1(2)+yp p1(3) p1(4)]);
%Pushbutton2
p2=get(handles.pushbutton2,'Position');
set(handles.pushbutton2,'Position',[p2(1)+xp p2(2)+yp p2(3) p2(4)]);
%Pushbutton3
p3=get(handles.pushbutton3,'Position');
set(handles.pushbutton3,'Position',[p3(1)+xp p3(2)+yp p3(3) p3(4)]);
%Pushbutton4
p4=get(handles.pushbutton4,'Position');
set(handles.pushbutton4,'Position',[p4(1)+xp p4(2)+yp p4(3) p4(4)]);
%Pushbutton5
p5=get(handles.pushbutton5,'Position');
set(handles.pushbutton5,'Position',[p5(1)+xp p5(2)+yp p5(3) p5(4)]);
%Pushbutton6
p6=get(handles.pushbutton6,'Position');
set(handles.pushbutton6,'Position',[p6(1)+xp p6(2)+yp p6(3) p6(4)]);
%Pushbutton7
p7=get(handles.pushbutton7,'Position');
set(handles.pushbutton7,'Position',[p7(1)+xp p7(2)+yp p7(3) p7(4)]);
%Pushbutton8
p8=get(handles.pushbutton8,'Position');
set(handles.pushbutton8,'Position',[p8(1)+xp p8(2)+yp p8(3) p8(4)]);
%Pushbutton9
p9=get(handles.pushbutton9,'Position');
set(handles.pushbutton9,'Position',[p9(1)+xp p9(2)+yp p9(3) p9(4)]);
%Pushbutton10
p10=get(handles.pushbutton10,'Position');
set(handles.pushbutton10,'Position',[p10(1)+xp p10(2)+yp p10(3) p10(4)]);
%edit2
ed2=get(handles.edit2,'Position');
set(handles.edit2,'Position',[ed2(1)+xp ed2(2)+yp ed2(3) ed2(4)]);
%uitable
tb=get(handles.uitable3,'Position');
set(handles.uitable3,'Position',[tb(1)+xp tb(2)+yp tb(3) tb(4)]);
%Text29
tx=get(handles.text29,'Position');
set(handles.text29,'Position',[tx(1)+xp tx(2)+yp tx(3) tx(4)]);
%Uibutton
ui=get(handles.uibuttongroup2,'Position');
set(handles.uibuttongroup2,'Position',[ui(1)+xp ui(2)+yp ui(3) ui(4)]);
%Botones
set(handles.radiobutton1,'Position',[ui(1)+xp+15 ui(2)+yp+207 120 10]);
set(handles.radiobutton2,'Position',[ui(1)+xp+15 ui(2)+yp+207-31 120 10]);
set(handles.radiobutton3,'Position',[ui(1)+xp+15 ui(2)+yp+207-62 120 10]);
set(handles.radiobutton4,'Position',[ui(1)+xp+15 ui(2)+yp+207-93 120 10]);
set(handles.radiobutton5,'Position',[ui(1)+xp+15 ui(2)+yp+207-124 130 10]);
set(handles.radiobutton6,'Position',[ui(1)+xp+15 ui(2)+yp+207-155 120 10]);
set(handles.radiobutton7,'Position',[ui(1)+xp+15 ui(2)+yp+207-186 120 10]);
%Pushbutton12
p12=get(handles.pushbutton12,'Position');
set(handles.pushbutton12,'Position',[p12(1)+xp p12(2)+yp p12(3) p12(4)]);
%Pushbutton13
p13=get(handles.pushbutton13,'Position');
set(handles.pushbutton13,'Position',[p13(1)+xp p13(2)+yp p13(3) p13(4)]);
%Pushbutton16
p16=get(handles.pushbutton16,'Position');
set(handles.pushbutton16,'Position',[p16(1)+xp p16(2)+yp p16(3) p16(4)]);
%Pushbutton15
p15=get(handles.pushbutton15,'Position');
set(handles.pushbutton15,'Position',[p15(1)+xp p15(2)+yp p15(3) p15(4)]);
%edit4
ed4=get(handles.edit4,'Position');
set(handles.edit4,'Position',[ed4(1)+xp ed4(2)+yp ed4(3) ed4(4)]);
%edit5
ed5=get(handles.edit5,'Position');
set(handles.edit5,'Position',[ed5(1)+xp ed5(2)+yp ed5(3) ed5(4)]);
%edit7
ed7=get(handles.edit7,'Position');
set(handles.edit7,'Position',[ed7(1)+xp ed7(2)+yp ed7(3) ed7(4)]);
%edit8
ed8=get(handles.edit8,'Position');
set(handles.edit8,'Position',[ed8(1)+xp ed8(2)+yp ed8(3) ed8(4)]);
%Text31
tx2=get(handles.text31,'Position');
set(handles.text31,'Position',[tx2(1)+xp tx2(2)+yp tx2(3) tx2(4)]);
%Unibutton3
ui3=get(handles.uibuttongroup3,'Position');
set(handles.uibuttongroup3,'Position',[ui3(1)+xp ui3(2)+yp ui3(3) ui3(4)]);
%Unibutton4
ui4=get(handles.uibuttongroup4,'Position');
set(handles.uibuttongroup4,'Position',[ui4(1)+xp ui4(2)+yp ui4(3) ui4(4)]);
%Unibutton5
ui5=get(handles.uibuttongroup5,'Position');
set(handles.uibuttongroup5,'Position',[ui5(1)+xp ui5(2)+yp ui5(3) ui5(4)]);
%Unibutton6
ui6=get(handles.uibuttongroup6,'Position');
set(handles.uibuttongroup6,'Position',[ui6(1)+xp ui6(2)+yp ui6(3) ui6(4)]);
%Unibutton8
ui8=get(handles.uibuttongroup8,'Position');
set(handles.uibuttongroup8,'Position',[ui8(1)+xp ui8(2)+yp ui8(3) ui8(4)]);

movegui('center');
set(handles.figure1,'Resize','off'); %OKKKKKK
set(handles.edit4,'UserData',1);
else
    securite=1;
end





% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
securite=get(handles.edit4,'UserData');
 

if securite > 0 %securite=1
    
scrsz=get(0,'ScreenSize');
pos_act=get(handles.pushbutton12,'UserData');%Posicion actual
xr=scrsz(3)-pos_act(3);
xp=round(xr/2);
yr=scrsz(4)-pos_act(4);
yp=round(yr/2);

set(handles.figure1,'Position',[pos_act(1) pos_act(2) pos_act(3) pos_act(4)])
%AXES1
eje1=get(handles.axes1,'Position');
set(handles.axes1,'Position',[eje1(1)-xp eje1(2)-yp eje1(3) eje1(4)]);
%AXES2
eje2=get(handles.axes2,'Position') ;
set(handles.axes2,'Position',[eje2(1)-xp eje2(2)-yp eje2(3) eje2(4)]);
%Slider1
sli1=get(handles.slider1,'Position');
set(handles.slider1,'Position',[sli1(1)-xp sli1(2)-yp sli1(3) sli1(4)]);
%Slider2
sli2=get(handles.slider2,'Position');
set(handles.slider2,'Position',[sli2(1)-xp sli2(2)-yp sli2(3) sli2(4)]);
%Popupmenu
pop=get(handles.popupmenu1,'Position');
set(handles.popupmenu1,'Position',[pop(1)-xp pop(2)-yp pop(3) pop(4)]);
%Pushbutton1
p1=get(handles.pushbutton1,'Position');
set(handles.pushbutton1,'Position',[p1(1)-xp p1(2)-yp p1(3) p1(4)]);
%Pushbutton2
p2=get(handles.pushbutton2,'Position');
set(handles.pushbutton2,'Position',[p2(1)-xp p2(2)-yp p2(3) p2(4)]);
%Pushbutton3
p3=get(handles.pushbutton3,'Position');
set(handles.pushbutton3,'Position',[p3(1)-xp p3(2)-yp p3(3) p3(4)]);
%Pushbutton4
p4=get(handles.pushbutton4,'Position');
set(handles.pushbutton4,'Position',[p4(1)-xp p4(2)-yp p4(3) p4(4)]);
%Pushbutton5
p5=get(handles.pushbutton5,'Position');
set(handles.pushbutton5,'Position',[p5(1)-xp p5(2)-yp p5(3) p5(4)]);
%Pushbutton6
p6=get(handles.pushbutton6,'Position');
set(handles.pushbutton6,'Position',[p6(1)-xp p6(2)-yp p6(3) p6(4)]);
%Pushbutton7
p7=get(handles.pushbutton7,'Position');
set(handles.pushbutton7,'Position',[p7(1)-xp p7(2)-yp p7(3) p7(4)]);
%Pushbutton8
p8=get(handles.pushbutton8,'Position');
set(handles.pushbutton8,'Position',[p8(1)-xp p8(2)-yp p8(3) p8(4)]);
%Pushbutton9
p9=get(handles.pushbutton9,'Position');
set(handles.pushbutton9,'Position',[p9(1)-xp p9(2)-yp p9(3) p9(4)]);
%Pushbutton10
p10=get(handles.pushbutton10,'Position');
set(handles.pushbutton10,'Position',[p10(1)-xp p10(2)-yp p10(3) p10(4)]);
%Uitable
ed2=get(handles.edit2,'Position');
set(handles.edit2,'Position',[ed2(1)-xp ed2(2)-yp ed2(3) ed2(4)]);
%edit2
tb=get(handles.uitable3,'Position');
set(handles.uitable3,'Position',[tb(1)-xp tb(2)-yp tb(3) tb(4)]);
%Text29
tx=get(handles.text29,'Position');
set(handles.text29,'Position',[tx(1)-xp tx(2)-yp tx(3) tx(4)]);
%Uibutton
ui=get(handles.uibuttongroup2,'Position');
set(handles.uibuttongroup2,'Position',[ui(1)-xp ui(2)-yp ui(3) ui(4)]);
%Botones
set(handles.radiobutton1,'Position',[ui(1)-xp+15 ui(2)-yp+207 120 10]);
set(handles.radiobutton2,'Position',[ui(1)-xp+15 ui(2)-yp+207-31 120 10]);
set(handles.radiobutton3,'Position',[ui(1)-xp+15 ui(2)-yp+207-62 120 10]);
set(handles.radiobutton4,'Position',[ui(1)-xp+15 ui(2)-yp+207-93 120 10]);
set(handles.radiobutton5,'Position',[ui(1)-xp+15 ui(2)-yp+207-124 130 10]);
set(handles.radiobutton6,'Position',[ui(1)-xp+15 ui(2)-yp+207-155 120 10]);
set(handles.radiobutton7,'Position',[ui(1)-xp+15 ui(2)-yp+207-186 120 10]);
%Pushbutton12
p12=get(handles.pushbutton12,'Position');
set(handles.pushbutton12,'Position',[p12(1)-xp p12(2)-yp p12(3) p12(4)]);
%Pushbutton13
p13=get(handles.pushbutton13,'Position');
set(handles.pushbutton13,'Position',[p13(1)-xp p13(2)-yp p13(3) p13(4)]);
%Pushbutton16
p16=get(handles.pushbutton16,'Position');
set(handles.pushbutton16,'Position',[p16(1)-xp p16(2)-yp p16(3) p16(4)]);
%Pushbutton15
p15=get(handles.pushbutton15,'Position');
set(handles.pushbutton15,'Position',[p15(1)-xp p15(2)-yp p15(3) p15(4)]);
%edit4
ed4=get(handles.edit4,'Position');
set(handles.edit4,'Position',[ed4(1)-xp ed4(2)-yp ed4(3) ed4(4)]);
%edit5
ed5=get(handles.edit5,'Position');
set(handles.edit5,'Position',[ed5(1)-xp ed5(2)-yp ed5(3) ed5(4)]);
%edit7
ed7=get(handles.edit7,'Position');
set(handles.edit7,'Position',[ed7(1)-xp ed7(2)-yp ed7(3) ed7(4)]);
%edit8
ed8=get(handles.edit8,'Position');
set(handles.edit8,'Position',[ed8(1)-xp ed8(2)-yp ed8(3) ed8(4)]);
%Text31
tx2=get(handles.text31,'Position');
set(handles.text31,'Position',[tx2(1)-xp tx2(2)-yp tx2(3) tx2(4)]);
%Unibutton3
ui3=get(handles.uibuttongroup3,'Position');
set(handles.uibuttongroup3,'Position',[ui3(1)-xp ui3(2)-yp ui3(3) ui3(4)]);
%Unibutton4
ui4=get(handles.uibuttongroup4,'Position');
set(handles.uibuttongroup4,'Position',[ui4(1)-xp ui4(2)-yp ui4(3) ui4(4)]);
%Unibutton5
ui5=get(handles.uibuttongroup5,'Position');
set(handles.uibuttongroup5,'Position',[ui5(1)-xp ui5(2)-yp ui5(3) ui5(4)]);
%Unibutton6
ui6=get(handles.uibuttongroup6,'Position');
set(handles.uibuttongroup6,'Position',[ui6(1)-xp ui6(2)-yp ui6(3) ui6(4)]);
%Unibutton8
ui8=get(handles.uibuttongroup8,'Position');
set(handles.uibuttongroup8,'Position',[ui8(1)-xp ui8(2)-yp ui8(3) ui8(4)]);



movegui('center');
set(handles.figure1,'Resize','off'); %OKKKKKK
set(handles.edit4,'UserData',0);
else
    securite=0;
end


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
blanco={[];[];[];[]};
       
set(handles.uitable3,'Data',[blanco blanco blanco blanco blanco blanco blanco blanco blanco blanco blanco blanco blanco blanco blanco blanco])
set(handles.edit7,'Visible','off')
set(handles.edit5,'Visible','off')
    
       %Epaisseur coupe 
       set(handles.text14,'String',[])       
       %Contraste
       set(handles.text13,'String',[]);
       set(handles.text12,'String',[]);
       set(handles.text11,'String',[]);
       set(handles.text10,'String',[]);
       %RSB
       set(handles.text18,'String',[]);
       set(handles.text30,'String',[]);
       %Uniformidad
       set(handles.text19,'String',[]);
       %Distorsion
       set(handles.text15,'String',[]);set(handles.text21,'String',[]);
       set(handles.text22,'String',[]);set(handles.text23,'String',[]);
       set(handles.text24,'String',[]);set(handles.text25,'String',[]);
       set(handles.text26,'String',[]);set(handles.text27,'String',[]);
       %Resolution Spatiale
       set(handles.text20,'String',[]);
       %Bajo Contraste
       set(handles.text28,'String',[]);
       


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
set(handles.edit7,'Visible','on')
set(handles.edit5,'Visible','on')


function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


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
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


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



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Tolerances_Callback(hObject, eventdata, handles)
% hObject    handle to Tolerances (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function difinir_Callback(hObject, eventdata, handles)
Tolerances
uiwait
global sensitometrie ep_coupe rsb piu distorsion rs bc
