/// @description Insert description here
// You can write your code in this editor
shader_set(shReplaceColor)

shader_set_uniform_f(sh_handle_range,5)

shader_set_uniform_f(sh_handle_replace,
	ColorReplace.toShaderValue(ColorReplace.red),
	ColorReplace.toShaderValue(ColorReplace.green),
	ColorReplace.toShaderValue(ColorReplace.blue)
)

draw_self()
shader_reset()
