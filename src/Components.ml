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
  external make : ?onClick:(unit -> unit) -> ?children:React.element -> React.element = "Input"
  [@@react.component] [@@mel.module "@/components/ui/input"]
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

module Icons = struct
  module Spotify = struct
    external make
      :  ?onClick:(unit -> unit)
      -> ?children:React.element
      -> ?className:string
      -> url:string
      -> React.element
      = "SpotifyLink"
    [@@react.component] [@@mel.module "@/components/spotify"]
  end

  module Youtube = struct
    external make
      :  ?onClick:(unit -> unit)
      -> ?children:React.element
      -> ?className:string
      -> url:string
      -> React.element
      = "YoutubeLink"
    [@@react.component] [@@mel.module "@/components/youtube"]
  end

  module Rss = struct
    external make
      :  ?onClick:(unit -> unit)
      -> ?children:React.element
      -> ?className:string
      -> url:string
      -> React.element
      = "RssLink"
    [@@react.component] [@@mel.module "@/components/rss"]
  end
end
