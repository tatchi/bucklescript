


class type  x = 
  object
    method say : int -> int
  end



let f  (u : x ) = u # say 32

let suites = Mt.[
  "caml_obj", (fun _ -> Eq (33, f (object method say x = 1 + x end)));
  "js_obj", (fun _ -> let module N = 
    struct
      external mk : say:'a -> <say:'a> = ""[@@bs.obj] 
    end 
  in Eq(34, f (N.mk ~say:(fun x -> x + 2)
            )))
]

;; Mt.from_pair_suites __FILE__ suites
