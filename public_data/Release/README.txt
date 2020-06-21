MSU-PID is collected at Plant Research Laboratory of Michigan State University. 
It can be used for leaf alignment, segmentation, tracking, and counting. 

If you use our dataset, please cite the following paper.

Multi-Modality Imagery Database for Plant Phenotyping.
Jeffrey A Cruz*, Xi Yin*, Xiaoming Liu, Saif M Imran, Daniel D Morries,
David M. Kramer, Jin Chen. (Cruz and Yin made euqal contribution)
Machine Vision and Applications, October 2015. 

If you have any question, please contact Xi Yin via yinxi.whu@gmail.com

======================================================
The database is organized in the following subdirectories: 
- Dataset/: directory containing all the images and labels.
- Labeling_Tools/: directory containing the labeling tool with a README.txt 
	inside that includes the instructions for using it.
- Performance_Evaluation/: Matlab functions used to evaluate the performance 
	of leaf alignment, segmentation, tracking, and counting. 

(1) Arabidopsis
- There are 16 plants captured in 9 days from 9am to 11pm (15 frames a day).
- Images: contain all modality and the depth sigma images: 
	_fmp, _ir, _rgb, _depth, _depthSigma
- Labels: we label 4 frames a day for each plant. (hour 9, 12, 16, 20).
	The original label is from fmp modality, which is identical for ir images.
	We also transfer the label from fmp to rgb. 

(2) Bean 
- There are 5 plants captured in 5 days from 8am to 9pm (14 frames a day).
- Images: contain all modality and the depth sigma images: 
	_fmp, _ir, _rgb, _depth, _depthSigma
- Labels: we label 7 frames a day for each plant. (hour 9,11,13,15,17,19,21).
	The original label is from fmp modality, which is identical for ir images.	

(3) Experimental Protocol
- Arabidopsis: 6 plants for training and 10 plants for testing. (plant 1 to 6 / plant 7 to 16)
- Bean: 2 plants for training and 3 plants for testing. (plant 1, 2 / plant 3, 4, 5)
