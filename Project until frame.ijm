/** ===============================================================================
 * Copyright (C) 2020 Jan Niklas Hansen
 *  * 
 * This macro is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation (http://www.gnu.org/licenses/gpl.txt )
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public
 * License along with this program.  If not, see
 * <http://www.gnu.org/licenses/gpl-3.0.html>.
 *    
 * For any questions please feel free to contact me (jan.hansen@uni-bonn.de).
* =============================================================================== */

imgID = getImageID();
selectImage(imgID);
Stack.getDimensions(ww, hh, channels, slices, frames);

selectImage(imgID);
run("Duplicate...", "duplicate");
copyID = getImageID();
selectImage(copyID);
run("Stack to Hyperstack...", "order=xyczt(default) channels=1 slices="
		+ slices + " frames=" + frames + " display=Color");

for (i = 0; i < frames; i++) {
	j = 0;
	selectImage(imgID);	
	run("Z Project...", "stop=" + (i+1) 
		+ " projection=[Max Intensity]");

	tempID = getImageID();
	selectImage(tempID);	
	run("Select All");
	run("Copy");

	selectImage(tempID);
	close();
	
	selectImage(copyID);
	Stack.setPosition(1, j + 1, i + 1);
	run("Select All");
	run("Paste");
}
selectImage(copyID);