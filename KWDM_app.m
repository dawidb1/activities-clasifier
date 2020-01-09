function varargout = KWDM_app(varargin)
% KWDM_APP MATLAB code for KWDM_app.fig
%      KWDM_APP, by itself, creates a new KWDM_APP or raises the existing
%      singleton*.
%
%      H = KWDM_APP returns the handle to a new KWDM_APP or the handle to
%      the existing singleton*.
%
%      KWDM_APP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in KWDM_APP.M with the given input arguments.
%
%      KWDM_APP('Property','Value',...) creates a new KWDM_APP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before KWDM_app_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to KWDM_app_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help KWDM_app

% Last Modified by GUIDE v2.5 08-Jan-2020 15:23:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @KWDM_app_OpeningFcn, ...
                   'gui_OutputFcn',  @KWDM_app_OutputFcn, ...
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


% --- Executes just before KWDM_app is made visible.
function KWDM_app_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to KWDM_app (see VARARGIN)

% Choose default command line output for KWDM_app
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes KWDM_app wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = KWDM_app_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file,path] = uigetfile('*.txt');
path_with_file = fullfile(path,file);
plik = load(path_with_file);

czas = plik(:,2);
xvalue = plik(:,3);
yvalue = plik(:,4);
zvalue = plik(:,5);
axes(handles.axes1)
plot(czas/1000, [xvalue, yvalue, zvalue]);
ylabel('Amplituda');
xlabel('Czas [s]');
legend('oœ x','oœ y','oœ z');
title('Pomiar wszystkich aktywnoœci akcelometrem');
