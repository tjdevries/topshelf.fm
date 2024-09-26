module Button = struct
  external make
    :  ?onClick:(unit -> unit)
    -> ?children:React.element
    -> ?variant:string
    -> ?className:string
    -> React.element
    = "Button"
  [@@react.component] [@@mel.module "@/components/ui/button"]
end

module Input = struct
  external make
    :  ?onClick:(unit -> unit)
    -> ?children:React.element
    -> React.element
    = "Input"
  [@@react.component] [@@mel.module "@/components/ui/input"]
end

module Spotify = struct
  external make
    :  ?onClick:(unit -> unit)
    -> ?children:React.element
    -> ?className:string
    -> url : string
    -> React.element
    = "SpotifyLink"
  [@@react.component] [@@mel.module "@/components/spotify"]
end

module Sidebar = struct
  external make
    :  ?onClick:(unit -> unit)
    -> ?children:React.element
    -> ?className:string
    -> React.element
    = "PodcastSidebar"
  [@@react.component] [@@mel.module "@/components/sidebar"]
end
