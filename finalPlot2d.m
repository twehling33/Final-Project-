function [] = finalPlot2d ()

    global gui; %grants access for other functions to access this gui

    x=linspace(0,50,1000);
    y=(sin(x)); %ENTER TRIG FUNCTION HERE
    xwindow_size=10; %size of the x axis at any given time
    minwindow=min(x); %window size with respect to x
    maxwindow=max(x);

%make the GUI
    gui=struct; 
    
    gui.f=figure(1); 
    
    gui.xwindow_size=xwindow_size;
    
    gui.xwindow_min=minwindow;
    gui.xwindow_max=maxwindow;
    
    gui.ax=axes('Parent',gui.f,'Units','Normalized','Position',[0.1 0.3 0.8 0.6]); %location of main plot
    gui.slider= uicontrol('Parent',gui.f,'Style','slider','Value',gui.xwindow_min+gui.xwindow_size/2,'min',gui.xwindow_min+gui.xwindow_size/2,'max',gui.xwindow_max-gui.xwindow_size/2,'Units','Normalized','Position',[0.1 0.1 0.8 0.1],'Callback',@sliderCallback);
    %location and initializing of slider
    guidata(gui.f,gui)
    
    gui.textBox = uicontrol('style','text','string','Value','units','normalized','Position',[0.1 0.05 0.2 0.1]);
    gui.button = uicontrol('style','pushbutton','string','Push','units','normalized','position',[0.3 0.05 0.2 0.1],'Callback',@ExactVallCallback);
    disp(1);


    plot(x,y,'Parent',gui.ax)%creates the plot 
    set(gui.ax,'YLim',[-1 1])%can change y axis amounts here
    sliderCallback(gui.f)%initialize the x-axis
end

function [] = sliderCallback(object,~)
    global gui;
    handles=guidata(object); 
    axesVal=get(handles.slider,'Value');
    set(handles.ax,'XLim',[-0.5 0.5]*handles.xwindow_size+axesVal)
end

function [] = ExactVallCallback(~,~)
    global gui;
    gui.textBox.String = (sin(0)); 

end
