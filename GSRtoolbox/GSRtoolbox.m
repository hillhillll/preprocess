function GSRtoolbox(varargin)
    %-Open startup window, set window defaults
%-----------------------------------------------------------------------
if spm_matlab_version_chk('7') >=0
	S = get(0, 'MonitorPosition');
	S = S(1,:);
else
	S  = get(0,'ScreenSize');
end;

if all(S==1), error('Can''t open any graphics windows...'), end
[SPMver,SPMc] = spm('Ver','',1);
PF = spm_platform('fonts');

GSRwin = figure('IntegerHandle','off',...
	'Name',sprintf('%s%s','Matt''s GSR toolbox',spm('GetUser',' (%s)')),...
	'NumberTitle','off',...
	'Tag','Welcome',...
	'Position',[S(3)/2-300,S(4)/2-140,500,280],...
	'Resize','off',...
	'Pointer','Watch',...
	'Color',[1 1 1]*.8,...
	'MenuBar','none',...
	'DefaultUicontrolFontName',PF.helvetica,...
	'HandleVisibility','off',...
	'Visible','off');


uicontrol(GSRwin,'Style','Frame','Position',[30 40 440 200]);

%-----------------------------------------------------------------------
set(GSRwin,'DefaultUicontrolFontSize',12,'DefaultUicontrolInterruptible','on')
uicontrol(GSRwin,'String','Configure data and triggers',...
	'ToolTipString',...
	'Convert data to toolbox format and import trial triggers',...
	'Position',[080 060 340 060],...
	'CallBack','spm_jobman(''interactive'','''',''jobs.tools.gsrpreproc'');',...
	'ForegroundColor',[0 1 1])


uicontrol(GSRwin,'String','Analyze and Review',...
	'ToolTipString',...
	'launch GSR analysis',...
	'Position',[080 160 340 060],...
	'CallBack','spm_jobman(''interactive'','''',''jobs.tools.gsranal'');',...
	'ForegroundColor',[0 1 1])



set(GSRwin,'Pointer','Arrow','Visible','on')











end