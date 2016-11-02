![The Ghosts](https://github.com/bat26/the_ghosts/blob/master/the%20ghosts.png?raw=true "The Ghosts")

# Dev Notes

# Functions / Scripting

* Always use "spawn" when calling new functions with event handlers etc, as this will ensure they are placed in a new thread worker when executing.
* Inline and Block comments break the debug console, so make sure you strip them out when testing a script or function
* When debugging it is best to put the script inside a variable using closure e.g. `TestFunc = { your code here };`

# Tips

* Use task framework https://community.bistudio.com/wiki/Arma_3_Task_Framework

# References

* Marker Types https://community.bistudio.com/wiki/cfgMarkers

* Scripting commands https://community.bistudio.com/wiki/Category:Scripting_Commands_Arma_3
* List of all ArmA 3 functions https://community.bistudio.com/wiki/Category:Arma_3:_Functions

* Magic variables https://community.bistudio.com/wiki/Magic_Variables
* Hold Actions https://forums.bistudio.com/topic/192346-woah-woah-woah-bi-trying-to-sneak-one-in/page-2#entry3065996
* Intro script http://www.armaholic.com/page.php?id=30731


# Tools

Arma 3 Addon Tools
    * Addon Builder
    * PAA Tool
    * DePBO
    
    