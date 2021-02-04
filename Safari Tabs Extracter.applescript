tell application "Safari"
	
	--Variables
	set windowCount to number of windows
	set docText to ""
	set metaDocText to ""
	
	--Repeat for Every Window
	repeat with x from 1 to windowCount
		set tabCount to number of tabs in window x
		
		--Repeat for Every Tab in Current Window
		repeat with y from 1 to tabCount
			
			--Get Tab Name & URL
			set tabName to name of tab y of window x
			set tabURL to URL of tab y of window x
			
			set metaDocText to metaDocText & Â
				"window #: " & x & " tab #: " & y & " - [" & Â
				tabName & "]" & Â
				"(" & tabURL & Â
				")" & Â
				linefeed as string
			
			set docText to docText & Â
				"- [" & Â
				tabName & "]" & Â
				"(" & tabURL & Â
				")" & Â
				linefeed as string
		end repeat
		
	end repeat
	
	set timeVal to time string of (current date)
	set {year:y, month:m, day:d, time:t} to (current date)
	set d to (y & "-" & m & "-" & d & "-" & timeVal) as text
	
	if not docText is equal to "" then
		do shell script "echo " & docText's quoted form & "> $HOME/Desktop/SafariSnapshot-" & d & ".md"
	end if
	
	if not metaDocText is equal to "" then
		do shell script "echo " & metaDocText's quoted form & "> $HOME/Desktop/SafariSnapshotMeta-" & d & ".md"
	end if
	
end tell