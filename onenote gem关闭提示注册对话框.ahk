
#NoEnv ;��ʼ������
#SingleInstance force
#Persistent

;http://www.autohotkey.com/docs/Hotkeys.htm  ����ָ��
;# 	Win
;! 	Alt
;^ 	Control
;+ 	Shift


Loop
{
   Winwait, ahk_class #32770
	{
	WinGetTitle,var,ahk_class #32770
	if var = Register Gem for OneNote 2016
	{
	;msgbox,%var%
	SetControlDelay -1
	ControlClick , Button2, %var%, ȡ��
	}
	}
}

