open Base

let () = Fmt.pr "hello\n"

type channel =
  { title : string
  ; description : string
  ; link : string
  ; items : item list
  }

and item =
  { title : string
  ; description : string
  ; summary : string
  ; link : string
  }
[@@deriving show]

module Query = struct
  let text (node : Xml_light_types.xml) =
    match node with
    | PCData str -> str
    | _ -> failwith "could not get data"
  ;;

  let find_child (node : Xml_light_types.xml) name =
    match node with
    | Xml.Element (_, _, children) ->
      List.find_map children ~f:(function
        | Xml.Element (tag, _, [ data ]) when String.(tag = name) -> Some data
        | _ -> None)
    | _ -> None
  ;;

  (* let filter ~f = function *)
  (*   | Xml.Element (_, _, children) -> List.filter children ~f *)
  (*   | _ -> [] *)
  (* ;; *)

  let get_text (node : Xml_light_types.xml) name =
    match find_child node name with
    | Some value -> text value
    | None -> Fmt.failwith "could not find tag: %s" name
  ;;
end

let tag name = function
  | Xml.Element (tag, _, _) -> String.(tag = name)
  | _ -> false
;;

let to_child (child : Xml_light_types.xml) =
  match child with
  | Xml.Element ("item", _, _) ->
    { title = Query.get_text child "title"
    ; description = Query.get_text child "description"
    ; summary = Query.get_text child "itunes:summary"
    ; link = Query.get_text child "link"
    }
  | _ -> failwith "bad child"
;;

let handle_channel (channel : Xml_light_types.xml) =
  match channel with
  | Xml.Element ("channel", _, children) ->
    Fmt.pr "==== CHANNEL ====\n";
    let items = List.filter children ~f:(tag "item") |> List.map ~f:to_child in
    { title = Query.get_text channel "title"
    ; description = Query.get_text channel "description"
    ; link = Query.get_text channel "link"
    ; items
    }
  | _ -> failwith "handle channel"
;;

let _ =
  let parsed = Xml.parse_file "data/rss.xml" in
  match parsed with
  | Xml.Element ("rss", attrs, [ channel ]) ->
    Fmt.pr "rss\n";
    List.iter attrs ~f:(fun (left, right) -> Fmt.pr "%s | %s\n" left right);
    let rss = handle_channel channel in
    Fmt.pr "CHANNEL: %a@." pp_channel rss
  | _ -> failwith "bad rss"
;;
