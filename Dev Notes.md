![The Ghosts](https://github.com/bat26/the_ghosts/blob/master/the%20ghosts.png?raw=true "The Ghosts")

# Dev Notes

# Functions / Scripting

* Always use "spawn" when calling new functions with event handlers etc, as this will ensure they are placed in a new thread worker when executing.
* Inline and Block comments break the debug console, so make sure you strip them out when testing a script or function
* When debugging it is best to put the script inside a variable using closure e.g. `TestFunc = { your code here };`


# Tools

Arma 3 Addon Tools
    * Addon Builder
    * PAA Tool
    * DePBO
    
    