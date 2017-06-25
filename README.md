# lift-mods

## Modify LIFT files before loading in Dictionary App Builder

This is a basic set of files run by a patch file to change a LIFT file output from FieldWorks Language Explorer. 

* It allows you to reorder the gloss languages so you choose which language show with the vernacular in Dictionary App Builder. 
* The script can also add one or two language tabs for semantic domain words and numbers.

    1. Download the zip file.
    2. Unzip the file and put all files in one folder
    3. Put your LIFT file into that folder too.
    4. All modifications should be made to the project.txt file.
    5. Just double click it and edit:
        1. line 5 classification=IndonesianHere, this is the label word/s to appear in the entry before the number and word
        2. line 7 beforesemnumb=no. This can be just a letter or as set of letters meaningful to users.
    6. Save changes.
    7. Double click the fix-lift.cmd file to make the changes.

If at a later stage you want to remake with no number tab just change shownsemumbertab=on  to shownsemumbertab=off
