#NoEnv ;��ʼ������
#SingleInstance force
#Persistent
CoordMode Mouse,Screen  ;Ĭ������������ڴ��ڵģ���Ҫ�ĳ������Ļ��
DetectHiddenWindows, Off


;ǰ��Ҫ��
;��Ϊ֪�ʼǵ�����Ŀ¼ȫ��չ��
;��onenote�½�һ���ʼǱ�
; �������ڸ��˱ʼǴ�
;��ʼ��ѡ�е�һ���ļ��� lastFolderTitle  lastWindowTitle
; ѡ�е�һ���ʼ�
; ����wiz F2 ��OneNote Ctrl+T ճ�� �س�
; ����wiz �����б� ��OneNote ճ�� �л����� 

; ���Ƕ����л�Ŀ¼ʱ����Ҫ �Ȱ� �£��ٰ�F8 ȡ�ñʼ�
; ����״̬
; ���ļ��� lastWindowTitle = WindowTitle
; ���� lastFolderTitle = folderTitle & lastWindowTitle = WindowTitle
;

^F1::
	start=true
	IniRead, common_delay, config.ini, Section, common_delay
	IniRead, paste_to_onenote, config.ini, Section, paste_to_onenote
	IniRead, edit_in_wiznote, config.ini, Section, edit_in_wiznote
	IniRead, switch_folder_wiznote, config.ini, Section, switch_folder_wiznote
	Gosub,do
return
^F2::start=false


do:
Loop 
{
	;��һ�ν���ʱ��Ҫ��ȡfolderTitle
	WinActivate,ahk_class WizNoteMainFrame
	ControlFocus ,ATL:CWizMultiSelectTreeCtrl
	MouseClick, left
	send {down}
	send {F2}
	send ^c
	send {enter}
	folderTitle := clipboard
	
	IfInString, folderTitle, - Ϊ֪�ʼ�
	{
		msgbox, ȫ��Ǩ�������
		return
	}
	if lastFolderTitle == %folderTitle%
	{
		msgbox, ȫ��Ǩ�������
		return
	}else{
		lastFolderTitle := folderTitle
		;ȥOneNote �½�����
		WinActivate,ahk_class Framework::CFrame
		send ^t
		Sleep, %common_delay%
		send ^v
		Sleep, %common_delay% 
		send {enter}
		Sleep, %common_delay% 
		loop {
			;���ļ����ڲ�����
			if start != true ;ǿ���˳���
			{
				msgbox,�ֶ�ֹͣ
				return
			}
			
			
			WinActivate,ahk_class WizNoteMainFrame
			send {F8}
			Sleep, %switch_folder_wiznote%  ;�л��ļ���ʱ������ļ��������ݺܶ࣬ʱ����ܲ���
			
			
			WinGetTitle, WindowTitle, ahk_class WizNoteMainFrame
			clipboard := WindowTitle
			if lastWindowTitle = %WindowTitle%
			{
				; msgbox, %lastWindowTitle%,%WindowTitle%
				; ���ļ���
				break
			}
			;MsgBox, �ַ������ҵ���
			;�����������
			if A_OSVersion contains 10. ;win10 title Ϊ  - Ϊ֪�ʼ�: �ղ�֪ʶ���������
			{
				StringTrimRight, NoteTitle, WindowTitle, 18
			}else{ ;win 7 title Ϊ  - Ϊ֪�ʼ�
				StringTrimRight, NoteTitle, WindowTitle, 7
			}
			IfInString, WindowTitle, .md 
			{
				StringTrimRight, NoteTitle, NoteTitle, 3 ; ��.mdȥ��
			}
			
			clipboard := NoteTitle
			
			;ȥOneNote �½��ʼ�
			WinActivate,ahk_class Framework::CFrame
			send ^v
			Sleep, %common_delay% 
			send {Enter}
			Sleep, %common_delay% 
			
			;�ص�wiz
			WinActivate,ahk_class WizNoteMainFrame
			Sleep, %common_delay% 

			; �༭���ݻ�ü��̽���
			send {F4}
			Sleep, %edit_in_wiznote% 
			send {F4}
			Sleep, %edit_in_wiznote%	
			
			send ^a
			Sleep, %common_delay% 
			send ^c
			Sleep, %common_delay% 
			
			;ȥOneNote ճ���ʼ�����
			WinActivate,ahk_class Framework::CFrame
			send ^v
			Sleep, %paste_to_onenote% ;�ļ����ݶ�Ļ�ʱ����ܲ���
			send ^n
			Sleep, %common_delay% 
			
			
			lastWindowTitle := WindowTitle
			
		}
		
	}
	
	
	
}
return