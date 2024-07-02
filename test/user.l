(load 'er.l)
(symbols 'entities 'pico)

#create some users

(for N 20
  (process "post" '("user" "new") NIL (list (list "eml"  (pack "user" N "@eml.com")) (list "pw" "asdf") )))




