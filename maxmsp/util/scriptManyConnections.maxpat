{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 2,
			"revision" : 2,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 84.0, 129.0, 651.0, 604.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"assistshowspatchername" : 0,
		"boxes" : [ 			{
				"box" : 				{
					"bubble" : 1,
					"id" : "obj-6",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 80.0, 389.0, 206.0, 51.0 ],
					"presentation_linecount" : 3,
					"text" : "(Note that [uzi 12 0] counts 0 - 11, matching thispatcher's 0-orgin numbering of inlets & outlets.)"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-41",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 89.0, 358.5, 114.0, 20.0 ],
					"text" : "to make our ship go"
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"id" : "obj-38",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 80.0, 332.5, 60.0, 24.0 ],
					"text" : "BANG"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.109803921568627, 0.631372549019608, 0.211764705882353, 1.0 ],
					"bgcolor2" : [ 0.109803921568627, 0.631372549019608, 0.211764705882353, 1.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_autogradient" : 0.0,
					"bgfillcolor_color" : [ 0.149019607843137, 0.647058823529412, 0.247058823529412, 1.0 ],
					"bgfillcolor_color1" : [ 0.109803921568627, 0.631372549019608, 0.211764705882353, 1.0 ],
					"bgfillcolor_color2" : [ 0.2, 0.2, 0.2, 1.0 ],
					"bgfillcolor_proportion" : 0.5,
					"bgfillcolor_type" : "color",
					"gradient" : 1,
					"id" : "obj-39",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 142.0, 332.5, 29.5, 22.0 ],
					"text" : "4",
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"id" : "obj-35",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 302.5, 439.5, 227.0, 37.0 ],
					"text" : "Edit this \"script\" message box to reflect the names you have choosen. "
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.109803921568627, 0.631372549019608, 0.211764705882353, 1.0 ],
					"bgcolor2" : [ 0.109803921568627, 0.631372549019608, 0.211764705882353, 1.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_autogradient" : 0.0,
					"bgfillcolor_color" : [ 0.149019607843137, 0.647058823529412, 0.247058823529412, 1.0 ],
					"bgfillcolor_color1" : [ 0.109803921568627, 0.631372549019608, 0.211764705882353, 1.0 ],
					"bgfillcolor_color2" : [ 0.2, 0.2, 0.2, 1.0 ],
					"bgfillcolor_proportion" : 0.5,
					"bgfillcolor_type" : "color",
					"gradient" : 1,
					"id" : "obj-36",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 533.5, 447.0, 29.5, 22.0 ],
					"text" : "3",
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"id" : "obj-33",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 245.0, 269.5, 192.0, 51.0 ],
					"text" : "Repeat the process for the dac~ (note this one has already been named \"dacBird\")"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.109803921568627, 0.631372549019608, 0.211764705882353, 1.0 ],
					"bgcolor2" : [ 0.109803921568627, 0.631372549019608, 0.211764705882353, 1.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_autogradient" : 0.0,
					"bgfillcolor_color" : [ 0.149019607843137, 0.647058823529412, 0.247058823529412, 1.0 ],
					"bgfillcolor_color1" : [ 0.109803921568627, 0.631372549019608, 0.211764705882353, 1.0 ],
					"bgfillcolor_color2" : [ 0.2, 0.2, 0.2, 1.0 ],
					"bgfillcolor_proportion" : 0.5,
					"bgfillcolor_type" : "color",
					"gradient" : 1,
					"id" : "obj-34",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 439.0, 284.0, 29.5, 22.0 ],
					"text" : "2",
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"id" : "obj-28",
					"linecount" : 4,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 205.25, 134.5, 218.75, 64.0 ],
					"text" : "Select gainStage object, open inspector & declare the scripting name (note this one has already been named \"gainSnuffy\")"
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-20",
					"lockeddragscroll" : 0,
					"lockedsize" : 0,
					"maxclass" : "bpatcher",
					"name" : "gainStage.maxpat",
					"numinlets" : 101,
					"numoutlets" : 100,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal" ],
					"patching_rect" : [ 29.0, 107.5, 174.0, 173.0 ],
					"varname" : "gainSnuffy",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.109803921568627, 0.631372549019608, 0.211764705882353, 1.0 ],
					"bgcolor2" : [ 0.109803921568627, 0.631372549019608, 0.211764705882353, 1.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_autogradient" : 0.0,
					"bgfillcolor_color" : [ 0.149019607843137, 0.647058823529412, 0.247058823529412, 1.0 ],
					"bgfillcolor_color1" : [ 0.109803921568627, 0.631372549019608, 0.211764705882353, 1.0 ],
					"bgfillcolor_color2" : [ 0.2, 0.2, 0.2, 1.0 ],
					"bgfillcolor_proportion" : 0.5,
					"bgfillcolor_type" : "color",
					"gradient" : 1,
					"id" : "obj-16",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 426.0, 155.5, 29.5, 22.0 ],
					"text" : "1",
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-14",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 19.0, 334.0, 57.0, 57.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 21.0, 474.0, 67.0, 22.0 ],
					"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
					"text" : "thispatcher"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-11",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 21.0, 447.0, 220.0, 22.0 ],
					"text" : "script connect gainSnuffy $1 dacBird $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-8",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 3,
					"outlettype" : [ "bang", "bang", "int" ],
					"patching_rect" : [ 19.0, 404.0, 51.0, 22.0 ],
					"text" : "uzi 12 0"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 1.0, 0.16078431372549, 0.972549019607843, 1.0 ],
					"id" : "obj-4",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 21.0, 516.0, 470.0, 20.0 ],
					"text" : "USAGE: Copy thie uzi+script message & thispatcher to the patch need, use it & delete."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 21.0, 43.0, 613.0, 33.0 ],
					"text" : "Easier way to connect 2 objects with many ins and outs. To use copy the uzi, script & thispatcher to desired patch and use, then delete. For more info on scripting see thispatcher help"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 30.0,
					"id" : "obj-3",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 21.0, 1.0, 327.0, 40.0 ],
					"text" : "scriptManyConnections"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.815686274509804, 0.764705882352941, 0.07843137254902, 1.0 ],
					"id" : "obj-17",
					"maxclass" : "newobj",
					"numinlets" : 14,
					"numoutlets" : 0,
					"patching_rect" : [ 22.0, 288.5, 220.0, 22.0 ],
					"text" : "dac~ 1 2 3 4 6 7 8 9 10 11 12 13 14 115",
					"varname" : "dacBird"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"source" : [ "obj-8", 2 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "gainStage.maxpat",
				"bootpath" : "~/repos/feedback/maxmsp/library",
				"patcherrelativepath" : "../library",
				"type" : "JSON",
				"implicit" : 1
			}
 ],
		"autosave" : 0
	}

}
