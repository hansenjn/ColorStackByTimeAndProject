# Time-By-Color-Coded projection & video
ImageJ macros to [color stacks by time point](https://github.com/hansenjn/TimeByColorCodedProjectionVideos/blob/master/Color%20Coding%20Frames.ijm) and create a video in which a [stack projection builds up frame by frame](https://github.com/hansenjn/TimeByColorCodedProjectionVideos/blob/master/Project%20until%20frame.ijm).

These macros were written to generate, e.g., [Supplementary Movie S2](https://www.science.org/doi/suppl/10.1126/science.abd4914/suppl_file/abd4914s2.mov) of [this publication](https://www.science.org/doi/10.1126/science.abd4914).

You can use these macros in [FIJI](https://fiji.sc/) or [ImageJ](https://imagej.net/). I recommend to use FIJI, since it provides more Look-up tables than ImageJ and thus more ways of coloring the stack. If you do not use FIJI but ImageJ you will need to adapt one line of code in the macro since ImageJ does not contain the mpl-plasma LUT (see "customization" section below).

To use the macros:
- Open FIJI
- Drag and drop your tif file into FIJI
- Drag and drop the macro file into FIJI
- Press run in the macro file

## Workflow to make the color-coded time projection that builds-up frame by frame
- Run the [color coding frames](https://github.com/hansenjn/ColorStackByTimeAndProject/blob/master/Color%20Coding%20Frames.ijm) macro. This will color each of the frames in a different color.
- If desired, you can then also produce a color-coded projection image by making a maximum intensity projection (Image > Stacks > Z Project in FIJI) of the frames of interest
- If desired, use the AVI export function in FIJI / ImageJ (File > Save As > AVI...) to output the generated color-coded stack as an AVI (You can also specify how fast it is played in the dialog that will then show up)
- To make the video that shows the projection building up frame by frame, run the second macro [Project until frame](https://github.com/hansenjn/ColorStackByTimeAndProject/blob/master/Project%20until%20frame.ijm) on the output from the first macro [color coding frames](https://github.com/hansenjn/ColorStackByTimeAndProject/blob/master/Color%20Coding%20Frames.ijm) macro. It will make a video that builds up the projection frame by frame. 
- Use the AVI export function in FIJI / ImageJ (File > Save As > AVI...) to output the generated stack as an AVI (You can also specify how fast it is played in the dialog that will then show up)

## Getting an impression on the outputs
If you want to get an impression on how the movies created with these macros look like, have a look at [Supplementary Movie S2](https://www.science.org/doi/suppl/10.1126/science.abd4914/suppl_file/abd4914s2.mov) of [this publication](https://www.science.org/doi/10.1126/science.abd4914). In this supplementary movie, you can see the raw movie on the left, the output from the color-coding-frames.ijm macro in the middle, and on the right the output from running the project-until-frame.ijm on the output of the color-coding-frames.ijm macro, overlayed with the raw movie. 

To make this overlay of projecting building up and the raw movie, you will need to combine the output color-coded and projecting stack with the raw movie in FIJI or ImageJ by:
1. Opening the raw and the projection movie 
2. Converting both images to RGB (Select the image window and go to Image > Type > RGB Color in FIJI/ImageJ)
3. Go to Process > Image Calculator in FIJI / ImageJ, Select both images as Image 1 and Image 2 and select the AND operation, press OK

## Customization
To get different colorings of the stack, you may adapt the Look-up table (LUT) selected in the macro. By default the macro will color code the stack with the FIJI LUT "mpl-plasma" (as shown in Movie S2). You can change the LUT by changing the command in line 26 `run("mpl-plasma");` of the [color coding frames](https://github.com/hansenjn/ColorStackByTimeAndProject/blob/master/Color%20Coding%20Frames.ijm) macro. E.g., you can use the spectrum LUT from FIJI instead by changing the line to `run("spectrum");`. You can pick any LUT in FIJI you like, to show how the different LUTs look like go in FIJI to Image > Color > Display LUTs and you can see the different LUTs available in your FIJI and their names:
![Bildschirmfoto 2022-05-29 um 18 20 09](https://user-images.githubusercontent.com/27991883/170880202-7c429fa2-1a2a-4eb7-affa-2b77198de56c.png)

## Questions?
If you have any questions, please contact me here on GitHub through the issue system or drop an email at jan.hansen (at) uni-bonn.de
