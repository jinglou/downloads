
function RGB = label2color(varargin)
%LABEL2COLOR Converts Label Matrix to RGB Image with Specified Properties.
%   RGB = LABEL2COLOR(X) converts a label matrix X into a color RGB image 
%   with default properties for the purpose of visualizing the labeled regions.
%	
%   RGB = LABEL2COLOR(X,PARAM1,VAL1,PARAM2,VAL2,___) converts a label matrix X, 
%   specifying parameters and corresponding values that control various aspects of the RGB image. 
%   Parameter case does not matter.
%
%   PROPERTIES can be a comma-separated list of strings
%     'ColorMap'   -  colormap   (default 'jet')
%     'ZeroColor'  -  background color (uint8/double, default [0 0 0])
%     'EdgeColor'  -  edge color (uint8/double, default [255 255 255])
%     'EdgeWidth'  -  edge width (default 1)
%
%   Class Support
%   -------------
%   The input label matrix X can have any numeric class. It must contain
%   finite nonnegative integers. RGB is uint8.
%
%   Example 1
%   ---------
%   RGB = label2color(X);
%
%   Example 2
%   ---------
%   RGB = label2color(X,'colormap','summer');
%
%   Example 3
%   ---------
%   RGB = label2color(X,'ColorMap','hot','ZeroColor',[0 0 1],'EdgeColor',[1 1 1],'EdgeWidth',3);
%
%
%   Updates
%   --------------------------------------------
%   23/12/2015, ver 1.30, support custom colormap
%   22/12/2015, ver 1.23, add demo
%   22/12/2015, ver 1.22, 'numregion' should plus 1; set default 'ColorMap' to 'jet'
%   22/12/2015, ver 1.21, remove 'assignin'
%   21/12/2015, ver 1.20, support any numeric class
%   20/12/2015, ver 1.10, modify the code for 'EdgeWidth'
%
%   Copyright (C) 2015 Jing Lou (http://www.loujing.com)
%

narginchk(1, inf);

paramPairs = varargin(2:end);
assert(rem(length(paramPairs),2)==0, 'need param-value pairs');
for k = 1:2:length(paramPairs)
	validateattributes(paramPairs{k},{'char'},{'nonempty'});
	% convert to lowercase
	paramPairs(k) = lower(paramPairs(k));
end

%----------------------------------------------------------------------
% colormap
numregion = double(max(varargin{1}(:)))+1;
ind_colormap = find(cellfun(@(s) strcmp('colormap',s), paramPairs), 1);
if isempty(ind_colormap)
	cmap = feval('jet',numregion);
else
	if ischar(paramPairs{ind_colormap+1})
		cmap = feval(paramPairs{ind_colormap+1},numregion);
	else
		cmap = paramPairs{ind_colormap+1};
	end
end

%----------------------------------------------------------------------
% zero color
ind_zerocolor = find(cellfun(@(s) strcmp('zerocolor',s), paramPairs), 1);
if isempty(ind_zerocolor)
	zerocolor = [0 0 0];
else
	zerocolor = mat2gray(paramPairs{ind_zerocolor+1});
end
RGB = label2rgb(varargin{1},cmap,zerocolor);

%----------------------------------------------------------------------
% edge
ind_edgecolor = find(cellfun(@(s) strcmp('edgecolor',s), paramPairs), 1);
if isempty(ind_edgecolor)
	edgecolor = uint8([255 255 255]);
else
	edgecolor = im2uint8(mat2gray(paramPairs{ind_edgecolor+1}));
end

ind_edgewidth = find(cellfun(@(s) strcmp('edgewidth',s), paramPairs), 1);
if isempty(ind_edgewidth)
	edgewidth = 1;
else
	edgewidth = paramPairs{ind_edgewidth+1};
end

if ~isempty(ind_edgecolor) || ~isempty(ind_edgewidth)
	bwedge = edge(varargin{1},'roberts',0);
	if edgewidth > 1
		bwedge = imdilate(bwedge,ones(edgewidth)) > imerode(bwedge,ones(edgewidth));
	end
	tmp = reshape(RGB,[],size(RGB,3));
	tmp(logical(bwedge(:)),:) = repmat(edgecolor,sum(bwedge(:)),1);
	RGB = reshape(tmp,size(RGB));
end
