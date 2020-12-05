﻿if (A_IsAdmin != true) {
  Run *RunAs "%A_ScriptFullPath%"
  ExitApp
}
#KeyHistory, 0
#MaxThreads, 20
#NoEnv
#Persistent
#SingleInstance, Force
#UseHook, On

CoordMode, Mouse, Client
CoordMode, Pixel, Client
CoordMode, ToolTip, Client
SendMode, Event
SetBatchLines, 100ms
SetKeyDelay, 0, 50
SetMouseDelay, 0, 50
StringCaseSense, On
global $ := {}
$.beep := Func("jsShim_50")
$.click := Func("jsShim_49")
global __index_debounce__ := 0
global __timer_debounce__ := {}
$.debounce := Func("jsShim_48")
$.delay := Func("jsShim_46")
$.exit := Func("jsShim_45")
$.findColor := Func("jsShim_44")
$.findImage := Func("jsShim_43")
$.formatHotkey := Func("jsShim_42")
$.getColor := Func("jsShim_41")
$.getPosition := Func("jsShim_40")
$.getState := Func("jsShim_39")
$.i := Func("jsShim_38")
$.includes := Func("jsShim_37")
$.info := Func("jsShim_36")
$.length := Func("jsShim_35")
$.move := Func("jsShim_34")
$.now := Func("jsShim_33")
$.off := Func("jsShim_32")
$.on := Func("jsShim_31")
$.open := Func("jsShim_30")
$.play := Func("jsShim_29")
$.press := Func("jsShim_28")
$.random := Func("jsShim_27")
$.reload := Func("jsShim_26")
$.replace := Func("jsShim_25")
$.reverse := Func("jsShim_24")
$.setFixed := Func("jsShim_23")
$.sleep := Func("jsShim_22")
$.split := Func("jsShim_21")
$.suspend := Func("jsShim_20")
global __index_throttle__ := 0
global __timer_throttle__ := {}
global __ts_throttle__ := {}
$.throttle := Func("jsShim_19")
$.toLowerCase := Func("jsShim_16")
$.toString := Func("jsShim_15")
$.toUpperCase := Func("jsShim_14")
$.trim := Func("jsShim_13")
$.trimEnd := Func("jsShim_12")
$.trimStart := Func("jsShim_11")
$.type := Func("jsShim_10")
global alert := Func("jsShim_9")
global clearInterval := Func("jsShim_8")
global clearTimeout := Func("jsShim_7")
global Math := {abs: Func("jsShim_6"), ceil: Func("jsShim_5"), floor: Func("jsShim_4"), round: Func("jsShim_3")}
global setInterval := Func("jsShim_2")
global setTimeout := Func("jsShim_1")
jsShim_1(callback, time) {
  if (($.type.Call(callback)) == "function") {
    callback := callback.Bind()
  }
  __type__ := $.type.Call(time)
  if !(__type__ == "number") {
    throw Exception("setTimeout: invalid time type '" . (__type__) . "'")
  }
  if (time <= 0) {
    time := 1
  }
  SetTimer, % callback, % 0 - time
  return callback
}
jsShim_2(callback, time) {
  if (($.type.Call(callback)) == "function") {
    callback := callback.Bind()
  }
  __type__ := $.type.Call(time)
  if !(__type__ == "number") {
    throw Exception("setTimeout: invalid time type '" . (__type__) . "'")
  }
  if !(time > 0) {
    throw Exception("setTimeout: invalid time value '" . (time) . "'")
  }
  SetTimer, % callback, % time
  return callback
}
jsShim_3(n) {
  return Round(n)
}
jsShim_4(n) {
  return Floor(n)
}
jsShim_5(n) {
  return Ceil(n)
}
jsShim_6(n) {
  return Abs(n)
}
jsShim_7(callback) {
  if !(callback) {
    return
  }
  SetTimer, % callback, Delete
}
jsShim_8(callback) {
  if !(callback) {
    return
  }
  SetTimer, % callback, Delete
}
jsShim_9(message := "") {
  __msg__ := $.toString.Call(message)
  MsgBox, % __msg__
}
jsShim_10(input) {
  if input is Number
    return "number"
  if (IsFunc(input)) {
    return "function"
  }
  if (IsObject(input)) {
    if (input.Count() == input.Length()) {
      return "array"
    }
    return "object"
  }
  return "string"
}
jsShim_11(input, omitting := " `t") {
  return LTrim(input, omitting)
}
jsShim_12(input, omitting := " `t") {
  return RTrim(input, omitting)
}
jsShim_13(input, omitting := " `t") {
  return Trim(input, omitting)
}
jsShim_14(input) {
  StringUpper, __result__, input
  return __result__
}
jsShim_15(input) {
  __type__ := $.type.Call(input)
  if (__type__ == "array") {
    __result__ := ""
    for __i__, key in input {
      __result__ := "" . (__result__) . ", " . ($.toString.Call(key)) . ""
    }
    return "[" . ($.trim.Call(__result__, " ,")) . "]"
  } else if (__type__ == "object") {
    __result__ := ""
    for key, value in input {
      __result__ := "" . (__result__) . ", " . (key) . ": " . ($.toString.Call(value)) . ""
    }
    return "{" . ($.trim.Call(__result__, " ,")) . "}"
  }
  return input
}
jsShim_16(input) {
  StringLower, __result__, input
  return __result__
}
jsShim_17(index, callback) {
  callback.Call()
  __ts_throttle__[index] := $.now.Call()
}
jsShim_18(index, time, callback) {
  clearTimeout.Call(__timer_throttle__[index])
  __timer_throttle__[index] := setTimeout.Call(Func("jsShim_17").Bind(index, callback), __ts_throttle__[index] - $.now.Call() + time)
}
jsShim_19(time, callback) {
  __index_throttle__++
  __ts_throttle__[__index_throttle__] := 0
  return Func("jsShim_18").Bind(__index_throttle__, time, callback)
}
jsShim_20(isSuspended := "Toggle") {
  if (isSuspended != "Toggle") {
    if (isSuspended) {
      isSuspended := "On"
    } else {
      isSuspended := "Off"
    }
  }
  Suspend, % isSuspended
}
jsShim_21(input, delimiter) {
  return StrSplit(input, delimiter)
}
jsShim_22(time) {
  Sleep, % time
}
jsShim_23(isFixed := "Toggle") {
  if (isFixed != "Toggle") {
    if (isFixed) {
      isFixed := "On"
    } else {
      isFixed := "Off"
    }
  }
  Winset AlwaysOnTop, % isFixed, A
}
jsShim_24(input) {
  __type__ := $.type.Call(input)
  if !(__type__ == "array") {
    throw Exception("$.reverse: invalid type '" . (__type__) . "'")
  }
  __len__ := $.length.Call(input)
  __output__ := []
  for i, key in input {
    __output__[__len__ - i + 1] := key
  }
  return __output__
}
jsShim_25(input, searchment, replacement, limit := -1) {
  return StrReplace(input, searchment, replacement, limit)
}
jsShim_26() {
  Reload
}
jsShim_27(min := 0, max := 1) {
  Random, __result__, min, max
  return __result__
}
jsShim_28(listInput*) {
  if !($.length.Call(listInput)) {
    throw Exception("$.press: invalid key")
  }
  __listKey__ := []
  for __i__, input in listInput {
    __input__ := $.toLowerCase.Call(input)
    __input__ := $.replace.Call(__input__, " ", "")
    __input__ := $.replace.Call(__input__, "-", "")
    __list__ := $.split.Call(__input__, "+")
    for __i__, it in __list__ {
      __listKey__.Push(it)
    }
  }
  __listResult__ := []
  __len__ := $.length.Call(__listKey__)
  for i, key in __listKey__ {
    if (i == __len__) {
      __listResult__[i] := $.split.Call(key, ":")
      continue
    }
    if ($.includes.Call(key, ":")) {
      __listResult__[i] := $.split.Call(key, ":")
      __listResult__[__len__ * 2 - i] := $.split.Call(key, ":")
    } else {
      __listResult__[i] := [key, "down"]
      __listResult__[__len__ * 2 - i] := [key, "up"]
    }
  }
  for i, it in __listResult__ {
    if (it[1] == "win") {
      it[1] := "lwin"
    }
    __listResult__[i] := $.trim.Call("" . (it[1]) . " " . (it[2]) . "")
  }
  __output__ := ""
  for __i__, it in __listResult__ {
    __output__ := "" . (__output__) . "{" . (it) . "}"
  }
  Send, % __output__
}
jsShim_29(filename) {
  SoundPlay, % filename
}
jsShim_30(source) {
  Run, % source
}
jsShim_31(key, callback) {
  key := $.formatHotkey.Call(key)
  Hotkey, % key, % callback, On
}
jsShim_32(key, callback) {
  key := $.formatHotkey.Call(key)
  Hotkey, % key, % callback, Off
}
jsShim_33() {
  return A_TickCount
}
jsShim_34(point := "", speed := 0) {
  if !(point) {
    throw Exception("$.move: invalid point")
  }
  MouseMove, point[1], point[2], speed
}
jsShim_35(input) {
  __type__ := $.type.Call(input)
  switch __type__ {
    case "array": {
      return input.Length()
    }
    case "object": {
      return input.Count()
    }
    case "string": {
      return StrLen(input)
    }
    default: {
      throw Exception("$.length: invalid type '" . (__type__) . "'")
    }
  }
}
jsShim_36(message, point := "") {
  if !(message) {
    return message
  }
  if !(point) {
    point := $.getPosition.Call()
  }
  __msg__ := $.toString.Call(message)
  ToolTip, % __msg__, % point[1], % point[2]
  return message
}
jsShim_37(input, needle) {
  __type__ := $.type.Call(input)
  if (__type__ == "string" || __type__ == "number") {
    return (InStr(input, needle)) > 0
  }
  if (__type__ == "array") {
    for __i__, it in input {
      if (it == needle) {
        return true
      }
    }
    return false
  }
  throw Exception("$.includes: invalid type '" . (__type__) . "'")
}
jsShim_38(message) {
  $.info.Call("" . ($.now.Call()) . " " . ($.toString.Call(message)) . "")
  return message
}
jsShim_39(key) {
  return GetKeyState(key, "P")
}
jsShim_40() {
  MouseGetPos, __x__, __y__
  return [__x__, __y__]
}
jsShim_41(point := "") {
  if !(point) {
    point := $.getPosition.Call()
  }
  PixelGetColor, __result__, % point[1], % point[2], RGB
  return __result__
}
jsShim_42(key) {
  __listkey__ := []
  __key__ := $.toLowerCase.Call(key)
  __key__ := $.replace.Call(__key__, " ", "")
  __key__ := $.replace.Call(__key__, "-", "")
  _list := $.split.Call(__key__, "+")
  for __i__, it in _list {
    __listkey__.Push(it)
  }
  __isAlt__ := false
  __isCtrl__ := false
  __isShift__ := false
  __isWin__ := false
  __listResult__ := []
  for __i__, key in __listkey__ {
    if (key == "alt") {
      __isAlt__ := true
      continue
    }
    if (key == "ctrl") {
      __isCtrl__ := true
      continue
    }
    if (key == "shift") {
      __isShift__ := true
      continue
    }
    if (key == "win") {
      __isWin__ := true
      continue
    }
    __listResult__.Push(key)
  }
  __prefix__ := ""
  if (__isAlt__) {
    __prefix__ := "" . (__prefix__) . "!"
  }
  if (__isCtrl__) {
    __prefix__ := "" . (__prefix__) . "^"
  }
  if (__isShift__) {
    __prefix__ := "" . (__prefix__) . "+"
  }
  if (__isWin__) {
    __prefix__ := "" . (__prefix__) . "#"
  }
  __result__ := ""
  for __i__, it in __listResult__ {
    __result__ := "" . (__result__) . " & " . (it) . ""
  }
  return $.replace.Call("" . (__prefix__) . "" . ($.trim.Call(__result__, " &")) . "", ":", " ")
}
jsShim_43(source, start := "", end := "") {
  if !(start) {
    start := [0, 0]
  }
  if !(end) {
    end := [A_ScreenWidth, A_ScreenHeight]
  }
  ImageSearch __x__, __y__, start[1], start[2], end[1], end[2], % A_ScriptDir . "\\\" . source
  return [__x__, __y__]
}
jsShim_44(color, start := "", end := "", variation := 0) {
  if !(start) {
    start := [0, 0]
  }
  if !(end) {
    end := [A_ScreenWidth, A_ScreenHeight]
  }
  PixelSearch __x__, __y__, start[1], start[2], end[1], end[2], color, variation, Fast RGB
  return [__x__, __y__]
}
jsShim_45() {
  ExitApp
}
jsShim_46(time, callback) {
  __timer__ := setTimeout.Call(callback, time)
  return __timer__
}
jsShim_47(index, time, callback) {
  clearTimeout.Call(__timer_debounce__[index])
  __timer_debounce__[index] := setTimeout.Call(callback, time)
}
jsShim_48(time, callback) {
  __index_debounce__++
  return Func("jsShim_47").Bind(__index_debounce__, time, callback)
}
jsShim_49(key := "left") {
  key := $.replace.Call(key, "-", "")
  key := $.replace.Call(key, ":", " ")
  Click, % key
}
jsShim_50() {
  SoundBeep
}
global state := {}
global timer := {}
global ts := {}
class ClientX {
  name := "YuanShen.exe"
  state := {isSuspend: false}
  check := Func("genshin_38").Bind(this)
  close := Func("genshin_37").Bind(this)
  isActive := Func("genshin_36").Bind(this)
  reset := Func("genshin_35").Bind(this)
  resetKey := Func("genshin_34").Bind(this)
  resetTimer := Func("genshin_33").Bind(this)
  suspend := Func("genshin_32").Bind(this)
  setPriority := Func("genshin_31").Bind(this)
  watch := Func("genshin_30").Bind(this)
}
timer.countDown := ""
global countDown := Func("genshin_29")
global doAs := Func("genshin_28")
state.isDashing := false
timer.dash := ""
global dash := Func("genshin_25")
global startDash := Func("genshin_24")
global stopDash := Func("genshin_23")
state.isJumping := false
timer.jump := ""
global jumpTwice := Func("genshin_22")
global startJumpBack := Func("genshin_20")
global stopJumpBack := Func("genshin_19")
global isMoving := Func("genshin_18")
state.isPicking := false
timer.pick := ""
global pick := Func("genshin_17")
global startPick := Func("genshin_16")
global stopPick := Func("genshin_15")
ts.toggle := 0
global toggle := Func("genshin_14")
state.isViewing := false
timer.view := ""
global toggleView := Func("genshin_12")
global view := Func("genshin_11")
global client := new ClientX()
client.watch.Call()
$.on.Call("alt + f4", Func("genshin_9"))
$.on.Call("ctrl + f5", Func("genshin_8"))
for __i__, key in ["1", "2", "3", "4", "5"] {
  $.on.Call(key, Func("genshin_7").Bind(key))
}
$.on.Call("e", Func("genshin_6"))
$.on.Call("e:up", Func("genshin_5"))
$.on.Call("f", startPick)
$.on.Call("f:up", stopPick)
$.on.Call("mbutton", toggleView)
$.on.Call("rbutton", startDash)
$.on.Call("rbutton:up", stopDash)
$.on.Call("s", Func("genshin_4"))
$.on.Call("s:up", Func("genshin_3"))
$.on.Call("space", $.throttle.Call(500, jumpTwice))
$.on.Call("w", Func("genshin_2"))
$.on.Call("w:up", Func("genshin_1"))
genshin_1() {
  if (state.isDashing) {
    return
  }
  $.press.Call("w:up")
}
genshin_2() {
  $.press.Call("w:down")
}
genshin_3() {
  $.press.Call("s:up")
  stopJumpBack.Call()
}
genshin_4() {
  $.press.Call("s:down")
  startJumpBack.Call()
}
genshin_5() {
  $.press.Call("e:up")
  countDown.Call(5000)
}
genshin_6() {
  $.press.Call("e:down")
}
genshin_7(key) {
  toggle.Call(key)
}
genshin_8() {
  $.beep.Call()
  client.reset.Call()
  $.reload.Call()
}
genshin_9() {
  $.beep.Call()
  client.reset.Call()
  $.exit.Call()
}
genshin_10() {
  $.click.Call("middle:up")
}
genshin_11() {
  $.click.Call("middle:down")
  setTimeout.Call(Func("genshin_10"), 2500)
}
genshin_12() {
  clearInterval.Call(timer.view)
  state.isViewing := !state.isViewing
  $.click.Call("middle:up")
  if !(state.isViewing) {
    return
  }
  timer.view := setInterval.Call(view, 3000)
  view.Call()
}
genshin_13() {
  $.press.Call("e")
}
genshin_14(key) {
  $.press.Call(key)
  if !($.now.Call() - ts.toggle > 1000) {
    $.beep.Call()
    return
  }
  ts.toggle := $.now.Call()
  doAs.Call(Func("genshin_13"), 2, 100, 100)
  countDown.Call(5000)
}
genshin_15() {
  if !(state.isPicking) {
    return
  }
  state.isPicking := false
  clearInterval.Call(timer.pick)
}
genshin_16() {
  if (state.isPicking) {
    return
  }
  state.isPicking := true
  clearInterval.Call(timer.pick)
  timer.pick := setInterval.Call(pick, 100)
  pick.Call()
}
genshin_17() {
  $.press.Call("f")
  $.click.Call("wheel-down")
}
genshin_18() {
  for __i__, key in ["w", "a", "s", "d"] {
    if ($.getState.Call(key)) {
      return key
    }
  }
  return false
}
genshin_19() {
  if !(state.isJumping) {
    return
  }
  state.isJumping := false
  clearTimeout.Call(timer.jump)
}
genshin_20() {
  if (state.isJumping) {
    return
  }
  state.isJumping := true
  timer.jump := $.delay.Call(100, jumpTwice)
}
genshin_21() {
  $.press.Call("space")
}
genshin_22() {
  $.press.Call("space")
  doAs.Call(Func("genshin_21"), 2, 100, 200)
}
genshin_23() {
  if !(state.isDashing) {
    return
  }
  state.isDashing := false
  clearInterval.Call(timer.dash)
  key := isMoving.Call()
  if !(key) {
    $.press.Call("w:up")
  } else if (key != "w") {
    $.press.Call("w:up")
  }
}
genshin_24() {
  if (state.isDashing) {
    return
  }
  state.isDashing := true
  clearInterval.Call(timer.dash)
  timer.dash := setInterval.Call(dash, 1300)
  dash.Call()
}
genshin_25() {
  key := isMoving.Call()
  if !(key) {
    $.press.Call("w:down")
  } else if (key != "w") {
    $.press.Call("w:up")
  }
  $.click.Call("right")
}
genshin_26(n, callback) {
  callback.Call(n)
}
genshin_27(callback, limit, interval) {
  doAs.Call(callback, limit, interval, 0)
}
genshin_28(callback, limit := 1, interval := 100, delay := 0) {
  if (delay) {
    $.delay.Call(delay, Func("genshin_27").Bind(callback, limit, interval))
    return
  }
  n := 1
  while (n <= limit) {
    $.delay.Call((n - 1) * interval, Func("genshin_26").Bind(n, callback))
    n++
  }
}
genshin_29(time) {
  clearTimeout.Call(timer.countDown)
  timer.countDown := $.delay.Call(time, $.beep)
}
genshin_30(this) {
  setInterval.Call(this.check, 200)
}
genshin_31(this, level) {
  Process, Priority, % this.name, % level
}
genshin_32(this, isSuspend) {
  if (isSuspend) {
    if (this.state.isSuspend) {
      return
    }
    this.state.isSuspend := true
    $.suspend.Call(true)
    this.resetTimer.Call()
    this.resetKey.Call()
    return
  }
  if !(isSuspend) {
    if !(this.state.isSuspend) {
      return
    }
    this.state.isSuspend := false
    $.suspend.Call(false)
    return
  }
}
genshin_33(this) {
  for __i__, _timer in timer {
    clearTimeout.Call(_timer)
  }
}
genshin_34(this) {
  for __i__, key in ["middle", "right"] {
    if ($.getState.Call(key)) {
      $.click.Call("" . (key) . ":up")
    }
  }
  for __i__, key in ["alt", "ctrl", "f4", "f5", "e", "f", "s", "space", "w"] {
    if ($.getState.Call(key)) {
      $.press.Call("" . (key) . ":up")
    }
  }
}
genshin_35(this) {
  this.setPriority.Call("normal")
  this.resetTimer.Call()
  this.resetKey.Call()
}
genshin_36(this) {
  return WinActive("ahk_exe " . (this.name) . "")
}
genshin_37(this) {
  Process, Close, % this.name
}
genshin_38(this) {
  if (!this.state.isSuspend && !this.isActive.Call()) {
    this.setPriority.Call("low")
    this.suspend.Call(true)
    return
  }
  if (this.state.isSuspend && this.isActive.Call()) {
    this.setPriority.Call("normal")
    this.suspend.Call(false)
    return
  }
}
