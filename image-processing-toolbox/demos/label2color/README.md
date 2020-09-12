<div align="center"><img class="aligncenter" src="https://github.com/jinglou/downloads/blob/master/image-processing-toolbox/demos/label2color/demo_label2color_result.png" alt="Image Processing Toolbox using MATLAB - label2color" title="Image Processing Toolbox using MATLAB - label2color" width="70%"/></div>

<br/>

## label2color

LABEL2COLOR Converts Label Matrix to RGB Image with Specified Properties.

RGB = LABEL2COLOR(X) converts a label matrix X into a color RGB image with default properties for the purpose of visualizing the labeled regions.

RGB = LABEL2COLOR(X,PARAM1,VAL1,PARAM2,VAL2,___) converts a label matrix X, specifying parameters and corresponding values that control various aspects of the RGB image. Parameter case does not matter.

PROPERTIES can be a comma-separated list of strings
 - 'ColorMap'   -  colormap   (default 'jet')
 - 'ZeroColor'  -  background color (uint8/double, default [0 0 0])
 - 'EdgeColor'  -  edge color (uint8/double, default [255 255 255])
 - 'EdgeWidth'  -  edge width (default 1)

### Class Support

The input label matrix X can have any numeric class. It must contain finite nonnegative integers. RGB is uint8.

### Examples
 - Example 1
	```matlab
	RGB = label2color(X);
	```

 - Example 2
	```matlab
	RGB = label2color(X,'colormap','summer');
	```

 - Example 3
	```matlab
	RGB = label2color(X,'ColorMap','hot','ZeroColor',[0 0 1],'EdgeColor',[1 1 1],'EdgeWidth',3);
	```

###Updates
 - 23/12/2015, ver 1.30, support custom colormap
 - 22/12/2015, ver 1.23, add demo
 - 22/12/2015, ver 1.22, 'numregion' should plus 1; set default 'ColorMap' to 'jet'
 - 22/12/2015, ver 1.21, remove 'assignin'
 - 21/12/2015, ver 1.20, support any numeric class
 - 20/12/2015, ver 1.10, modify the code for 'EdgeWidth'


Copyright (C) 2015 [Jing Lou (楼竞)](http://www.loujing.com)
