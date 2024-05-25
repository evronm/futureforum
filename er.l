
(load "lib/marley.l")

(symbols 'entities 'pico)

(class +Client +Jamaica +Rest)
  (dm home> (User)
    (cond 
      ((not User))
      ()))
  (dm nav> (User)
    (cond 
      ((not User) ())
      (T ($div '((id . nav)) (list ($a '((href . "/prediction")) "Browse predictions") ($a '((href . "/bid")) "Browse bids") ($a '((href . "/ask")) "Browse asks"))))))


(class +User +user +Rest)
  (rel addr (+Idx +String) (crud r c))
  (rel nm (+Need +Sn +Idx +String) (crud r c))
  (rel predictions (+List +Joint) user (+Prediction) (rud r NIL))
  (rel offers (+List +Joint) user (+offer) (rud r NIL))
  (rel bids (+List +Joint) user (+Bid) (rud r NIL))
  (rel asks (+List +Joint) user (+Ask) (rud r NIL))

(class +Prediction +REntity +Rest)
  (var perms crud rc r)

  (rel nm (+Need +Sn +Aux +Key +String) (crud cr rm))
  (rel desc (+Need +Idx +String) (crud rc cm))
  (rel user (+List +Joint) predictions (+User) (crud c r))
  (rel offers (+List +Joint) pred (+offer) (rud r NIL))
  (rel bids (+List +Joint) pred (+Bid) (rud r NIL))
  (rel asks (+List +Joint) pred (+Ask) (rud r NIL))

(class +offer +REntity)
  (rel price (+Need +Number +Key) (crud r r r))
  (rel qty (+Need +Number +Key) (crud r r r))
  (rel pred (+List +Joint) offers (+Prediction) (crud c r))
  (rel user (+List +Joint) offers (+User) (crud c r))

(class +Bid +offer +Rest)
  (rel user (+List +Joint) bids (+User) (crud c r))
  (rel pred (+List +Joint) bids (+Prediction) (crud c r))

(class +Ask +offer +Rest)
  (rel user (+List +Joint) asks (+User) (crud c r))
  (rel pred (+List +Joint) asks (+Prediction) (crud c r))

(load T)
#(bye)
