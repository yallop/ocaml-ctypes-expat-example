open Ctypes
open Foreign

(* types *)
let parser_struct : [`XML_ParserStruct] structure typ = structure "xml_ParserStruct"
let xml_Parser = ptr parser_struct
let start_handler = funptr (ptr void @-> string @-> ptr string @->
			    returning void)
let end_handler = funptr (ptr void @-> string @->
			  returning void)

(* bindings *)
let parser_create = foreign "XML_ParserCreate"
  (ptr void @-> returning xml_Parser)
let parser_free = foreign "XML_ParserFree"
  (xml_Parser @-> returning void)
let set_element_handler = foreign "XML_SetElementHandler"
  (xml_Parser @-> start_handler @-> end_handler @-> returning void)
let parse = foreign "XML_Parse"
  (xml_Parser @-> string @-> int @-> int @-> returning int)


(* friendly interface *)
let parse_string ~start_handler ~end_handler s =
  let p = parser_create null in
  let () = set_element_handler p start_handler end_handler in
  let _ = parse p s (String.length s) 1 in
  parser_free p

(* use case *)
let depth = ref 0

let start_handler _ name _ =
  Printf.printf "%*s%s\n" (!depth * 3) "" name;
  incr depth

let end_handler _ _ =
  decr depth

let () =
  parse_string ~start_handler ~end_handler
    Batteries.(Enum.fold (^) "" (File.lines_of Sys.argv.(1)))
