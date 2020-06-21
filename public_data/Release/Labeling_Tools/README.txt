This tool is developed by Xi Yin for leaf labeling. 
If you have any questions about the tool, please contact the author at yinxi1@msu.edu. 

Get started:
1) You need to have MATLAB installed in order to use this GUI tool; 

2) Please save all images that you would like to label into folders. 
   In each folder, please write a MAT file indicating the names of all files that you would like to label. 
   This is an example to write the file: 'filenames.mat':
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	filenames = cell(100,1);
	for im = 1 : 100
		filenames{im} = ['image_name_', num2str(im), '.jpg'];
	end
	save('filenames.mat', 'filenames')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

3) Open MATLAB, go to the folders 'GUI/'. Type 'guide('LeafLabel.fig')' in MATLAB command line.
   The guide will open, click the green 'Run' button (the last one on the tool bar);

4) Start labeling by clicking 'Open', select the image that you would like to label. 

Functions for each button:
- Open: open an image and start labeling, the file name will be shown on the interface. 

- Next: whenever the label on one image finished, click 'Next' to go to the next image. 
        The labeling results will be saved automatically. 

- Previous: similar to 'Next', it goes to previous image. Be careful with 'Next' and 'Previous'. 
            Try to label in forward or backward order. Do not switch between two orders, otherwise the labels will be overwritten. 

- Tip Label: start tip label by clicking (using left button of the mouse) the outer tip first, followed by the inner tip. 
            A dot will be shown on the image for visualization. If you would like to delete one of the tip point, 
            click the right button of the mouse near that tip point. And relabel immediately after remove it. 
            After tip labeling, please click 'enter' on keyboard to exit tip label.

- Show Tip: you can click it to show or not show the tip labels on the image. 

- Clear Tip: remove all labeled tip locations. 

- Leaf Label: this allows you to label one leaf at a time. Start labeling the boundary of each leaf by clicking several points 
              on the boundary of each leaf. Double click the leaf button of the mouse to end the labeling of each leaf. 
              Do not click other buttons before you finishing labeling one leaf. 

- Clear: delete the leaf label of the last labeled leaf.

- Clear All: delete all leaf labels.

- Invisible: during the labeling for a leaf sequence, whenever there is one leaf that becomes invisible, click this button to skip 
             the labeling of that leaf. If you do not care about consistency over time, you do not need to use this button. 

- Restart: delete all labels, including tips and leaf segment, and start over the label again for the current image. 








 