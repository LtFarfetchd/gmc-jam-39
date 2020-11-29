// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_arrayChoose(){
	var array = argument[0];
	return array[irandom(array_length(array) - 1)];
}