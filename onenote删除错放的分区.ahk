#NoEnv ;��ʼ������
#SingleInstance force
#Persistent
CoordMode Mouse,Screen  ;Ĭ������������ڴ��ڵģ���Ҫ�ĳ������Ļ��
DetectHiddenWindows, Off



^F1::
	start=true
	Gosub,do
return
^F2::start=false
;����û����ȥ�Ǳ߾͵���һ����
common_delay:=1000
do:
Loop 
{
	if start != true ;ǿ���˳���
	{
		msgbox,�ֶ�ֹͣ
		return
	}
	#IfWinActive ahk_class Framework::CFrame
	Sleep, %common_delay%
	mouseclick,right
	Sleep, %common_delay% 
	send d
	Sleep, %common_delay% 
	send y
	#IfWinActive
}
