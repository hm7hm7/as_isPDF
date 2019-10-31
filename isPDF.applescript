(* isPDF v.1.00
 * written: Sasaki Atsushi aka hm7hm7
 * last modified: 2019-10-31JST
 *)

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

-- EOF
