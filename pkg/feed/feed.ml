type channel =
  { title : string
  ; description : string
  ; link : string
  ; items : item array
  }

and item =
  { id : string
  ; title : string
  ; description : string
  ; summary : string
  ; link : string
  ; duration : string
  ; enclosure : enclosure
  }

(* <enclosure url="..." length="119334033" type="audio/mpeg"/> *)
and enclosure =
  { url : string
  ; length : int
  ; kind : string
  }
