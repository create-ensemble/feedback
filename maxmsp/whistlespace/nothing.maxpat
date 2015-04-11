{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 50.0, 44.0, 274.0, 165.0 ],
		"bgcolor" : [ 0.87451, 0.933333, 1.0, 1.0 ],
		"bglocked" : 0,
		"defrect" : [ 50.0, 44.0, 274.0, 165.0 ],
		"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 0,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 0,
		"toolbarvisible" : 1,
		"boxanimatetime" : 200,
		"imprint" : 0,
		"boxes" : [ 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p status",
					"fontsize" : 9.0,
					"numinlets" : 0,
					"patching_rect" : [ 101.0, 65.0, 46.0, 17.0 ],
					"id" : "obj-1",
					"numoutlets" : 0,
					"fontname" : "Arial",
					"color" : [ 1.0, 0.890196, 0.090196, 1.0 ],
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 298.0, 133.0, 351.0, 154.0 ],
						"bglocked" : 0,
						"defrect" : [ 298.0, 133.0, 351.0, 154.0 ],
						"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 0,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 0,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"boxes" : [ 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "Really!",
									"fontsize" : 9.0,
									"numinlets" : 1,
									"patching_rect" : [ 19.0, 85.0, 58.0, 17.0 ],
									"id" : "obj-1",
									"numoutlets" : 0,
									"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "Michael Zbyszynski reviewed this patch in July-August 2007 for correctness, style, generality, efficiency, and overall design.",
									"linecount" : 2,
									"fontsize" : 9.0,
									"numinlets" : 1,
									"patching_rect" : [ 18.0, 41.0, 290.0, 27.0 ],
									"id" : "obj-2",
									"numoutlets" : 0,
									"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
									"fontname" : "Arial"
								}

							}
 ],
						"lines" : [  ]
					}
,
					"saved_object_attributes" : 					{
						"fontface" : 0,
						"default_fontname" : "Arial",
						"fontsize" : 12.0,
						"default_fontsize" : 12.0,
						"globalpatchername" : "",
						"fontname" : "Arial",
						"default_fontface" : 0
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "bgcolor 223 238 255",
					"fontsize" : 9.0,
					"numinlets" : 4,
					"patching_rect" : [ 25.0, 20.0, 106.0, 17.0 ],
					"hidden" : 1,
					"id" : "obj-2",
					"numoutlets" : 0,
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "uc_license",
					"fontsize" : 9.0,
					"numinlets" : 0,
					"patching_rect" : [ 42.0, 65.0, 57.0, 17.0 ],
					"id" : "obj-3",
					"numoutlets" : 0,
					"fontname" : "Arial",
					"color" : [ 1.0, 0.890196, 0.090196, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "nothing version 1.0beta by Matthew Wright",
					"fontsize" : 9.0,
					"numinlets" : 1,
					"patching_rect" : [ 25.0, 39.0, 205.0, 17.0 ],
					"id" : "obj-4",
					"numoutlets" : 0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "outlet",
					"numinlets" : 1,
					"patching_rect" : [ 7.0, 63.0, 15.0, 15.0 ],
					"id" : "obj-5",
					"numoutlets" : 0,
					"comment" : ""
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "inlet",
					"numinlets" : 0,
					"patching_rect" : [ 7.0, 41.0, 15.0, 15.0 ],
					"id" : "obj-6",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"comment" : ""
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-6", 0 ],
					"destination" : [ "obj-5", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
 ]
	}

}
