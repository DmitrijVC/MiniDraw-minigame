#macro minidraw_sprites 0
#macro minidraw_frames 1

/// @param type			(int)		minidraw_sprites | minidraw_frames
/// @param canvas		(sprite)	sprite of the canvas
/// @param sprite0		(sprite)	first sprites from image_data or sprite containing image frames
/// @param image_data	(list)		sprites or frames
/// @param path		    (path)		path of the cursor
/// @param position		(array)		x and y position of the object
/// @param [layer]		(string)	OPTIONAL layer name

var
_type = argument[0],
_canvas = argument[1],
_sprite0 = argument[2],
_img_dat = argument[3],
_path = argument[4],
_pos = argument[5],
_layer = undefined,
;
if argument_count > 6 _layer = argument[6];

globalvar minidraw_running, minidraw_point_deviation;
minidraw_point_deviation = 0

if variable_global_exists("minidraw_running") {
	if minidraw_running{
		show_error("MiniDraw is already running", true);
	} else {
		minidraw_running = true;
	}
} else {
	minidraw_running = true;	
}


if _layer == undefined _layer = layer;
var _inst = instance_create_layer(_pos[0], _pos[1], _layer, obj_mg_minidraw);
_inst.sprite_index = _canvas;
_inst.sprite = _sprite0;
_inst.img_dat = _img_dat;
_inst.img_type = _type;
_inst.path = _path;
