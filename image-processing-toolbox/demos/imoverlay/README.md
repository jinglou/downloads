<div align="center"><img class="aligncenter" src="https://raw.githubusercontent.com/jinglou/downloads/master/image-processing-toolbox/demos/imoverlay/demo_imoverlay_result.png" alt="Image Processing Toolbox using MATLAB - imoverlay" title="Image Processing Toolbox using MATLAB - imoverlay" width="70%"/></div>

## imoverlay

IMOVERLAY Creates Label Matrix MAP based Image Overlay with Specified Properties.

  RGB = IMOVERLAY(X,MAP) generates an output image RGB by overlaying a label matrix MAP onto the input image X with default parameter values.

  RGB = IMOVERLAY(X,MAP,PARAM1,VAL1,PARAM2,VAL2,___) overlays a label matrix MAP onto the input image X, specifying parameters and corresponding values that control various aspects of the output image RGB.

### Class Support

  The input image X and label matrix MAP can be uint8, uint16, or double.

  The label matrix MAP must contain finite nonnegative integers.

  The output RGB is an M-by-N-by-3 array of class uint8.

  PROPERTIES can be a comma-separated list of strings:
  - 'ColorMap'   -  colormap   (default 'jet')
  - 'FaceAlpha'  -  MAP transparency  (range [0,1], default 1 denotes opacity). `If FaceAlpha equals to -1, the following five properties will be ignored.`
  - 'ZeroColor'  -  background color  (uint8/double, default black)
  - 'ZeroAlpha'  -  background transparency (range [0,1], default 1 denotes opacity)
  - 'EdgeColor'  -  edge color (uint8/double, default white)
  - 'EdgeAlpha'  -  edge transparency (range [0,1], default 1 denotes opacity)
  - 'EdgeWidth'  -  edge width (default 1)

### Examples

  - Example 1
	```matlab  
	RGB = imoverlay(X,map);
	```

  - Example 2
	```matlab
  	RGB = imoverlay(X,map,'colormap',cmap,'facealpha',0.5,'zerocolor',[255 0 0],'zeroalpha',0.3,'edgewidth',5,'edgecolor',[1 1 0],'edgealpha',0.7);
	```

  - Example 3
	```matlab
  	RGB = imoverlay(X,map,'facealpha',-1,'colormap','jet');
	```


### Reference ('FaceAlpha' equals to -1)

  http://www.vision.caltech.edu/~harel/share/gbvs.php

### Updates

  - 26/12/2015, ver 1.01, bug fix for custom ColorMap	
  - 25/12/2015, ver 1.00


Copyright (C) 2015 [Jing Lou](http://www.loujing.com)