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
run("8-bit");
Stack.getDimensions(ww, hh, channels, slices, frames);
newImage("temp", "8-bit White", ww, hh, 1);
tempID = getImageID();
run("mpl-plasma");  //Replace "mpl-plasma" LUT to any LUT you like (e.g., "Spectrum", See all available LUTs and their names in your ImageJ at Image > Color > Display LUTs)
getLut(rA, gA, bA);

nrA = newArray(256);
ngA = newArray(256);
nbA = newArray(256);

selectImage(imgID);
run("Duplicate...", "duplicate");
run("RGB Color");
copyID = getImageID();
selectImage(copyID);
run("Stack to Hyperstack...", "order=xyczt(default) channels=1 slices="
		+ slices + " frames=" + frames + " display=Color");


for (i = 0; i < frames; i++) {
		colorscale = floor((256 / frames) * i);
		for (j = 0; j < 256; j++) {
			intensityfactor = j / 255;
			nrA[j] = round(rA[colorscale] * intensityfactor);
			ngA[j] = round(gA[colorscale] * intensityfactor);
			nbA[j] = round(bA[colorscale] * intensityfactor);
		}

		for (j = 0; j < slices; j++) {
			selectImage(imgID);
			Stack.setPosition(1, j + 1, i + 1);
			run("Select All");
			run("Copy");

			selectImage(tempID);
			run("Paste");
			setLut(nrA, ngA, nbA);
			run("RGB Color");
			run("Select All");
			run("Copy");
			run("8-bit");

			selectImage(copyID);
			Stack.setPosition(1, j + 1, i + 1);
			run("Select All");
			run("Paste");
		}
	}
	selectImage(copyID);