open Base
open Feed

module Query = struct
  let text (node : Xml_light_types.xml) =
    match node with
    | PCData str -> str
    | _ -> failwith "could not get data"
  ;;

  let find_child (node : Xml_light_types.xml) name =
    match node with
    | Xml.Element (_, _, children) ->
      List.find_map children ~f:(fun child ->
        match child with
        | Xml.Element (tag, _, _) when String.(tag = name) -> Some child
        | _ -> None)
    | _ -> None
  ;;

  let get_node (node : Xml_light_types.xml) name =
    match find_child node name with
    | Some value -> value
    | None ->
      let names = List.map ~f:Xml.tag (Xml.children node) in
      Fmt.failwith
        "[get_node] could not find tag: %s | %s"
        name
        (String.concat ~sep:", " names)
  ;;

  let get_attr (node : Xml_light_types.xml) name =
    match node with
    | Xml.Element (_, attrs, _) ->
      List.find_map attrs ~f:(fun (attr_name, attr_value) ->
        if String.(attr_name = name) then Some attr_value else None)
      |> Option.value_exn
    | _ -> Fmt.failwith "[get_attr] could not find tag: %s" name
  ;;

  let get_text (node : Xml_light_types.xml) name =
    match find_child node name with
    | Some value -> text (List.hd_exn @@ Xml.children value)
    | None ->
      let names = List.map ~f:Xml.tag (Xml.children node) in
      Fmt.failwith
        "[get_text] could not find tag: %s | %s %s"
        name
        (Xml.tag node)
        (String.concat ~sep:", " names)
  ;;
end

let tag name = function
  | Xml.Element (tag, _, _) -> String.(tag = name)
  | _ -> false
;;

let to_enclosure (node : Xml_light_types.xml) : enclosure =
  { url = Query.get_attr node "url"
  ; length = Query.get_attr node "length" |> Int.of_string
  ; kind = Query.get_attr node "type"
  }
;;

let to_child (child : Xml_light_types.xml) =
  match child with
  | Xml.Element ("item", _, _) ->
    let enclosure = Query.get_node child "enclosure" |> to_enclosure in
    { id = Query.get_text child "guid"
    ; title = Query.get_text child "title"
    ; description = Query.get_text child "description"
    ; summary = Query.get_text child "itunes:summary"
    ; duration = Query.get_text child "itunes:duration"
    ; link = Query.get_text child "link"
    ; enclosure
    }
  | _ -> failwith "bad child"
;;

let handle_channel (channel : Xml_light_types.xml) =
  match channel with
  | Xml.Element ("channel", _, children) ->
    let items =
      List.filter children ~f:(tag "item")
      |> List.map ~f:to_child
      |> List.to_array
    in
    { title = Query.get_text channel "title"
    ; description = Query.get_text channel "description"
    ; link = Query.get_text channel "link"
    ; items
    }
  | _ -> failwith "handle channel"
;;

let _ =
  let parsed = Xml.parse_file "../data/rss.xml" in
  match parsed with
  | Xml.Element ("rss", _, [ channel ]) ->
    let rss = handle_channel channel in
    let items =
      Array.map rss.items ~f:(fun item ->
        Fmt.str
          {|
    {
      id = "%s";
      title = "%s";
      description = {inner|%s|inner};
      summary = {inner|%s|inner};
      link = {inner|%s|inner};
      duration = "%s";
      enclosure = {
        url = {inner|%s|inner};
        length = %d;
        kind = "%s";
      };
    }
|}
          item.id
          item.title
          item.description
          item.summary
          item.link
          item.duration
          item.enclosure.url
          item.enclosure.length
          item.enclosure.kind)
      |> String.concat_array ~sep:";\n"
    in
    Fmt.pr
      {|
let channel : Feed.channel = {
  title = "%s";
  description = "%s";
  link = "%s";
  items = [|
    %s
    
  |]
}
|}
      rss.title
      rss.description
      rss.link
      items
  | _ -> failwith "bad rss"
;;
