/// @description Explodes a string chain by a delimiter and returns an array of reals
/// @param string
/// @param delimiter

var str = argument[0],
	del = argument[1],
	word = "",
	count = 0,
	chara,
	ret;
	
for (var i=1,len=string_length(str);i<=len;i++){
	chara = string_char_at(str, i);
	
	if (chara == del) {
		if (word != "") {
			ret[count++] = real(word);
			word = "";
		}
	}else{
		word += chara;
	}
}

if (word != "") {
	ret[count] = real(word);
}

return ret;