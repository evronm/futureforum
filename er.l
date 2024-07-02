
(load "lib/marley.l")

(symbols 'entities 'pico)

#{(class +Client +Jamaica +Rest)
  (dm home> (User)
    (cond 
      ((not User))
      ()))
  (dm nav> (User)
    (cond 
      ((not User) ())
      (T ($div '((id . nav)) (list ($a '((href . "/prediction")) "Browse predictions") ($a '((href . "/bid")) "Browse bids") ($a '((href . "/ask")) "Browse asks"))))))}#


(class +User +user +Rest)
  (rel predictions (+List +Joint) user (+Prediction) (rud r NIL))
  (rel bids (+List +Joint) user (+Bid) (rud r NIL))
  (rel asks (+List +Joint) user (+Ask) (rud r NIL))
  (rel trxns (+List +Joint) user (+Trxn) (rud r r r))

(class +Prediction +REntity +Rest)
  (var perms crud rc r)

  (rel nm (+Need +Sn +Aux +Key +String) (crud cr rm))
  (rel desc (+Need +Idx +String) (crud rc cm))
  (rel user (+List +Joint) predictions (+User) (crud c r))
  (rel bids (+List +Joint) pred (+Bid) (rud r NIL))
  (rel asks (+List +Joint) pred (+Ask) (rud r NIL))

(class +offer +REntity)
  (var perms crud rc r)
  (var list_rels (price qty))
  (rel price (+Need +Number +Key) (crud r r r))
  (rel qty (+Need +Number +Key) (crud r r r))
  (rel trxns (+List +Joint) offer (+Trxn) (crud r r r))

(class +Bid +offer +Rest)
  (var list_rels (price qty))
  (rel user (+List +Joint) bids (+User) (crud c r))
  (rel pred (+List +Joint) bids (+Prediction) (crud c r))

(class +Ask +offer +Rest)
  (var list_rels (price qty))
  (rel user (+List +Joint) asks (+User) (crud c r))
  (rel pred (+List +Joint) asks (+Prediction) (crud c r))

(class +Trxn +REntity +Rest)
  (var perms crud rc r)
  (var list_rels (qty dt tm))

  (rel dt (+Date) (crud r r r))
  (rel tm (+Time) (crud r r r))
  (rel qty (+Need +Number) (crud r r r))
  (rel offer (+Link +Joint) trxns (+offer) (crud r r r))
  (rel user (+List +Joint) trxns (+User) (crud c r))


(load T)
#(bye)
