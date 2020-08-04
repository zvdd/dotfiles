SetBatchLines -1
SleepDuration = 1
TimePeriod = 1

SC := "SC0x2 SC0x3 SC0x4 SC0x5 SC0x6 SC0x7 SC0x8 SC0x9 SC0xa SC0xb SC0xc SC0xd SC0x10 SC0x11 SC0x12 SC0x13 SC0x14 SC0x15 SC0x16 SC0x17 SC0x18 SC0x19 SC0x1a SC0x1b SC0x1e SC0x1f SC0x20 SC0x21 SC0x22 SC0x23 SC0x24 SC0x25 SC0x26 SC0x27 SC0x28 SC0x29 SC0x2b SC0x2c SC0x2d SC0x2e SC0x2f SC0x30 SC0x31 SC0x32 SC0x33 SC0x34 SC0x35 SC0x56"
StringSplit, SC, SC, %A_Space%

MakeDefault()
return


MakeDefault()
{
	Loop, 48
	{
		sc := sc%A_Index%
		Hotkey, *%sc%, off
	}
}

WaitRelease()
{
	Loop
	{
		If !(GetKeyState("Ctrl")
		or GetKeyState("Alt")
		or GetKeyState("LWin")
		or GetKeyState("RWin"))
			Break
		Sleep, 10
	}
}

MakeQwerty()
{
	Loop, 48
	{
		sc := sc%A_Index%
		Hotkey, *%sc%, on
	}
}


~*Ctrl::
~*Alt::
~*LWin::
~*RWin::
Sleep, 1
If GetKeyState("RAlt") ; This prevents from switching if it was AltGr pressed. 
	return
MakeQwerty()
WaitRelease()
MakeDefault()
return


; ##############################
;         QWERTY MAPPING
; ##############################

*SC0x2::Send {Blind}{1}
*SC0x3::Send {Blind}{2}
*SC0x4::Send {Blind}{3}
*SC0x5::Send {Blind}{4}
*SC0x6::Send {Blind}{5}
*SC0x7::Send {Blind}{6}
*SC0x8::Send {Blind}{7}
*SC0x9::Send {Blind}{8}
*SC0xa::Send {Blind}{9}
*SC0xb::Send {Blind}{0}
*SC0xc::Send {Blind}{-}
*SC0xd::Send {Blind}{=}
*SC0x10::Send {Blind}{q}
*SC0x11::Send {Blind}{w}
*SC0x12::Send {Blind}{e}
*SC0x13::Send {Blind}{r}
*SC0x14::Send {Blind}{t}
*SC0x15::Send {Blind}{y}
*SC0x16::Send {Blind}{u}
*SC0x17::Send {Blind}{i}
*SC0x18::Send {Blind}{o}
*SC0x19::Send {Blind}{p}
*SC0x1a::Send {Blind}{[}
*SC0x1b::Send {Blind}{]}
*SC0x1e::Send {Blind}{a}
*SC0x1f::Send {Blind}{s}
*SC0x20::Send {Blind}{d}
*SC0x21::Send {Blind}{f}
*SC0x22::Send {Blind}{g}
*SC0x23::Send {Blind}{h}
*SC0x24::Send {Blind}{j}
*SC0x25::Send {Blind}{k}
*SC0x26::Send {Blind}{l}
*SC0x27::Send {Blind}{;}
*SC0x28::Send {Blind}{'}
*SC0x29::Send {Blind}{vkC0} ; ` key
*SC0x2b::Send {Blind}{\}
*SC0x2c::Send {Blind}{z}
*SC0x2d::Send {Blind}{x}
*SC0x2e::Send {Blind}{c}
*SC0x2f::Send {Blind}{v}
*SC0x30::Send {Blind}{b}
*SC0x31::Send {Blind}{n}
*SC0x32::Send {Blind}{m}
*SC0x33::Send {Blind}{,}
*SC0x34::Send {Blind}{.}
*SC0x35::Send {Blind}{/}
*SC0x56::Send {Blind}{vkE2} ; the additional key, backslash (\) on standard qwerty