# isPDF

## Overview

AppleScript handler to return boolean that PDF or not.

PDF か否かを判定する AppleScript ハンドラ。

## Description

Give an alias to the argument. Determines with the extension and the beginning "%PDF-" of the data.

引数にはエイリアスを与える。拡張子およびファイル先頭の %PDF- で判定する。

## Sample (ja)

ドロップされたファイルが PDF か否かを判定するドロップレット。

```
on isPDF(f)
	if (f as text) ends with ".pdf" then
		try
			set f2read to open for access f without write permission
			set fh to read f2read from 1 to 5
			close access f
		on error errMsg number errNum
			close access f
			error errMsg number errNum
		end try
		if fh is "%PDF-" then
			return true
		else
			return false
		end if
	else
		return false
	end if
end isPDF

on open f
	if length of f = 1 then
		tell application "Finder" to set fn to name of item 1 of f
		if isPDF(f) then
			display dialog fn & " は PDF ファイルです。"
		else
			display dialog fn & " は PDF ファイルではありません。"
		end if
	else
		display dialog "ファイルは一つだけドラッグ & ドロップしてください。" buttons {"OK"} default button "OK"
	end if
end open
```


## Licence

[MIT](https://github.com/tcnksm/tool/blob/master/LICENCE)

## Author

[Sasaki Atsushi aka hm7hm7](https://github.com/hm7hm7)
