#NoEnv ;��ʼ������
#SingleInstance force
#Persistent
CoordMode Mouse,Screen  ;Ĭ������������ڴ��ڵģ���Ҫ�ĳ������Ļ��
DetectHiddenWindows, Off


;~ ����word���淢��һ���س�
;~ DebugMessage("hello, world!")
^F1::
	start=true
	Gosub,do
return
^F2::start=false

do:
Loop {
;ǿ���˳���
	if start != true
	{
		msgbox,��ֹͣ
		return
	}

	WinWait,ahk_class WizNoteMainFrame
	{
		WinGetTitle, WindowTitle, ahk_class WizNoteMainFrame
		clipboard := WindowTitle
		; msgbox, %lastWindowTitle%,%WindowTitle%,lastWindowTitle = %WindowTitle%
		if lastWindowTitle = %WindowTitle%
		{
			; msgbox, %lastWindowTitle%,%WindowTitle%
			return
		}
		Needle = - Ϊ֪�ʼ�
		IfInString, WindowTitle, %Needle%
		{
			; MsgBox, �ַ������ҵ���
			;�����������
			;��ȡ����
			IfInString, WindowTitle, .md 
			{
				StringTrimRight, NoteTitle, WindowTitle, 10 ; ��.mdȥ��
			}else{
				StringTrimRight, NoteTitle, WindowTitle, 7
			}
			
			
			clipboard := NoteTitle
			WinActivate,ahk_class Framework::CFrame
			
			send ^v
			Sleep, 200 
			send {Enter}
			Sleep, 200 
			
			WinActivate,ahk_class WizNoteMainFrame
			; MouseClick , left,469, 1064
			Sleep, 200 
			ControlFocus ,ATL:0480C1D01
			MouseClick, left
			send ^a
			Sleep, 200 
			send ^c
			Sleep, 200 
			
			WinActivate,ahk_class Framework::CFrame
			send ^v
			Sleep, 200 ;�ļ����ݶ�Ļ�ʱ����ܲ���
			send ^n
			Sleep, 200 
			
			WinActivate,ahk_class WizNoteMainFrame
			send {F8}
			Sleep, 200 
			; return
			lastWindowTitle := WindowTitle
		}
		
	}
}
return