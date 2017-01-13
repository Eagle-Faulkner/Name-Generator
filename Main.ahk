#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance
PrevNum = 0
LastNum = 0

Gui, Main: Add, Text, x10 y10, Number of letters in the name(min 3, 0 for random):
Gui, Main: Add, Edit, xp+400 yp w100 Number vNameLength, 3
Gui, Main: Add, Button, x10 yp+25 w500 gGenerateName, Generate Name
Gui, Main: Add, Edit, xp yp+25 w500 vNameDisplayer ReadOnly

Gui, Main: Show, Center autosize
Return

GenerateName:
	Gui, Main: Submit, nohide
	If NameLength=0
		{
		Random, NameLength, 3, 10
		}
	GetLetter(Name, LastNum, PrevNum)
	NameLength -= 1
	Loop, %NameLength%
		{
		GetLetter(NextLetter, LastNum, PrevNum)
		Name = %Name%%NextLetter%
		}
	GuiControl, Main:, NameDisplayer, %Name%
	PrevNum = 0
	LastNum = 0
Return

;1-9 vowel
;10-18 Mod
;19-35 Base



GetLetter(Byref Letter, ByRef LastNum, ByRef PrevNum)
	{
	If LastNum = 0
		{
		Random, Num, 1, 35
		}
	Else If (PrevNum =0) AND ((LastNum >=1) AND (LastNum <=9))
		{
		Random, Num, 10, 35
		}
	Else If (PrevNum) =0 AND ((LastNum >=10) AND (LastNum <=35))
		{
		Random, Num, 1, 9
		}
	Else if ((PrevNum >=1) AND (PrevNum <=9)) AND ((Lastnum >=1) AND (LastNum <=9))
		{
		Random, Num, 10, 35
		}
	Else if (((PrevNum >=10) AND (PrevNum <=35)) AND ((Lastnum >=1) AND (LastNum <=9))) OR (((PrevNum >=1) AND (PrevNum <=9)) AND ((LastNum >=10) AND (LastNum <=35)))
		{
		Random, Num, 1, 35
		}
	Else if ((PrevNum >=10) AND (PrevNum <=35)) OR ((LastNum >=10) AND (LastNum <=35))
		{
		Random, Num, 1, 9
		}
	Else
		{
		MsgBox ERROR
		Return
		}
	
	PrevNum = %LastNum%
	LastNum = %Num%
	
	If (Num=1) Or (Num=2)
		{
		Letter = A
		}
	Else If (Num=3) Or (Num=4)
		{
		Letter = E
		}
	Else If (Num=4) OR (Num=5)
		{
		Letter = I
		}
	Else If (Num=6) OR (Num=7)
		{
		Letter = O
		}
	Else If (Num=8) OR (Num=9)
		{
		Letter = U
		}
	;--------------
	Else If Num=10
		{
		Letter = L
		}
	Else If Num=11
		{
		Letter = F
		}
	Else If Num=12
		{
		Letter = M
		}
	Else If Num=13
		{
		Letter = M
		}
	Else If Num=14
		{
		Letter = N
		}
	Else If Num=15
		{
		Letter = S
		}
	Else If Num=16
		{
		Letter = W
		}
	Else If Num=17
		{
		Letter = H
		}
	Else If Num=18
		{
		Letter = Y
		}
	;--------------
	Else If Num=19
		{
		Letter = B
		}
	Else If Num=20
		{
		Letter = C
		}
	Else If Num=21
		{
		Letter = D
		}
	Else If Num=22
		{
		Letter = G
		}
	Else If Num=23
		{
		Letter = J
		}
	Else If Num=24
		{
		Letter = K
		}
	Else If Num=25
		{
		Letter = P
		}
	Else If Num=26
		{
		Letter = QU
		}
	Else If Num=27
		{
		Letter = R
		}
	Else If Num=28
		{
		Letter = T
		}
	Else If Num=29
		{
		Letter = T
		}
	Else If Num=30
		{
		Letter = V
		}
	Else If Num=31
		{
		Letter = X
		}
	Else If Num=32
		{
		Letter = Z
		}
	Else If Num=33
		{
		Letter = CH
		}
	Else If Num=34
		{
		Letter = TH
		}
	Else If Num=35
		{
		Letter = SH
		}
	Else
		{
		MsgBox Error getting letter
		}
	Return, Letter, LastNum, PrevNum
	}

MainGuiEscape:
MainGuiClose:
ExitApp
