/// @function scr_build_map(key, pair [, key, pair, ...])
/// @description builds a map using a series of ordered key, value pairs
function scr_build_map() {
	var returnMap = ds_map_create();
	if (argument_count % 2 == 0) {
		for (var i = 0; i < argument_count + 1; i+=2) {
			ds_map_add(returnMap, argument[i], argument[i+1]);
		}
	}
	return returnMap;
}