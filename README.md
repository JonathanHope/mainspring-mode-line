
# Table of Contents

1.  [mainspring-mode-line](#org94d88bb)
    1.  [Overview](#orgaf7c32d)
    2.  [Installation](#org4de8097)


<a id="org94d88bb"></a>

# mainspring-mode-line

A pretty mode-line for Emacs.

![img](mainspring-mode-line.png)


<a id="orgaf7c32d"></a>

## Overview

mainspring-mode-line is a mode-line for Emacs. It shows the number of the window, whether the buffer is dirty, the name of the buffer, the project if any, the current major mode, a scrollbar, and the coordinates of the cursor.


<a id="org4de8097"></a>

## Installation

This uses PragmataPro fonts which are non-free. It also relies on projectile and winum. Once the fonts are installed it can be installed with straight like:

    (use-package mainspring-mode-line
      :straight (mainspring-mode-line :type git :host github :repo "jonathanhope/mainspring-mode-line"))
