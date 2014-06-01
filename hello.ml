try
 while true do
   let line = input_line stdin in (
     print_string line;
     (print_newline ())
     );
   (* Printf.printf "%s\n" line -- This might be important later... *)
 done;
 None  (* THERE IS NO REASON FOR THIS LINE *)
with
 End_of_file -> None
;;
