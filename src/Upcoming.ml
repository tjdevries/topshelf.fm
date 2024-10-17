type upcoming =
  { guest : string
  ; topic : string
  ; date : string
  ; x_handle : string
  ; x_link : string
  }

let upcoming =
  [| { guest = "Ryan Dahl"
     ; topic = "Deno 2.0, JSR, and Rust"
     ; date = "2024-10-17T21:00:00.000Z"
     ; x_handle = "rough__sea"
     ; x_link = "https://x.com/rough__sea"
     }
   ; { guest = {js|José Valim|js}
     ; topic = "Everything Elixir"
     ; date = "2024-10-22T16:00:00.000Z"
     ; x_handle = "josevalim"
     ; x_link = "https://x.com/josevalim"
     }
   ; { guest = "Andreas Kling"
     ; topic = "Ladybird Browser: A new browser"
     ; date = "2024-10-29T16:00:00.000Z"
     ; x_handle = "awesomekling"
     ; x_link = "https://x.com/awesomekling"
     }
  |]
;;
