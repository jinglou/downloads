% demo for label2color
% LABEL2COLOR Converts Label Matrix to RGB Image with Specified Properties.
%
%   MATLAB source code is available at https://github.com/jinglou/downloads/tree/master/image-processing-toolbox/demos/label2color
%                                   or https://www.mathworks.com/matlabcentral/fileexchange/54579-label2color
%
%   23/12/2015
%
%   Copyright (C) 2015 Jing Lou (http://www.loujing.com)
%

clc; clear; close all;

%% input is class uint8
X = imread('X1.png');

% Example 1
RGB = label2color(X);
figure,imshow(RGB),title('Example 1');

% Example 2
RGB = label2color(X,'colormap','summer');
figure,imshow(RGB),title('Example 2');

% Example 3 - custom colormap
cmap = [1 0 0;
		0 1 0;
		0 0 1];
RGB =  label2color(X,'colormap',cmap,'zerocolor',[0.1 0 0.2]);
figure,imshow(RGB),title('Example 3');

% Example 4
RGB = label2color(X,'ColorMap',hot(8),'ZeroColor',[0 0 255],'EdgeColor',[255 255 255],'EdgeWidth',3);
figure,imshow(RGB),title('Example 4');


%% input is class double
load X2.mat;

% Example 5
RGB = label2color(X2,'ColorMap','summer','EdgeColor',[255 0 0]);
figure,imshow(RGB),title('Example 5');
