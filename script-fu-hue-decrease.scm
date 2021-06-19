(define (script-fu-decrease-hue)
    (let* ( (clr (car (gimp-context-get-foreground)) ) (X (apply max clr)) (N (apply min clr)) 
            (A (car clr)) (B (cadr clr)) (C (caddr clr)) )
        (cond   ( (or (and (< B C) (< C A) ) (and (= B C) (< C A) ) ) 
                    (let* ((M (+ C 5))) (if (< M X) (gimp-context-set-foreground (list A B M)) (gimp-context-set-foreground (list A B X)) )) ) 
                ( (or (and (< B A) (< A C) ) (and (= A C) (< B A) ) ) 
                    (let* ((M (- A 5))) (if (< N M) (gimp-context-set-foreground (list M B C)) (gimp-context-set-foreground (list N B C)) )) ) 
                ( (or (and (< A B) (< B C) ) (and (= A B) (< B C) ) ) 
                    (let* ((M (+ B 5))) (if (< M X) (gimp-context-set-foreground (list A M C)) (gimp-context-set-foreground (list A X C)) )) ) 
                ( (or (and (< A C) (< C B) ) (and (= B C) (< A C) ) ) 
                    (let* ((M (- C 5))) (if (< N M) (gimp-context-set-foreground (list A B M)) (gimp-context-set-foreground (list A B N)) )) ) 
                ( (or (and (< C A) (< A B) ) (and (= A C) (< A B) ) ) 
                    (let* ((M (+ A 5))) (if (< M X) (gimp-context-set-foreground (list M B C)) (gimp-context-set-foreground (list X B C)) )) ) 
                ( (or (and (< C B) (< B A) ) (and (= A B) (< C B) ) ) 
                    (let* ((M (- B 5))) (if (< N M) (gimp-context-set-foreground (list A M C)) (gimp-context-set-foreground (list A N C)) )) ) 
        )
    )
)
(script-fu-register
"script-fu-decrease-hue"                        ;func name
"Decrease Hue"                                  ;menu label
"Decreases the value of the hue for the current\
   forground color by 3."               ;description
"Ethireal"                              ;author
""                                      ;copyright notice
"May 17, 2021"                          ;date created
"*"                     ;image type that the script works on
)
(script-fu-menu-register "script-fu-decrease-hue" "<Image>/Tools/Paint Tools/Color Adjust")

