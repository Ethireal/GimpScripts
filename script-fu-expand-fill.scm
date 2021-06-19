(define (script-fu-expand-fill inImage inLayer)
    (gimp-image-undo-group-start inImage)
    (if (equal? (car (gimp-selection-bounds inImage)) TRUE)
    (begin
        ;expand the selection
        (gimp-selection-grow inImage 2)
        ;paint the selection
        (gimp-edit-fill inLayer 0)
        ;deselect selection
        (gimp-selection-none inImage)
    )
    (
        ;deselect selection
        (gimp-selection-none inImage)
    ))
    (gimp-image-undo-group-end inImage)
    (gimp-displays-flush)
)
(script-fu-register
"script-fu-expand-fill"                        ;func name
"Expand Fill"                                  ;menu label
"Expands the current selection by 2 pixels, and then fills\
    it with the bucket tool."               ;description
"Ethireal"                              ;author
""                                      ;copyright notice
"April 15, 2021"                          ;date created
"*"                     ;image type that the script works on
SF-IMAGE      "Current Image"  0   ;the current image
SF-DRAWABLE   "Current Layer"  0   ;the active layer
)
(script-fu-menu-register "script-fu-expand-fill" "<Image>/Tools/Paint Tools")