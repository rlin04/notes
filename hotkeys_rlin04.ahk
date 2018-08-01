; ---------------------------------------
; shift
; volume_change
; ---------------------------------------

+WheelUp::send {volume_up}
+WheelDown::send {volume_down}

; ---------------------------------------
; alt, alt+shift
; deletion, navigation, quote_enclosure
; ---------------------------------------

!x::send {Delete}
!+x::send {Backspace}
!r::send {browser_refresh}
!h::send <^h
!WheelUp::send {PgUp}
!WheelDown::send {PgDn}
!+WheelUp::send {Home}
!+WheelDown::send {End}

!'::EncQuote("'")
!+'::EncQuote("""")

EncQuote(q) {
  oldClipboard = %clipboard%
  Clipboard := 
  SendInput ^c
  Sleep 100
  if (Clipboard != "") {
    Clipboard = %q%%clipboard%%q%
    Sleep 100
    SendInput ^v
  }
  Clipboard = %oldClipboard%
}

; ---------------------------------------
; ctrl+alt
; number_row, switch tabs, volume
; ---------------------------------------

<^!a::send 1
<^!s::send 2
<^!d::send 3
<^!f::send 4
<^!g::send 5
<^!h::send 6
<^!j::send 7
<^!k::send 8
<^!l::send 9
<^!;::send 0
<^!p::send {+}
<^!m::send `-
<^!e::send `=
<^!space::send _

<^!right::send {ralt down}{tab}{ralt up}
<^!left::send {shift down}{ralt down}{tab}{ralt up}{shift up}

; ---------------------------------------
; ctrl+shift
; shift+number_row
; ---------------------------------------

<^+a::send {!}
<^+s::send @
<^+d::send {#}
<^+f::send $
<^+g::send `%
<^+h::send {^}
<^+i::send {&}
<^+j::send *
<^+k::send (
<^+l::send )
<^+;::send _
<^+'::send {+}

<^+v::                            ; Text–only paste from ClipBoard
   Clip0 = %ClipBoardAll%
   ClipBoard = %ClipBoard%       ; Convert to text
   Send ^v                       ; For best compatibility: SendPlay
   Sleep 50                      ; Don't change clipboard while it is pasted! (Sleep > 0)
   ClipBoard = %Clip0%           ; Restore original ClipBoard
   VarSetCapacity(Clip0, 0)      ; Free memory
Return
