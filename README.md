# lift-mods

## Modify LIFT files before loading in Dictionary App Builder

This is a basic set of files run by a patch file to change a LIFT file output from FieldWorks Language Explorer. 

* It allows you to reorder the gloss languages so you choose which language show with the vernacular in Dictionary App Builder. 
* The script can also add one or two language tabs for semantic domain words and numbers.

    1. Download the zip file.
    2. Unzip the file and put all files in one folder
    3. Put your LIFT file into that folder too.
    4. Download a copy of saxon9he.jar from http://saxon.sourceforge.net/ and put it in the folder.
    5. You also need Java installed. Java must be in your path. Java installers do this by default.
    6. Double click on the transform.hta
    7. Click on the Edit Project button.
    8. Make modifications to the project.txt file in Notepad then save.
        1. line with classification=grouping, this is the label word/s to appear in the entry before the number and word
        2. line with beforeSemanticNumb=no. This can be just a letter or as set of letters meaningful to users.
        3. line with infile=filename.lift  change filename to match your filename.
        4. line with outfile=filename-mod.lift change the filename part.
    9. Save changes. Close Notepad.
    10. Click the Run transformation button.

If at a later stage you want to remake with no number tab just change showSemanticNumberTab=on  to showSemanticNumberTab=off

The other on switches can be turned off to turn off other features.
