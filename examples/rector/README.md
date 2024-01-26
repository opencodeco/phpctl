# Rector

This is an example of how to use Rector to refactor your code.

Run `phpctl rector -n` (yes, with the `-n` flag) to see what Rector would do.

You should be seeing something like:
```shell
➜  rector git:(feat/rector) ✗ phpctl rector -n
Running opencodeco/phpctl:php82
 1/1 [▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓] 100%
1 file with changes
===================

1) src/example.php:0

    ---------- begin diff ----------
@@ @@
 <?php

-$arr = array();
+$arr = [];
    ----------- end diff -----------

Applied rules:
 * LongArrayToShortArrayRector


                                                                                                                        
 [OK] 1 file would have changed (dry-run) by Rector                                                                     
                                                                                                                        


```

Where Rector attempts to change the code from using `array()` to `[]`.
