function varargout = LeafLabel(varargin)
% LEAFLABEL MATLAB code for LeafLabel.fig
%      LEAFLABEL, by itself, creates a new LEAFLABEL or raises the existing
%      singleton*.
%
%      H = LEAFLABEL returns the handle to a new LEAFLABEL or the handle to
%      the existing singleton*.
%
%      LEAFLABEL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LEAFLABEL.M with the given input arguments.
%
%      LEAFLABEL('Property','Value',...) creates a new LEAFLABEL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before LeafLabel_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to LeafLabel_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help LeafLabel

% Last Modified by GUIDE v2.5 20-Jul-2015 11:47:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LeafLabel_OpeningFcn, ...
                   'gui_OutputFcn',  @LeafLabel_OutputFcn, ...
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


% --- Executes just before LeafLabel is made visible.
function LeafLabel_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to LeafLabel (see VARARGIN)

% Choose default command line output for LeafLabel
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes LeafLabel wait for user response (see UIRESUME)
% uiwait(handles.fig_mouse);


% --- Outputs from this function are returned to the command line.
function varargout = LeafLabel_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function edit1_Callback(hObject, eventdata, handles)
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


function pushbutton1_Callback(hObject, eventdata, handles)
% Open new images and load data
h = handles.axes1;
saveData(handles);
clearData(h);
bt1_openImage(handles, h);


function pushbutton2_Callback(hObject, eventdata, handles)
% Open next image
saveData(handles);
bt2_openNext(handles)


function pushbutton3_Callback(hObject, eventdata, handles)
% Open previous image
saveData(handles);
bt3_openPrevious(handles)


function pushbutton4_Callback(hObject, eventdata, handles)
% Start tip labeling
h = handles.axes1;
bt4_labelTips(h);


function pushbutton5_Callback(hObject, eventdata, handles)
% Show/not show tip locations
bt5_showTips(handles);


function pushbutton6_Callback(hObject, eventdata, handles)
% clear tip labels to start over again
bt6_clearTips(handles);


function pushbutton7_Callback(hObject, eventdata, handles)
% Merge Super Pixels
% bt7_mergeSuperPixel(handles)


function pushbutton8_Callback(hObject, eventdata, handles)
% Split Super Pixels
% bt8_splitSuperPixel(handles)

function pushbutton9_Callback(hObject, eventdata, handles)
% Show Leaf Label    
% bt9_showLeafLabel(handles)    

function pushbutton10_Callback(hObject, eventdata, handles)
% Clear Leaf Label and recover to original super pixel result
% bt10_clearLeafLabel(handles)


% Label leaves
function pushbutton11_Callback(hObject, eventdata, handles)
bt11_labelLeaves(handles)

function pushbutton12_Callback(hObject, eventdata, handles)
bt12_clearLeafLabel(handles)

function pushbutton13_Callback(hObject, eventdata, handles)
bt13_clearAllLeafLabels(handles)


% Others
function pushbutton14_Callback(hObject, eventdata, handles)
bt14_invisibleLeaves(handles)

function pushbutton15_Callback(hObject, eventdata, handles)
bt15_restartLabel(handles)


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% Show super pixesl choices

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1

contents = get(hObject, 'Value');
h = handles.axes1;
axes(handles.axes1)
if contents==1
    currentImage = getappdata(h, 'currentImage');
    imshow(currentImage)
    if isappdata(h, 'spsize')
        rmappdata(h, 'spsize')
    end
else
%     currentF = getappdata(h, 'currentFrame');
    setappdata(h, 'spsize', contents-1);
    maskIm = getappdata(h, 'maskIm');
    imshow(maskIm{contents-1})
end
        


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function fig_mouse_WindowButtonDownFcn(hObject, eventdata, handles)

function fig_mouse_ResizeFcn(hObject, eventdata, handles)    
